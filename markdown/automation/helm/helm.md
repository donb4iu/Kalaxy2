# Helm

![alt text](image.png)

## References

- [Deploy using ArgoCD and Github Actions](https://medium.com/@mssantossousa/deploy-using-argocd-and-github-actions-888f7370e480)
- [Template everything with Helm](https://medium.com/@maorfr/template-everything-with-helm-48e5a32ff72d)
- [Getting Started With Helm v3](https://medium.com/swlh/getting-started-with-helm-v3-3c07ba63c9f8)

## Commands

### # Package the chart
helm package mychart

### # Create a directory for the local repo
mkdir -p ~/my-helm-repo

### # Move the package to the local repo directory
mv mychart-0.1.0.tgz ~/my-helm-repo/

### # Create an index file for the repo
helm repo index ~/my-helm-repo --url http://127.0.0.1:8080/

#### #( 09/04/24@ 3:12PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/helm@main✗✗✗
   helm repo index ~/Documents/Kalaxy2/helm/kalaxy2_charts  --url http://127.0.0.1:8080/

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
```

### # Start a local web server to serve the repo
cd ~/my-helm-repo
python3 -m http.server 8080

### # Add the local repo to Helm
helm repo add my-local-repo http://127.0.0.1:8080/

#### #( 09/04/24@ 3:16PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/helm/kalaxy2_charts@main✗✗✗
   helm repo add kalaxy2-charts http://127.0.0.1:8081/

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
"kalaxy2-charts" has been added to your repositories
```

### # Update Helm to recognize the new repo
helm repo update

#### #( 09/04/24@ 3:17PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/helm/kalaxy2_charts@main✗✗✗
   helm repo update

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "kalaxy2-charts" chart repository
...Successfully got an update from the "my-local-repo" chart repository
...Successfully got an update from the "gatekeeper" chart repository
...Successfully got an update from the "traefik" chart repository
...Successfully got an update from the "jetstack" chart repository
...Successfully got an update from the "kubernetes-dashboard" chart repository
...Successfully got an update from the "prometheus-community" chart repository
...Successfully got an update from the "stable" chart repository
```


### # Install the chart from the local repo
helm install my-release my-local-repo/mychart


#### #( 09/04/24@ 3:22PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/helm/kalaxy2_charts@main✗✗✗
   helm install fakenews-release ~/Documents/Kalaxy2/helm/kalaxy2_charts/app-fakenews-flask-0.1.0.tgz

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
W0904 15:23:24.793878   14427 warnings.go:70] unknown field "spec.affinity"
NAME: fakenews-release
LAST DEPLOYED: Wed Sep  4 15:23:24 2024
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

### # List Installed Charts

#### #( 09/04/24@ 3:24PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/helm/kalaxy2_charts@main✗✗✗
   helm list

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
NAME            	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART                   	APP VERSION
fakenews-release	default  	1       	2024-09-04 15:23:24.463069 -0400 EDT	deployed	app-fakenews-flask-0.1.0	1.16.0
ollama-release  	default  	1       	2024-08-14 18:36:58.034887 -0400 EDT	deployed	server-0.1.0            	1.1.0
```

### # Uninstall Charts

#### #( 09/04/24@ 3:28PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/helm/kalaxy2_charts@main✗✗✗
   helm uninstall fakenews-release

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
release "fakenews-release" uninstalled
```