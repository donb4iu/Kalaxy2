# ArgoCD Image Updater

## References

 - [https://argocd-image-updater.readthedocs.io/en/stable/install/installation/](https://argocd-image-updater.readthedocs.io/en/stable/install/installation/)
 - [How to Base64 Encode Kubernetes Secrets](https://www.cloudytuts.com/tutorials/kubernetes/how-to-base64-encode-kubernetes-secrets/)
 - [argoproj-labs/argocd-image-updater](https://github.com/argoproj-labs/argocd-image-updater/tree/master/config)

## Setup

### Add Image updater
#### #( 07/08/24@ 1:43PM )( donbuddenbaum@donbs-imac ):~
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

```
serviceaccount/argocd-image-updater created
role.rbac.authorization.k8s.io/argocd-image-updater created
rolebinding.rbac.authorization.k8s.io/argocd-image-updater created
configmap/argocd-image-updater-config created
configmap/argocd-image-updater-ssh-config created
secret/argocd-image-updater-secret created
deployment.apps/argocd-image-updater created
```

#### update configmaps

- argocd-image-updater-config
```
data:
  # log.level can be one of trace, debug, info, warn or error
  log.level: debug
  ```
- argocd-cm
```
data:
  # ...
  accounts.image-updater: apiKey
  ```
- argocd-rbac-cm
```
p, role:image-updater, applications, get, */*, allow
p, role:image-updater, applications, update, */*, allow
g, image-updater, role:image-updater
```
- argocd.token in a secret named argocd-image-updater-secret
    - echo -n 'super-secret-password' | base64
    - printf instead: var=$(printf '%s:%s' "$username" "$password" | base64)


#### #( 07/08/24@ 5:35PM )( donbuddenbaum@donbs-imac ):~
  kubectl create secret generic argocd-image-updater-secret --from-literal argocd.token=$var --dry-run -o yaml |
  
  kubectl -n argocd apply -f -
```
W0708 17:37:04.010061   15122 helpers.go:704] --dry-run is deprecated and can be replaced with --dry-run=client.
secret/argocd-image-updater-secret configured
```

#### #( 07/08/24@ 5:37PM )( donbuddenbaum@donbs-imac ):~
   kubectl -n argocd rollout restart deployment argocd-image-updater

    deployment.apps/argocd-image-updater restarted
