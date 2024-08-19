# Crossplane Hooks

![alt text](image-5.png)

## References

- [Introducing provider-http: Empowering Crossplane with HTTP Interactions](https://blog.crossplane.io/introducing-provider-http-empowering-crossplane-with-http-interactions/)

## Notes

In Kubernetes, nodes can have various conditions that describe their current state. Here’s a list of common node conditions and their meanings:

Ready:

```
Type: Ready
Description: Indicates whether the node is healthy and ready to accept pods. It is the most critical condition for a node. A True status means the node is healthy and can run pods, while False means the node is not ready.

OutOfDisk:

Type: OutOfDisk
Description: Indicates whether the node is running out of disk space. If True, the node is out of disk space.

MemoryPressure:

Type: MemoryPressure
Description: Indicates whether the node is under memory pressure. If True, the node is running low on memory.

DiskPressure:

Type: DiskPressure
Description: Indicates whether the node is under disk pressure. If True, the node is running low on disk space.

NetworkUnavailable:

Type: NetworkUnavailable
Description: Indicates whether the node’s network is unavailable. If True, the node’s network is not properly configured or is down.

SchedulingDisabled:

Type: SchedulingDisabled
Description: Indicates whether scheduling of new pods to the node is disabled. If True, new pods will not be scheduled to the node.

Unschedulable (Deprecated):

Type: Unschedulable
Description: An older condition that was used to indicate if a node was unschedulable. It has been replaced by SchedulingDisabled.
```

## Implementations

- node-status-call-slask
- pod-create-call-slack
- pod-delete-call-stack
- pv-status-call-slack
- pvc-status-call-slack
- sc-status-call-slack

```
#!/usr/bin/env bash


# Define the secret details
SECRET_NAMESPACE="SECRET_NAMESPACE"
SECRET_NAME="SECRET_NAME"
SECRET_KEY="SECRET_KEY"
KIND="KIND"


if [[ $1 == "--config" ]]; then
    cat <<EOF
configVersion: v1
kubernetes:
- apiVersion: v1
  kind: $KIND
  executeHookOnEvent: ["Modified"]
EOF
else
    # Retrieve the webhook URL from the secret
    WEBHOOK_URL=$(kubectl get secret $SECRET_NAME -n $SECRET_NAMESPACE -o jsonpath="{.data.$SECRET_KEY}" | base64 -d)

    if [[ -z "$WEBHOOK_URL" ]]; then
        echo "Error: WEBHOOK_URL is empty or the secret does not exist."
        exit 1
    fi

    # Iterate over all events in the binding context
    for i in $(seq 0 $(($(jq length $BINDING_CONTEXT_PATH) - 1))); do
        nodeName=$(jq -r .[$i].object.metadata.name $BINDING_CONTEXT_PATH)
        conditions=$(jq -r .[$i].object.status.conditions $BINDING_CONTEXT_PATH)

        # Check if the node is in a NotReady state
        nodeStatus=$(echo "$conditions" | jq -r '.[] | select(.type == "Ready") | .status')

        if [[ "$nodeStatus" != "True" ]]; then
            reason=$(echo "$conditions" | jq -r '.[] | select(.type == "Ready") | .reason')
            message=$(echo "$conditions" | jq -r '.[] | select(.type == "Ready") | .message')

            # Create a YAML for the CRD to notify via webhook
            cat <<EOF | kubectl apply -f -
apiVersion: http.crossplane.io/v1alpha1
kind: DisposableRequest
metadata:
  name: slack-webhook-$KIND-error-$nodeName
spec:
  deletionPolicy: Orphan
  forProvider:
    url: $WEBHOOK_URL
    method: POST
    headers:
      Content-Type:
        - application/json
    body: '{
      "channel": "#kalaxy2",
      "username": "webhookbot",
      "text": "Error detected on '${KIND}'.\n\nNode Name: $nodeName\nStatus: $nodeStatus\nReason: $reason\nMessage: $message",
      "icon_url": "https://icons8.com/icon/100414/bot"
    }'
EOF

            echo "CRD created for '${KIND}' error on '${nodeName}' with webhook URL."
        fi
    done
fi
````
