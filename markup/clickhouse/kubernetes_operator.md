# ClickHouse Kubernetes Operator


## References

- [Quick Start Guides](https://github.com/Altinity/clickhouse-operator/blob/master/docs/quick_start.md)

- [Effortlessly Deploying ClickHouse on Kubernetes: A Comprehensive Guide](https://medium.com/@luciferutkarsh/effortlessly-deploying-clickhouse-on-kubernetes-a-comprehensive-guide-b54dbd6cdf22)


## Setup 

### Quick Start

#### #( 02/18/24@ 6:23PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/microk8s/k8s-dashboard@main✗✗✗
   kubectl apply -f https://raw.githubusercontent.com/Altinity/clickhouse-operator/master/deploy/operator/clickhouse-operator-install-bundle.yaml

```
customresourcedefinition.apiextensions.k8s.io/clickhouseinstallations.clickhouse.altinity.com created
customresourcedefinition.apiextensions.k8s.io/clickhouseinstallationtemplates.clickhouse.altinity.com created
customresourcedefinition.apiextensions.k8s.io/clickhouseoperatorconfigurations.clickhouse.altinity.com created
customresourcedefinition.apiextensions.k8s.io/clickhousekeeperinstallations.clickhouse-keeper.altinity.com created
serviceaccount/clickhouse-operator created
clusterrole.rbac.authorization.k8s.io/clickhouse-operator-kube-system created
clusterrolebinding.rbac.authorization.k8s.io/clickhouse-operator-kube-system created
configmap/etc-clickhouse-operator-files created
configmap/etc-clickhouse-operator-confd-files created
configmap/etc-clickhouse-operator-configd-files created
configmap/etc-clickhouse-operator-templatesd-files created
configmap/etc-clickhouse-operator-usersd-files created
secret/clickhouse-operator created
deployment.apps/clickhouse-operator created
service/clickhouse-operator-metrics created
```

#### Tests

### Medium 

