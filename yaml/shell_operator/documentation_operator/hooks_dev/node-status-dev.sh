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
        message="Modification detected on node.\n\nNode Name: $nodeName"

        # Check and append conditions to the message
        for condition in $(echo "$conditions" | jq -r '.[] | @base64'); do
            _jq() {
                echo "$condition" | base64 --decode | jq -r "${1}"
            }

            type=$(_jq '.type')
            status=$(_jq '.status')
            reason=$(_jq '.reason')
            messageDetail=$(_jq '.message')

            # Check possibilities
            case "$type" in
                "Ready")
                    if [[ "$status" == "False" ]]; then
                        message="$message\nStatus: Ready\nReason: $reason\nMessage: $messageDetail"
                    else
                        message="$message\nStatus: Ready"
                    fi
                    ;;
                "OutOfDisk")
                    if [[ "$status" == "True" ]]; then
                        message="$message\nStatus: OutOfDisk\nReason: $reason\nMessage: $messageDetail"
                    fi
                    ;;
                "MemoryPressure")
                    if [[ "$status" == "True" ]]; then
                        message="$message\nStatus: MemoryPressure\nReason: $reason\nMessage: $messageDetail"
                    fi
                    ;;
                "DiskPressure")
                    if [[ "$status" == "True" ]]; then
                        message="$message\nStatus: DiskPressure\nReason: $reason\nMessage: $messageDetail"
                    fi
                    ;;
                "NetworkUnavailable")
                    if [[ "$status" == "True" ]]; then
                        message="$message\nStatus: NetworkUnavailable\nReason: $reason\nMessage: $messageDetail"
                    fi
                    ;;
            esac
        done

        # Send the message to the webhook URL
        if [[ -n "$message" ]]; then
            curl -X POST -H "Content-Type: application/json" -d "{\"text\": \"$message\"}" "$WEBHOOK_URL"
        fi
    done
fi
