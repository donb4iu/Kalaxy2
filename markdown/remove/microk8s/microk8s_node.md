# Remove Microk8s node

## Reference

- [How to Uninstall MicroK8s on Ubuntu 20.04](https://www.deploymastery.com/2023/05/24/how-to-uninstall-microk8s-on-ubuntu-20-04/)


## Drain Node

### #( 09/15/24@ 1:46AM )( donbuddenbaum@donbs-imac ):~
   kubectl drain arm64-05 --ignore-daemonsets --delete-local-data

```
Flag --delete-local-data has been deprecated, This option is deprecated and will be deleted. Use --delete-emptydir-data.
node/arm64-05 cordoned
Warning: ignoring DaemonSet-managed Pods: gpu-operator-resources/gpu-operator-node-feature-discovery-worker-whbr5, ingress/nginx-ingress-microk8s-controller-xlqzd, kube-system/calico-node-kw8lf, kube-system/csi-nfs-node-bnxw9, metallb-system/speaker-fdbhg, observability/kube-prom-stack-prometheus-node-exporter-r5cbv, observability/loki-promtail-f6cjc
evicting pod attendlytical/server-deployment-5b9c56cbd-cs7v9
evicting pod observability/tempo-0
evicting pod guestbook/guestbook-ui-56c646849b-twjdr
evicting pod knote/minio-7bd67b86c6-9lvd2
pod/minio-7bd67b86c6-9lvd2 evicted
pod/server-deployment-5b9c56cbd-cs7v9 evicted
pod/guestbook-ui-56c646849b-twjdr evicted
pod/tempo-0 evicted
node/arm64-05 drained
```

## Remove Microk8s

### dbuddenbaum@arm64-02:~$ microk8s leave
```
Configuring services.
Generating new cluster certificates.
Waiting for node to start.
```
### dbuddenbaum@arm64-02:~$ sudo microk8s stop
    
    Stopped.

### dbuddenbaum@arm64-01:~$ microk8s remove-node arm64-02

### dbuddenbaum@arm64-02:~$ sudo microk8s disable
```
 Usage: microk8s disable [OPTIONS] ADDONS...
 Try "microk8s disable -h" for help.

 Error: Missing argument "ADDONS...".
```
### dbuddenbaum@arm64-02:~$ sudo snap remove microk8s
microk8s removed
### dbuddenbaum@arm64-02:~$ sudo rm -rf /var/snap/microk8s/
### dbuddenbaum@arm64-02:~$ sudo rm -rf /var/snap/microk8s-common/
### dbuddenbaum@arm64-02:~$ ps aux | grep microk8s
    dbudden+   33720  0.0  0.0   5968   664 pts/0    S+   15:43   0:00 grep --color=auto microk8s
### dbuddenbaum@arm64-02:~$ sudo rm -rf /etc/kubernetes/