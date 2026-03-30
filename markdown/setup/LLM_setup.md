# LLM Setup Notes

Here is a clean, production-ready Markdown document you can drop directly into your project (e.g., `docs/cluster-build.md`).

---

````markdown
# MicroK8s 8-Node Cluster Build (ARM64 + AMD64) – Ansible-Based

## Overview

This document defines the **best-practice installation and configuration** for a mixed-architecture MicroK8s cluster using Ansible.

The cluster consists of:
- 8 nodes total
  - 5 × ARM64 (Raspberry Pi)
  - 3 × AMD64 (bare metal, GPU-capable)
- SSD boot disks (OS + Kubernetes)
- HDDs for distributed object/block storage (MinIO)

---

## MVP Requirements

This build satisfies the following:

- ✅ DNS
- ✅ Kubernetes Dashboard (accessible via IP)
- ✅ MetalLB (for LoadBalancer services)
- ✅ Observability (metrics + logs across cluster)
- ✅ GPU support (AMD64 nodes)
- ✅ NFS-backed primary storage (`192.168.2.7`)
- ✅ Distributed MinIO (multi-node, no local-only storage)
- ❌ No hostpath/local-only storage

---

## Architecture Decisions (Final)

### 1. Core Kubernetes Platform

- MicroK8s (snap-based)
- Version: `1.30/stable` (safe baseline)
- Multi-node cluster via `microk8s add-node`

---

### 2. Networking

#### DNS
```bash
microk8s enable dns
````

#### MetalLB

```bash
microk8s enable metallb:192.168.2.20-192.168.2.49
```

* Ensure this IP range is reserved on your LAN
* Used for:

  * Dashboard
  * Grafana
  * MinIO

---

### 3. Dashboard (External Access)

Enable:

```bash
microk8s enable dashboard
```

Expose via LoadBalancer:

```yaml
type: LoadBalancer
```

Create admin user:

```bash
microk8s kubectl create serviceaccount admin-user -n kube-system
microk8s kubectl create clusterrolebinding admin-user \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:admin-user
```

---

### 4. Storage Strategy

## Primary Storage: NFS (192.168.2.7)

We use **NFS CSI** as the default storage class.

### Why:

* Multi-node accessible
* Durable
* Simple + reliable
* Avoids hostpath/node lock-in

### Install (Ansible-managed)

* NFS CSI driver
* StorageClass: `nfs-csi` (default)

---

## Secondary Storage: MinIO (Distributed)

* Uses node HDDs
* Provides:

  * S3 API
  * Distributed block/object storage

### Important Fix vs Notes:

❌ Old notes: single-node MinIO
✅ New: distributed tenant across nodes

### Requirements:

* Multiple PVCs
* Distributed mode
* Backed by replicated storage (NOT hostpath)

---

### 5. Observability (Fixed)

## ❌ Old Approach (Removed)

```
microk8s enable prometheus
```

Problems:

* Deprecated
* Uses hostpath
* Not cluster-aware for new nodes

---

## ✅ New Approach

Install via Helm:

* `kube-prometheus-stack`
* `Loki` (logs)

### Benefits:

* Full cluster metrics
* Persistent storage via NFS
* Scales with cluster

---

### 6. GPU Support (AMD64 Only)

## Enable:

```bash
microk8s enable gpu
```

* Uses NVIDIA GPU Operator
* Requires:

  * NVIDIA drivers installed on host
  * Container runtime configured

---

### 7. Multi-Architecture Scheduling

Use node labels:

```bash
kubectl label nodes <node> kubernetes.io/arch=amd64
kubectl label nodes <node> kubernetes.io/arch=arm64
```

Example usage:

```yaml
nodeSelector:
  kubernetes.io/arch: amd64
```

---

## Ansible Project Structure

After extraction:

```
microk8s_ansible/
├── inventory/
│   └── hosts.ini
├── playbooks/
│   ├── bootstrap_cluster.yml
│   ├── install_nfs.yml
│   ├── install_metallb.yml
│   ├── install_dashboard.yml
│   ├── install_observability.yml
│   ├── install_minio.yml
│   └── enable_gpu.yml
├── roles/
├── group_vars/
└── README.md
```

---

## Deployment Flow

### 1. Bootstrap Cluster

```bash
ansible-playbook playbooks/bootstrap_cluster.yml
```

### 2. Install Core Services

```bash
ansible-playbook playbooks/install_nfs.yml
ansible-playbook playbooks/install_metallb.yml
ansible-playbook playbooks/install_dashboard.yml
```

### 3. Observability

```bash
ansible-playbook playbooks/install_observability.yml
```

### 4. GPU (AMD Nodes Only)

```bash
ansible-playbook playbooks/enable_gpu.yml
```

### 5. MinIO

```bash
ansible-playbook playbooks/install_minio.yml
```

---

## Key Corrections from Original Notes

### Fixed Issues

| Area          | Old                       | New                      |
| ------------- | ------------------------- | ------------------------ |
| Observability | microk8s prometheus addon | Helm-based stack         |
| Storage       | hostpath default          | NFS CSI default          |
| MinIO         | single-node               | distributed multi-node   |
| GPU           | legacy enablement         | GPU operator             |
| Dashboard     | unclear exposure          | LoadBalancer via MetalLB |

---

## Constraints Enforced

* ❌ No hostpath storage

* ❌ No node-local PVC binding

* ❌ No single-node storage dependencies

* ✅ All storage is multi-node accessible

* ✅ Cluster scales horizontally

* ✅ Suitable for LLM workloads

---

## Future Enhancements

* ArgoCD for GitOps
* Ceph (Rook) instead of NFS
* GPU scheduling policies (taints/tolerations)
* Multi-tenant namespaces + quotas
* External ingress (Traefik / NGINX)

---

## Prompt (Source Instruction)

> These pages list the notes for loading and configuring the MicroK8s cluster when installing MicroK8s on an 8-node cluster. Extract best practices across iterations and generate a correct installation.
>
> Requirements:
>
> * DNS
> * Dashboard accessible via IP
> * MetalLB
> * Observability (metrics + logs)
> * GPU support for LLM workloads
> * NFS storage from 192.168.2.7 as default storage class
> * Distributed MinIO using node HDDs
> * No local/device-only storage
> * Multi-node compatible architecture
> * Enable GPUs on AMD64 nodes
> * Use Ansible for automation
>
> Output:
>
> * Clean architecture
> * Corrected configuration
> * Production-aligned setup

---

## Summary

This configuration transforms iterative experimentation into a **production-aligned homelab cluster**:

* Stable networking via MetalLB
* Durable storage via NFS + MinIO
* Full observability stack
* GPU-ready for LLM workloads
* Automated via Ansible
* Architecture-aware scheduling

```

---

If you want, I can next:
- generate a **matching README.md for GitHub**
- or convert this into a **docs site (MkDocs / Docusaurus) structure**
- or wire it directly into your existing site nav like your current HTML docs
```
