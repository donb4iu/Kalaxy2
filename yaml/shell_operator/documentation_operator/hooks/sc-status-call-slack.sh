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
  kind: StorageClass
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
    for i in $(seq 0 $(($(jq length "$BINDING_CONTEXT_PATH") - 1))); do
      scName=$(jq -r .[$i].object.metadata.name "$BINDING_CONTEXT_PATH")
      provisioner=$(jq -r .[$i].object.provisioner "$BINDING_CONTEXT_PATH")
      reclaimPolicy=$(jq -r .[$i].object.reclaimPolicy "$BINDING_CONTEXT_PATH")
    # reason/message
      reason=$(jq -r .[$i].object.status.conditions[0].reason "$BINDING_CONTEXT_PATH")
      message=$(jq -r .[$i].object.status.conditions[0].message "$BINDING_CONTEXT_PATH")
      cat <<EOF | kubectl apply -f -
apiVersion: http.crossplane.io/v1alpha1
kind: DisposableRequest
metadata:
  name: slack-webhook-sc-mod-$scName
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
      "text": "Modification detected on StorageClass.\n\nStorage Class Name: $scName\nProvisioner: $provisioner\nReclaimPolicy: $reclaimPolicy\nReason: $reason\nMessage: $message",
      "icon_url": "https://icons8.com/icon/100414/bot"
    }'
EOF

      echo "CRD created for StorageClass modification on '${scName}' with webhook URL."
    done
fi
