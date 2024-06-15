# Kube Shark
![alt text](image-1.png)
## References

- [Navigating Kubernetes Networks: How KubeShark Makes It Simple](https://medium.com/@thekubeguy/navigating-kubernetes-networks-how-kubeshark-makes-it-simple-c39521144828)
- [![alt text](image-2.png)](https://www.kubeshark.co/)


## Uninstall

### #( 06/03/24@ 4:16PM )( donbuddenbaum@donbs-imac ):~/Documents
  
   kubeshark clean

```
2024-06-03T16:28:53-04:00 INF versionCheck.go:23 > Checking for a newer version...
2024-06-03T16:28:53-04:00 INF helm.go:173 > uninstall: Deleting kubeshark
2024-06-03T16:28:54-04:00 WRN versionCheck.go:48 > There is a new release! v52.3.59 -> v52.3.62 Please upgrade to the latest release, as new releases are not always backward compatible. Run: command="sh <(curl -Ls https://kubeshark.co/install)"
2024-06-03T16:28:54-04:00 INF helm.go:173 > uninstall: given cascade value: , defaulting to delete propagation background
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-worker-metrics" Service
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-front" Service
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-hub" Service
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-hub" Deployment
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-front" Deployment
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-worker-daemon-set" DaemonSet
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-self-config-role-binding" RoleBinding
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-self-config-role" Role
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-cluster-role-binding-default" ClusterRoleBinding
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-cluster-role-default" ClusterRole
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-config-map" ConfigMap
2024-06-03T16:28:54-04:00 INF helm.go:173 > Starting delete for "kubeshark-nginx-config-map" ConfigMap
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-saml-x509-key-secret" Secret
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-secret" Secret
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-saml-x509-crt-secret" Secret
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-service-account" ServiceAccount
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-hub-network-policy" NetworkPolicy
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-worker-network-policy" NetworkPolicy
2024-06-03T16:28:55-04:00 INF helm.go:173 > Starting delete for "kubeshark-front-network-policy" NetworkPolicy
2024-06-03T16:28:55-04:00 INF helm.go:173 > purge requested for kubeshark
2024-06-03T16:28:55-04:00 INF clean.go:27 > Uninstalled the Helm release: kubeshark
```