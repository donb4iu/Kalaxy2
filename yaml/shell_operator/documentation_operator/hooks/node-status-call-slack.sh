#!/usr/bin/env bash

# Define the secret details
SECRET_NAMESPACE="documentation"
SECRET_NAME="webhook-secret"
SECRET_KEY="webhook-url"

if [[ $1 == "--config" ]]; then
    cat <<EOF
configVersion: v1
kubernetes:
- apiVersion: v1
  kind: Node
  executeHookOnEvent: ["Modified"]
EOF
else
    report_message=true
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

    # Prepare the message with all conditions
      messagestatic="Modification detected on node.\n\nNode Name: $nodeName"

    # Check and append conditions to the message
      for condition in $(echo "$conditions" | jq -r '.[] | @base64'); do
          _jq() {
              echo "$condition" | base64 --decode | jq -r "${1}"
          }

          type=$(_jq '.type')
          status=$(_jq '.status')
          reason=$(_jq '.reason')
          messageDetail=$(_jq '.message')          

    # check posibilities
    
          case "$type" in
              "Ready")
                  if [[ "$status" == "False" ]]; then
                      message="$messagestatic\nStatus: Ready\nReason: $reason\nMessage: $messageDetail"
                  else
                      message="$messagestatic\nStatus: Ready"
                  fi
                  ;;
              "OutOfDisk")
                  if [[ "$status" == "True" ]]; then
                      message="$messagestatic\nStatus: OutOfDisk\nReason: $reason\nMessage: $messageDetail"
                  fi
                  ;;
              "MemoryPressure")
                  if [[ "$status" == "True" ]]; then
                      message="$messagestatic\nStatus: MemoryPressure\nReason: $reason\nMessage: $messageDetail"
                  fi
                  ;;
              "DiskPressure")
                  if [[ "$status" == "True" ]]; then
                      message="$messagestatic\nStatus: DiskPressure\nReason: $reason\nMessage: $messageDetail"
                  fi
                  ;;
              "NetworkUnavailable")
                  if [[ "$status" == "True" ]]; then
                      message="$messagestatic\nStatus: NetworkUnavailable\nReason: $reason\nMessage: $messageDetail"
                  fi
                  ;;
              "SchedulingDisabled")
                  if [[ "$status" == "True" ]]; then
                      message="$messagestatic\nStatus: SchedulingDisabled\nReason: $reason\nMessage: $messageDetail"
                  fi
                  ;;
              *)
                  message="$messagestatic\nStatus: Unknown Condition Type $type\nReason: $reason\nMessage: $messageDetail"
                  report_message=false
                  ;;
          esac
      done

    # Create a YAML for the CRD to notify via webhook
    if $report_message; then
      cat <<EOF | kubectl apply -f -
apiVersion: http.crossplane.io/v1alpha1
kind: DisposableRequest
metadata:
  name: slack-webhook-node-mod-${nodeName}-$(date +%s)
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
      "text": "Modification detected on node.\n\nNode Name: $nodeName\nStatus: $nodeStatus\nReason: $reason\nMessage: $message",
      "icon_url": "https://icons8.com/icon/100414/bot"
    }'
EOF

      echo "CRD created for node modification on '${nodeName}' with webhook URL."
    done
fi
