# Minio

## References

- [Easy Guide: Setting Up Minio with MicroK8s Kubernetes](https://medium.com/@kapincev/easy-guide-setting-up-minio-with-microk8s-kubernetes-321048d901ac)

- [https://github.com/minio/operator](https://github.com/minio/operator)



## Setup

### dbuddenbaum@arm64-01:~$ 
sudo microk8s enable minio -c 300Gi -s openebs-jiva-csi-default

```
Infer repository core for addon minio
Infer repository core for addon dns
Addon core/dns is already enabled
Infer repository core for addon hostpath-storage
Addon core/hostpath-storage is already enabled
Download kubectl-minio
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 35.6M  100 35.6M    0     0  9495k      0  0:00:03  0:00:03 --:--:-- 10.9M
Initialize minio operator
namespace/minio-operator created
serviceaccount/minio-operator created
clusterrole.rbac.authorization.k8s.io/minio-operator-role created
clusterrolebinding.rbac.authorization.k8s.io/minio-operator-binding created
customresourcedefinition.apiextensions.k8s.io/tenants.minio.min.io created
service/operator created
deployment.apps/minio-operator created
serviceaccount/console-sa created
secret/console-sa-secret created
clusterrole.rbac.authorization.k8s.io/console-sa-role created
clusterrolebinding.rbac.authorization.k8s.io/console-sa-binding created
configmap/console-env created
service/console created
deployment.apps/console created
-----------------

To open Operator UI, start a port forward using this command:

kubectl minio proxy -n minio-operator

-----------------
Create default tenant with:

  Name: microk8s
  Capacity: 300Gi
  Servers: 1
  Volumes: 1
  Storage class: openebs-jiva-csi-default
  TLS: no
  Prometheus: no

+ /var/snap/microk8s/common/plugins/kubectl-minio tenant create microk8s --storage-class openebs-jiva-csi-default --capacity 300Gi --servers 1 --volumes 1 --namespace minio-operator --enable-audit-logs=false --disable-tls --enable-prometheus=false
W0229 21:14:49.752537   71434 warnings.go:70] unknown field "spec.pools[0].volumeClaimTemplate.metadata.creationTimestamp"

Tenant 'microk8s' created in 'minio-operator' Namespace

  Username: ICNSF7L1666PNW0K0TBO
  Password: pc9pNbTlBsotppIH6hjuB9KUMRxQaeeItkI1bZif
  Note: Copy the credentials to a secure location. MinIO will not display these again.

APPLICATION	SERVICE NAME    	NAMESPACE     	SERVICE TYPE	SERVICE PORT
MinIO      	minio           	minio-operator	ClusterIP   	80
Console    	microk8s-console	minio-operator	ClusterIP   	9090

+ set +x
================================
Enabled minio addon.

You can manage minio tenants using the kubectl-minio plugin.

For more details, use

    microk8s kubectl-minio --help
```


## Setup Node Storage

### dbuddenbaum@arm64-01:~$ 
lsblk -f

```
NAME   FSTYPE   LABEL       UUID                                 FSAVAIL FSUSE% MOUNTPOINT
loop0  squashfs                                                        0   100% /snap/core18/1883
loop1  squashfs                                                        0   100% /snap/core20/2107
loop2  squashfs                                                        0   100% /snap/lxd/24065
loop3  squashfs                                                        0   100% /snap/core18/2810
loop4  squashfs                                                        0   100% /snap/core20/2186
loop5  squashfs                                                        0   100% /snap/lxd/16103
loop6  squashfs                                                        0   100% /snap/microk8s/6357
loop7  squashfs                                                        0   100% /snap/snapd/20674
loop8  squashfs                                                        0   100% /snap/microk8s/6564
sda
├─sda1 vfat     system-boot B726-57E2                              81.7M    68% /boot/firmware
└─sda2 ext4     writable    483efb12-d682-4daf-9b34-6e2f774b56f7    201G     5% /
sdb
└─sdb1 vfat     UNTITLED    B1E2-1721
```

### dbuddenbaum@arm64-01:~$ 
fdisk dev/sdb

```
Welcome to fdisk (util-linux 2.34).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): d
Selected partition 1
Partition 1 has been deleted.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### dbuddenbaum@amd64-03:~$ 
sudo mkfs.ext4 /dev/sdb

```
mke2fs 1.45.5 (07-Jan-2020)
Found a dos partition table in /dev/sdb
Proceed anyway? (y,N) y
Creating filesystem with 244190646 4k blocks and 61054976 inodes
Filesystem UUID: 95ec5a28-daf8-475a-b6f0-06b20d1f154f
Superblock backups stored on blocks:
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
	4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
	102400000, 214990848

Allocating group tables: done
Writing inode tables: done
Creating journal (262144 blocks): done
Writing superblocks and filesystem accounting information: done
```

### dbuddenbaum@arm64-01:~$ 
lsblk -f

```
NAME   FSTYPE   LABEL       UUID                                 FSAVAIL FSUSE% MOUNTPOINT
loop0  squashfs                                                        0   100% /snap/core18/1883
loop1  squashfs                                                        0   100% /snap/core20/2107
loop2  squashfs                                                        0   100% /snap/lxd/24065
loop3  squashfs                                                        0   100% /snap/core18/2810
loop4  squashfs                                                        0   100% /snap/core20/2186
loop5  squashfs                                                        0   100% /snap/lxd/16103
loop6  squashfs                                                        0   100% /snap/microk8s/6357
loop7  squashfs                                                        0   100% /snap/snapd/20674
loop8  squashfs                                                        0   100% /snap/microk8s/6564
sda
├─sda1 vfat     system-boot B726-57E2                              81.7M    68% /boot/firmware
└─sda2 ext4     writable    483efb12-d682-4daf-9b34-6e2f774b56f7    201G     5% /
sdb    ext4                 95ec5a28-daf8-475a-b6f0-06b20d1f154f
```

### dbuddenbaum@arm64-01:~$ sudo mkdir /mnt/hdisk
### dbuddenbaum@arm64-01:~$ sudo mount /dev/sdb /mnt/hdisk
### dbuddenbaum@arm64-01:~$ 
lsblk -f

```
NAME   FSTYPE   LABEL       UUID                                 FSAVAIL FSUSE% MOUNTPOINT
loop0  squashfs                                                        0   100% /snap/core18/1883
loop1  squashfs                                                        0   100% /snap/core20/2107
loop2  squashfs                                                        0   100% /snap/lxd/24065
loop3  squashfs                                                        0   100% /snap/core18/2810
loop4  squashfs                                                        0   100% /snap/core20/2186
loop5  squashfs                                                        0   100% /snap/lxd/16103
loop6  squashfs                                                        0   100% /snap/microk8s/6357
loop7  squashfs                                                        0   100% /snap/snapd/20674
loop8  squashfs                                                        0   100% /snap/microk8s/6564
sda
├─sda1 vfat     system-boot B726-57E2                              81.7M    68% /boot/firmware
└─sda2 ext4     writable    483efb12-d682-4daf-9b34-6e2f774b56f7  200.9G     5% /
sdb    ext4                 95ec5a28-daf8-475a-b6f0-06b20d1f154f  869.2G     0% /mnt/hdisk
```

### dbuddenbaum@arm64-01:~$ 
sudo vi /etc/fstab

    UUID=95ec5a28-daf8-475a-b6f0-06b20d1f154f /mnt/hdisk ext4 defaults 0 0

### dbuddenbaum@arm64-02:~$ 
microk8s stop

    2024-02-29T20:22:57-05:00 INFO Waiting for "snap.microk8s.daemon-k8s-dqlite.service" to stop.
    Stopped.

### dbuddenbaum@amd64-03:~$ 
sudo reboot