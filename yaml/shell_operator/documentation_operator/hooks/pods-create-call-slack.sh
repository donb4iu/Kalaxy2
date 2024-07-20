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
  kind: Pod
  executeHookOnEvent: ["Added"]
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
		podName=$(jq -r .[$i].object.metadata.name $BINDING_CONTEXT_PATH)
		podNamespace=$(jq -r .[$i].object.metadata.namespace $BINDING_CONTEXT_PATH)
		creationTimestamp=$(jq -r .[$i].object.metadata.creationTimestamp $BINDING_CONTEXT_PATH)
		image=$(jq -r .[$i].object.spec.containers[0].image $BINDING_CONTEXT_PATH)
		# Create a YAML for the CRD
		cat <<EOF | kubectl apply -f -
apiVersion: http.crossplane.io/v1alpha1
kind: DisposableRequest
metadata:
  name: slack-webhook-creation-$podName
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
      "text": "A new pod has been created.\n\nPod Name: $podName\nNamespace: $podNamespace\nCreation Timestamp: $creationTimestamp\nImage: $image",
      "icon_url": "https://icons8.com/icon/100414/bot"
    }'
EOF

		echo "CRD created for created pod '${podName}' with webhook URL."
	done
fi
