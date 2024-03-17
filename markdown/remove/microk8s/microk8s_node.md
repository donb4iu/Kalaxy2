# Remove Microk8s node

## Reference

- [How to Uninstall MicroK8s on Ubuntu 20.04](https://www.deploymastery.com/2023/05/24/how-to-uninstall-microk8s-on-ubuntu-20-04/)

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