# Setup MicroK8s

## Reference




## Setup

### Node

#### dbuddenbaum@arm64-05:~$ sudo snap install microk8s --classic --channel=1.29/stable
    microk8s (1.29/stable) v1.29.0 from Canonical✓ installed

#### buddenbaum@arm64-01:~$ sudo microk8s add-node
    From the node you wish to join to this cluster, run the following:
    microk8s join 192.168.2.51:25000/64fd2ec74c48cdd2d113805beead7a28/307234781a84

    Use the '--worker' flag to join a node as a worker not running the control plane, eg:
    microk8s join 192.168.2.51:25000/64fd2ec74c48cdd2d113805beead7a28/307234781a84 --worker

    If the node you are adding is not reachable through the default interface you can use one of the following:
    microk8s join 192.168.2.51:25000/64fd2ec74c48cdd2d113805beead7a28/307234781a84
    microk8s join 2603:6081:1e00:1075:dea6:32ff:febb:c8bf:25000/64fd2ec74c48cdd2d113805beead7a28/307234781a84


#### dbuddenbaum@arm64-05:~$ sudo usermod -a -G microk8s dbuddenbaum
#### dbuddenbaum@arm64-05:~$ sudo chown -f -R dbuddenbaum ~/.kubesudo chown -f -R dbuddenbaum ~/.kube
#### #### dbuddenbaum@arm64-05:~$ newgrp microk8s
#### dbuddenbaum@arm64-05:~$ microk8s join 192.168.2.51:25000/64fd2ec74c48cdd2d113805beead7a28/307234781a84 --worker
    Contacting cluster at 192.168.2.51

    The node has joined the cluster and will appear in the nodes list in a few seconds.

    This worker node gets automatically configured with the API server endpoints.
    If the API servers are behind a loadbalancer please set the '--refresh-interval' to '0s' in:
    /var/snap/microk8s/current/args/apiserver-proxy
    and replace the API server endpoints with the one provided by the loadbalancer in:
    /var/snap/microk8s/current/args/traefik/provider.yaml

    Successfully joined the cluster.

#### dbuddenbaum@arm64-01:~$ microk8s config > config