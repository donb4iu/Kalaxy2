# Longhorn

- [https://longhorn.io/docs/](https://longhorn.io/docs/)
- [How to install Longhorn (distributed block storage system) for Kubernetes. (Kubernetes Series Part 2)](https://medium.com/@ramkicse/how-to-install-longhorn-distributed-block-storage-system-for-kubernetes-811f8afc4d8e)
- [How to Install Rancher Longhorn on Microk8s, Ubuntu 20.04](https://artsysops.com/2021/10/12/how-to-install-rancher-longhorn-on-microk8s-ubuntu-20-04/)
- [How to Make Rancher Longhorn Work with MicroK8S](https://artsysops.com/2021/10/31/how-to-make-rancher-longhorn-work-with-microk8s/)
- [Using Longhorn Storage](https://github.com/balchua/do-microk8s/blob/master/docs/longhorn.md)
## Validate

###dbuddenbaum@arm64-01:~$ 

sudo microk8s kubectl config view --raw > $HOME/.kube/config

###dbuddenbaum@arm64-01:~$ 

sudo snap install kubectl --classic

```kubectl 1.23.5 from Canonical✓ installed```

###dbuddenbaum@arm64-01:~$ 

sudo apt  install jq

```
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
libjq1 libonig5
The following NEW packages will be installed:
jq libjq1 libonig5
0 upgraded, 3 newly installed, 0 to remove and 27 not upgraded.
Need to get 291 kB of archives.
After this operation, 1022 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://ports.ubuntu.com/ubuntu-ports focal/universe arm64 libonig5 arm64 6.9.4-1 [134 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports focal-updates/universe arm64 libjq1 arm64 1.6-1ubuntu0.20.04.1 [107 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports focal-updates/universe arm64 jq arm64 1.6-1ubuntu0.20.04.1 [49.6 kB]
Fetched 291 kB in 1s (369 kB/s)
Selecting previously unselected package libonig5:arm64.
(Reading database ... 133088 files and directories currently installed.)
Preparing to unpack .../libonig5_6.9.4-1_arm64.deb ...
Unpacking libonig5:arm64 (6.9.4-1) ...
Selecting previously unselected package libjq1:arm64.
Preparing to unpack .../libjq1_1.6-1ubuntu0.20.04.1_arm64.deb ...
Unpacking libjq1:arm64 (1.6-1ubuntu0.20.04.1) ...
Selecting previously unselected package jq.
Preparing to unpack .../jq_1.6-1ubuntu0.20.04.1_arm64.deb ...
Unpacking jq (1.6-1ubuntu0.20.04.1) ...
Setting up libonig5:arm64 (6.9.4-1) ...
Setting up libjq1:arm64 (1.6-1ubuntu0.20.04.1) ...
Setting up jq (1.6-1ubuntu0.20.04.1) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.7) ...
Files have not changed, Decompression not needed
```
###dbuddenbaum@arm64-01:~$ 

curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/scripts/environment_check.sh | bash

```
daemonset.apps/longhorn-environment-check created
waiting for pods to become ready (0/0)
waiting for pods to become ready (0/6)
all pods ready (6/6)

MountPropagation is enabled!

cleaning up...
daemonset.apps "longhorn-environment-check" deleted
clean up complete
```
## Install Prerequisites

###dbuddenbaum@arm64-01:~$

sudo apt install nfs-common open-iscsi -y
```
Reading package lists... Done
Building dependency tree
Reading state information... Done
nfs-common is already the newest version (1:1.3.4-2.5ubuntu3.4).
open-iscsi is already the newest version (2.0.874-7.1ubuntu6.2).
0 upgraded, 0 newly installed, 0 to remove and 27 not upgraded.
```
###dbuddenbaum@arm64-01:~$ 

sudo rm -f /lib/systemd/system/nfs-common.service

###dbuddenbaum@arm64-01:~$

sudo systemctl daemon-reload

###dbuddenbaum@arm64-01:~$ 

sudo systemctl start nfs-common

###dbuddenbaum@arm64-01:~$

sudo systemctl enable  nfs-common

```
nfs-common.service is not a native service, redirecting to systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable nfs-common
```

###dbuddenbaum@arm64-01:~$

sudo systemctl start open-iscsi

###dbuddenbaum@arm64-01:~$

sudo systemctl enable open-iscsi

```
Synchronizing state of open-iscsi.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable open-iscsi
```

## Install Yaml

#( 04/10/22@10:39PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl ns longhorn-system
Context "microk8s" modified.
Active namespace is "longhorn-system".
#( 04/10/22@10:39PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl -n longhorn-system apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/deploy/prerequisite/longhorn-iscsi-installation.yaml

daemonset.apps/longhorn-iscsi-installation created
#( 04/10/22@10:40PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl -n longhorn-system apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/deploy/prerequisite/longhorn-nfs-installation.yaml

daemonset.apps/longhorn-nfs-installation created
#( 04/10/22@10:42PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/deploy/longhorn.yaml
Warning: resource namespaces/longhorn-system is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
namespace/longhorn-system configured
Warning: resource serviceaccounts/longhorn-service-account is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
serviceaccount/longhorn-service-account configured
Warning: resource clusterroles/longhorn-role is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
clusterrole.rbac.authorization.k8s.io/longhorn-role configured
Warning: resource clusterrolebindings/longhorn-bind is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
clusterrolebinding.rbac.authorization.k8s.io/longhorn-bind configured
customresourcedefinition.apiextensions.k8s.io/engines.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/replicas.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/settings.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/volumes.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/engineimages.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/nodes.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/instancemanagers.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/sharemanagers.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/backingimages.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/backingimagemanagers.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/backingimagedatasources.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/backuptargets.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/backupvolumes.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/backups.longhorn.io created
customresourcedefinition.apiextensions.k8s.io/recurringjobs.longhorn.io created
Warning: resource configmaps/longhorn-default-setting is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
configmap/longhorn-default-setting configured
Warning: policy/v1beta1 PodSecurityPolicy is deprecated in v1.21+, unavailable in v1.25+
Warning: resource podsecuritypolicies/longhorn-psp is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
podsecuritypolicy.policy/longhorn-psp configured
Warning: resource roles/longhorn-psp-role is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
role.rbac.authorization.k8s.io/longhorn-psp-role configured
Warning: resource rolebindings/longhorn-psp-binding is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
rolebinding.rbac.authorization.k8s.io/longhorn-psp-binding configured
Warning: resource configmaps/longhorn-storageclass is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
configmap/longhorn-storageclass configured
daemonset.apps/longhorn-manager created
Warning: resource services/longhorn-backend is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
service/longhorn-backend configured
Warning: resource services/longhorn-engine-manager is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
service/longhorn-engine-manager configured
Warning: resource services/longhorn-replica-manager is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
service/longhorn-replica-manager configured
deployment.apps/longhorn-ui created
Warning: resource services/longhorn-frontend is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
service/longhorn-frontend configured
deployment.apps/longhorn-driver-deployer created
#


## Install Helm

###( 04/02/22@ 7:31PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/KubeScrape_PrometheusManifests@main✗✗✗**

helm repo add longhorn https://charts.longhorn.io

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/dbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/dbuddenbaum/.kube/config
"longhorn" has been added to your repositories
```

###( 04/02/22@ 7:37PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/KubeScrape_PrometheusManifests@main✗✗✗**

helm repo update

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/dbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/dbuddenbaum/.kube/config
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "longhorn" chart repository
Update Complete. ⎈Happy Helming!⎈
```

###( 04/02/22@ 7:38PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/KubeScrape_PrometheusManifests@main✗✗✗**

kubectl create namespace longhorn-system

```
namespace/longhorn-system created
```

###( 04/02/22@ 7:38PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/KubeScrape_PrometheusManifests@main✗✗✗**

helm install longhorn longhorn/longhorn --namespace longhorn-system

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/dbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/dbuddenbaum/.kube/config
W0402 19:38:53.691241    2463 warnings.go:70] policy/v1beta1 PodSecurityPolicy is deprecated in v1.21+, unavailable in v1.25+
W0402 19:38:54.421354    2463 warnings.go:70] policy/v1beta1 PodSecurityPolicy is deprecated in v1.21+, unavailable in v1.25+
NAME: longhorn
LAST DEPLOYED: Sat Apr  2 19:38:50 2022
NAMESPACE: longhorn-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Longhorn is now installed on the cluster!

Please wait a few minutes for other Longhorn components such as CSI deployments, Engine Images, and Instance Managers to be initialized.

Visit our documentation at https://longhorn.io/docs/
```


###( 04/02/22@11:50PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy/yaml/longhorn@main✗✗✗**

kubectl -n longhorn-system apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/deploy/prerequisite/longhorn-iscsi-installation.yaml

```
daemonset.apps/longhorn-iscsi-installation created
```

###( 04/03/22@ 2:26PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy/yaml/longhorn@main✗✗✗**

kubectl -n longhorn-system apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.2.4/deploy/prerequisite/longhorn-nfs-installation.yaml

## Uninstall

###( 04/10/22@ 7:41PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl delete customresourcedefinition nodes.longhorn.io

###( 04/10/22@ 7:54PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl patch crd/nodes.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge

```
customresourcedefinition.apiextensions.k8s.io/nodes.longhorn.io patched
```
###( 04/10/22@ 7:54PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
kubectl patch crd/engineimages.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge

```
customresourcedefinition.apiextensions.k8s.io/engineimages.longhorn.io patched
```


helm uninstall longhorn --namespace longhorn-system