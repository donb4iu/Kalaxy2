# MicroK8s NFS CSI


## Reference

## Setup

### MicroK8s
#### dbuddenbaum@arm64-01:~$ microk8s enable helm3

```
Infer repository core for addon helm3
Addon core/helm3 is already enabled
```

#### dbuddenbaum@arm64-01:~$ microk8s helm3 repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts

      "csi-driver-nfs" has been added to your repositories

#### dbuddenbaum@arm64-01:~$ microk8s helm3 repo update

```
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "csi-driver-nfs" chart repository
Update Complete. ⎈Happy Helming!⎈
```
#### dbuddenbaum@arm64-01:~$ microk8s helm3 install csi-driver-nfs csi-driver-nfs/csi-driver-nfs --namespace kube-system --set kubeletDir=/var/snap/microk8s/common/var/lib/kubelet
```
NAME: csi-driver-nfs
LAST DEPLOYED: Sun Feb 18 17:42:07 2024
NAMESPACE: kube-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The CSI NFS Driver is getting deployed to your cluster.

To check CSI NFS Driver pods status, please run:

  kubectl --namespace=kube-system get pods --selector="app.kubernetes.io/instance=csi-driver-nfs" --watch
```

#### dbuddenbaum@arm64-01:~$ microk8s kubectl get csidrivers
```
NAME             ATTACHREQUIRED   PODINFOONMOUNT   STORAGECAPACITY   TOKENREQUESTS   REQUIRESREPUBLISH   MODES        AGE
nfs.csi.k8s.io   false            false            false             <unset>         false               Persistent   9m29s
```

### Storage Class and PV

#### #( 02/18/24@ 5:15PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/microk8s/nfs@main✗✗✗
   kubectl apply -f sc-nfs.yaml

    storageclass.storage.k8s.io/nfs-csi created
#####( 02/18/24@ 5:19PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/microk8s/nfs@main✗✗✗
   kubectl apply -f pvc-nfs.yaml

    persistentvolumeclaim/my-pvc created

#### #( 02/18/24@ 5:28PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/microk8s/k8s-dashboard@main✗✗✗
   kubectl get sc
```
NAME      PROVISIONER      RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
nfs-csi   nfs.csi.k8s.io   Delete          Immediate           false                  9m7s
```

#### dbuddenbaum@arm64-01:~$ microk8s kubectl describe pvc my-pvc
```
Name:          my-pvc
Namespace:     default
StorageClass:  nfs-csi
Status:        Bound
Volume:        pvc-84f2de83-f0cc-48f7-865d-e9ab6b77a9f0
Labels:        <none>
Annotations:   pv.kubernetes.io/bind-completed: yes
               pv.kubernetes.io/bound-by-controller: yes
               volume.beta.kubernetes.io/storage-provisioner: nfs.csi.k8s.io
               volume.kubernetes.io/storage-provisioner: nfs.csi.k8s.io
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:      5Gi
Access Modes:  RWO
VolumeMode:    Filesystem
Used By:       <none>
Events:        <none>
```