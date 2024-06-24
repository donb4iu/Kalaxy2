# OpenEBS

- [OpenEBS Documentation](https://openebs.io/docs)

## Install

### dbuddenbaum@arm64-01:~$ 
microk8s enable openebs

```
Addon dns is already enabled.
Addon helm3 is already enabled.
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /var/snap/microk8s/3207/credentials/client.config
"openebs" has been added to your repositories
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /var/snap/microk8s/3207/credentials/client.config
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "csi-driver-nfs" chart repository
...Successfully got an update from the "longhorn" chart repository
...Successfully got an update from the "openebs" chart repository
Update Complete. ⎈Happy Helming!⎈
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /var/snap/microk8s/3207/credentials/client.config
NAME: openebs
LAST DEPLOYED: Thu May 26 23:13:50 2022
NAMESPACE: openebs
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Successfully installed OpenEBS.

Check the status by running: kubectl get pods -n openebs

The default values will install NDM and enable OpenEBS hostpath and device
storage engines along with their default StorageClasses. Use `kubectl get sc`
to see the list of installed OpenEBS StorageClasses.

**Note**: If you are upgrading from the older helm chart that was using cStor
and Jiva (non-csi) volumes, you will have to run the following command to include
the older provisioners:

helm upgrade openebs openebs/openebs \
--namespace openebs \
--set legacy.enabled=true \
--reuse-values

For other engines, you will need to perform a few more additional steps to
enable the engine, configure the engines (e.g. creating pools) and create
StorageClasses.

For example, cStor can be enabled using commands like:

helm upgrade openebs openebs/openebs \
--namespace openebs \
--set cstor.enabled=true \
--reuse-values

For more information,
- view the online documentation at https://openebs.io/ or
- connect with an active community on Kubernetes slack #openebs channel.
  OpenEBS is installed


-----------------------

When using OpenEBS with a single node MicroK8s, it is recommended to use the openebs-hostpath StorageClass
An example of creating a PersistentVolumeClaim utilizing the openebs-hostpath StorageClass


kind: PersistentVolumeClaim
apiVersion: v1
metadata:
name: local-hostpath-pvc
spec:
storageClassName: openebs-hostpath
accessModes:
- ReadWriteOnce
resources:
requests:
storage: 5G



-----------------------

If you are planning to use OpenEBS with multi nodes, you can use the openebs-jiva-csi-default StorageClass.
An example of creating a PersistentVolumeClaim utilizing the openebs-jiva-csi-default StorageClass


kind: PersistentVolumeClaim
apiVersion: v1
metadata:
name: jiva-volume-claim
spec:
storageClassName: openebs-jiva-csi-default
accessModes:
- ReadWriteOnce
resources:
requests:
storage: 5G
```

## openEBS setup

### #( 05/26/22@ 7:17PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy/yaml/microk8s/openEBS@main✗✗✗

kubectl apply -f openebs_pvc.yaml

    persistentvolumeclaim/jiva-volume-claim created

### #( 05/26/22@ 7:26PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy/yaml/microk8s/openEBS@main✗✗✗

kubectl get pvc

    NAME                STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS               AGE
    my-pvc              Bound    pvc-6177950b-c008-4ad1-aaa1-c0f06a529b69   5Gi        RWO            nfs-csi                    46d
    jiva-volume-claim   Bound    pvc-8939719d-c33f-46a4-99b2-b8a49c41c1bd   5G         RWO            openebs-jiva-csi-default   9m30s


