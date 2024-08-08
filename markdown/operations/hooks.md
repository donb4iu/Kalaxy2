# Crossplane Hooks

![alt text](image-5.png)

## References

- [Introducing provider-http: Empowering Crossplane with HTTP Interactions](https://blog.crossplane.io/introducing-provider-http-empowering-crossplane-with-http-interactions/)

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
