# MicroK8s Setup

## Reference
- [An Ansible MicroK8s Install of Kubernetes](https://www.theurbanpenguin.com/an-ansible-microk8s-install-of-kubernetes/)

- [istvano/ansible_role_microk8s](https://github.com/istvano/ansible_role_microk8s/tree/master)

- [https://github.com/8grams/ansible-microk8s/blob/main/install_microk8s.yaml](https://github.com/8grams/ansible-microk8s/blob/main/install_microk8s.yaml)

- [https://github.com/cloud-native-skunkworks/microk8s-ansible/blob/main/microk8s/tasks/main.yml](https://github.com/cloud-native-skunkworks/microk8s-ansible/blob/main/microk8s/tasks/main.yml)


## Commands

### #( 01/06/24@11:19PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/ansible@main✗✗✗
   ansible rpi4 -m ping

```
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
arm64-02 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
arm64-05 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
arm64-04 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
arm64-03 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
arm64-01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```