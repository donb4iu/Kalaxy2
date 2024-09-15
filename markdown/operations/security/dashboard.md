# Dashboard Local Trusted



## Setup

### Script

```
#!/bin/bash

# Variables
DASHBOARD_IP="192.168.2.20"
NAMESPACE="kube-system"
CERT_NAME="dashboard-selfsigned-tls"
SECRET_NAME="dashboard-selfsigned-tls"
INGRESS_NAME="dashboard-ingress"
SERVICE_NAME="k8s-dashboard"
KEY_FILE="dashboard.key"
CRT_FILE="dashboard.crt"

# Step 1: Generate a Self-Signed Certificate for the IP Address
echo "Generating self-signed certificate for IP: $DASHBOARD_IP..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout $KEY_FILE -out $CRT_FILE \
  -subj "/CN=$DASHBOARD_IP" \
  -addext "subjectAltName=IP:$DASHBOARD_IP"

# Step 2: Create Kubernetes Secret from the Generated Certificate
echo "Creating Kubernetes secret for the self-signed certificate..."
kubectl create secret tls $SECRET_NAME \
  --cert=$CRT_FILE \
  --key=$KEY_FILE \
  --namespace $NAMESPACE

# Step 3: Create an Ingress Resource for the Dashboard
echo "Creating Ingress resource for Kubernetes Dashboard..."

cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: $INGRESS_NAME
  namespace: $NAMESPACE
  annotations:
    kubernetes.io/ingress.class: "nginx"
spec:
  rules:
  - host: $DASHBOARD_IP
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: $SERVICE_NAME
            port:
              number: 443
  tls:
  - hosts:
    - $DASHBOARD_IP
    secretName: $SECRET_NAME
EOF

echo "Self-signed certificate and Ingress setup completed

```

### Execution

This script will:

Generate a self-signed certificate for 192.168.2.20.
Create a Kubernetes secret to store the certificate.
Create an Ingress resource for the Kubernetes dashboard with TLS.
After running the script, you can access the Kubernetes dashboard at https://192.168.2.20 from your local machine. Remember to mark the certificate as trusted on any devices from which you'll access the dashboard to avoid the "untrusted certificate" error.

```
chmod +x setup_dashboard_ssl.sh
./setup_dashboard_ssl.sh
```