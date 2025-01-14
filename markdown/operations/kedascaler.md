# KEDA Scaler



# References

- [![alt text](image-13.png)](https://keda.sh/)



## Installation

### (base) #( 01/14/25@ 4:56PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes/keda@main✗✗✗
   helm repo add kedacore https://kedacore.github.io/charts

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
"kedacore" has been added to your repositories
```

### (base) #( 01/14/25@ 5:02PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes/keda@main✗✗✗
   helm repo update

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
Hang tight while we grab the latest from your chart repositories...
...Unable to get an update from the "kalaxy2-charts" chart repository (http://127.0.0.1:8081/):
	Get "http://127.0.0.1:8081/index.yaml": dial tcp 127.0.0.1:8081: connect: connection refused
...Unable to get an update from the "my-local-repo" chart repository (http://127.0.0.1:8081/):
	Get "http://127.0.0.1:8081/index.yaml": dial tcp 127.0.0.1:8081: connect: connection refused
...Successfully got an update from the "kedacore" chart repository
...Successfully got an update from the "traefik" chart repository
...Successfully got an update from the "prometheus-community" chart repository
...Successfully got an update from the "jetstack" chart repository
...Successfully got an update from the "crossplane-stable" chart repository
...Successfully got an update from the "kubernetes-dashboard" chart repository
...Successfully got an update from the "gatekeeper" chart repository
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈Happy Helming!⎈
```

### (base) #( 01/14/25@ 5:02PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/knotes/keda@main✗✗✗
   helm install keda kedacore/keda --namespace knote --create-namespace

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
NAME: keda
LAST DEPLOYED: Tue Jan 14 17:03:13 2025
NAMESPACE: knote
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
:::^.     .::::^:     :::::::::::::::    .:::::::::.                   .^.
7???~   .^7????~.     7??????????????.   :?????????77!^.              .7?7.
7???~  ^7???7~.       ~!!!!!!!!!!!!!!.   :????!!!!7????7~.           .7???7.
7???~^7????~.                            :????:    :~7???7.         :7?????7.
7???7????!.           ::::::::::::.      :????:      .7???!        :7??77???7.
7????????7:           7???????????~      :????:       :????:      :???7?5????7.
7????!~????^          !77777777777^      :????:       :????:     ^???7?#P7????7.
7???~  ^????~                            :????:      :7???!     ^???7J#@J7?????7.
7???~   :7???!.                          :????:   .:~7???!.    ~???7Y&@#7777????7.
7???~    .7???7:      !!!!!!!!!!!!!!!    :????7!!77????7^     ~??775@@@GJJYJ?????7.
7???~     .!????^     7?????????????7.   :?????????7!~:      !????G@@@@@@@@5??????7:
::::.       :::::     :::::::::::::::    .::::::::..        .::::JGGGB@@@&7:::::::::
                                                                      ?@@#~
                                                                      P@B^
                                                                    :&G:
                                                                    !5.
                                                                    .Kubernetes Event-driven Autoscaling (KEDA) - Application autoscaling made simple.

Get started by deploying Scaled Objects to your cluster:
    - Information about Scaled Objects : https://keda.sh/docs/latest/concepts/
    - Samples: https://github.com/kedacore/samples

Get information about the deployed ScaledObjects:
  kubectl get scaledobject [--namespace <namespace>]

Get details about a deployed ScaledObject:
  kubectl describe scaledobject <scaled-object-name> [--namespace <namespace>]

Get information about the deployed ScaledObjects:
  kubectl get triggerauthentication [--namespace <namespace>]

Get details about a deployed ScaledObject:
  kubectl describe triggerauthentication <trigger-authentication-name> [--namespace <namespace>]

Get an overview of the Horizontal Pod Autoscalers (HPA) that KEDA is using behind the scenes:
  kubectl get hpa [--all-namespaces] [--namespace <namespace>]

Learn more about KEDA:
- Documentation: https://keda.sh/
- Support: https://keda.sh/support/
- File an issue: https://github.com/kedacore/keda/issues/new/choose
```