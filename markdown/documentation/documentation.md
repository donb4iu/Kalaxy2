# Documentation


[daux.io](https://github.com/dauxio/dauxio.github.io)

## Generate
#### #( 05/03/22@ 2:00PM )( dbuddenbaum@donb-mbp4 ):~/Documents/rpi4/kalaxy@main✗✗✗
docker run --rm -it -w /build -v "$PWD":/build daux/daux.io daux generate -s markdown -d docs
```
Copying Static assets ...                                                                                 [  OK  ]
Generating ...
- alvearie/alvearie.html                                                                                  [  OK  ]
- alvearie/cohort_integration_docker.html                                                                 [  OK  ]
- alvearie/cohort_fhir_integration.html                                                                   [  OK  ]
- alvearie/cohorting.html                                                                                 [  OK  ]
- alvearie/fhirserver.html                                                                                [  OK  ]
- alvearie/jupyter.html                                                                                   [  OK  ]
- ansible/ansible_automation.html                                                                         [  OK  ]
- ansible/blog.html                                                                                       [  OK  ]
- ansible/storage.html                                                                                    [  OK  ]
- boinc/boinc.html                                                                                        [  OK  ]
- docker/docker_cmds.html                                                                                 [  OK  ]
- docker/multi_arch_docker.html                                                                           [  OK  ]
- docker/rpi4_docker.html                                                                                 [  OK  ]
- file_system/ceph.html                                                                                   [  OK  ]
- file_system/crd.html                                                                                    [  OK  ]
- file_system/longhorn.html                                                                               [  OK  ]
- file_system/nfs.html                                                                                    [  OK  ]
- file_system/rook_ceph.html                                                                              [  OK  ]
- file_system/samba.html                                                                                  [  OK  ]
- helm/helm.html                                                                                          [  OK  ]
- images/cluster-initial-up.png                                                                           [  OK  ]
- images/cohort-controllers.png                                                                           [  OK  ]
- images/dashboard.png                                                                                    [  OK  ]
- images/fhir-server_context.png                                                                          [  OK  ]
- images/k8s-dashboard-1110x0694.png                                                                      [  OK  ]
- images/kubernetes-dashboard-args.png                                                                    [  OK  ]
- images/kubernetes-dashboard-ttl.png                                                                     [  OK  ]
- images/nodej_to_nginx.png                                                                               [  OK  ]
- images/raspi-array-0510x0905.jpg                                                                        [  OK  ]
- images/set_prometheus_server_datasource.png                                                             [  OK  ]
- images/traeficdashboard.png                                                                             [  OK  ]
- k8s/containerd.html                                                                                     [  OK  ]
- k8s/k8s.html                                                                                            [  OK  ]
- k8s/kube_upgrade.html                                                                                   [  OK  ]
- k8s/microk8s.html                                                                                       [  OK  ]
- k8s/podnodeselector.html                                                                                [  OK  ]
- k8s/upgrade_nodes.html                                                                                  [  OK  ]
- knative/knative.html                                                                                    [  OK  ]
- knative/knative_examples.html                                                                           [  OK  ]
- microk8s/ansible/microk8s_setup.html                                                                    [  OK  ]
- microk8s/certificates/certmanager.html                                                                  [  OK  ]
- microk8s/dashboard/dashboard.html                                                                       [  OK  ]
- microk8s/dashboard/k8s_dashboard.html                                                                   [  OK  ]
- microk8s/dashboard/microk8s_dashboard.html                                                              [  OK  ]
- microk8s/metallb/k8s_metallb.html                                                                       [  OK  ]
- microk8s/metallb/metalLb.html                                                                           [  OK  ]
- monitoring/monitoring.html                                                                              [  OK  ]
- mysite/mysite.html                                                                                      [  OK  ]
- new_relic/newrelic.html                                                                                 [  OK  ]
- public_IP/publicUrls.html                                                                               [  OK  ]
- README.html                                                                                             [  OK  ]
- references/documentation.html                                                                           [  OK  ]
- references/mediumlinks.html                                                                             [  OK  ]
- references/youtube.html                                                                                 [  OK  ]
- setup/bonded_NIC.html                                                                                   [  OK  ]
- setup/notes.html                                                                                        [  OK  ]
- setup/README.html                                                                                       [  OK  ]
- setup/rpi_usb_ubuntu.html                                                                               [  OK  ]
- setup/rPi4_usb.html                                                                                     [  OK  ]
- sql/mysql.html                                                                                          [  OK  ]
- sql/progressSQL.html                                                                                    [  OK  ]
- traefik/traefik.html                                                                                    [  OK  ]
- utilities/k9s.html                                                                                      [  OK  ]
- utilities/krew.html                                                                                     [  OK  ]
- utilities/kube_setup.html                                                                               [  OK  ]
- utilities/kube_visualizer.html                                                                          [  OK  ]
- utilities/kube_cmds.html                                                                                [  OK  ]
- utilities/kubescrape.html                                                                               [  OK  ]
- utilities/python.html                                                                                   [  OK  ]
- utilities/ssh.html
```

## Hosting site in a file in NGINX

### Multi Arc Build NGINX with static site

#### #( 01/10/23@ 3:50PM )( donbuddenbaum@donbs-imac ):~/Documents/rPi4/kalaxy@main✗✗✗
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -f yaml/nginx-docs/k8s-doc-to-nginx/nginx/Dockerfile -t donb4iu/mynginx_docs --push .

```
[+] Building 92.2s (12/12) FINISHED
=> [internal] load build definition from Dockerfile                                                                                               0.0s
=> => transferring dockerfile: 80B                                                                                                                0.0s
=> [internal] load .dockerignore                                                                                                                  0.0s
=> => transferring context: 157B                                                                                                                  0.0s
=> [linux/arm64 internal] load metadata for docker.io/library/nginx:latest                                                                        2.6s
=> [linux/amd64 internal] load metadata for docker.io/library/nginx:latest                                                                        2.6s
=> [auth] library/nginx:pull token for registry-1.docker.io                                                                                       0.0s
=> [linux/arm64 1/2] FROM docker.io/library/nginx@sha256:0047b729188a15da49380d9506d65959cce6d40291ccfb4e039f5dc7efd33286                        12.4s
=> => resolve docker.io/library/nginx@sha256:0047b729188a15da49380d9506d65959cce6d40291ccfb4e039f5dc7efd33286                                     0.1s
=> => sha256:395a946c3309e7c3158fd712d7168056e3b7824fd7dfe6fdac53a82bc3fef8f5 772B / 772B                                                         0.2s
=> => sha256:d48994bc2006b3d4a992f0435d3da2406ec5b789b66f67b2707c102bc9d2e99c 1.41kB / 1.41kB                                                     0.3s
=> => sha256:b576e4a56718c7c91c2324bebaeb3a27819b1dc55a7854f2549c9ae53e3fc8f9 957B / 957B                                                         0.3s
=> => sha256:b9e33cc8aa8c7049ee74b17da1b0121bbee92b33dd70beddb9e7afd745a3cd69 626B / 626B                                                         0.2s
=> => sha256:3c419414ca9e1744a592d3379a913e0b03f596cba3cbb9e48e544931ac8e1d93 25.39MB / 25.39MB                                                   8.0s
=> => sha256:4b7f5b2a311310809ab89d92f6f71b0462722fe855d3b92c93098a528aa08791 30.04MB / 30.04MB                                                   8.9s
=> => extracting sha256:4b7f5b2a311310809ab89d92f6f71b0462722fe855d3b92c93098a528aa08791                                                          2.0s
=> => extracting sha256:3c419414ca9e1744a592d3379a913e0b03f596cba3cbb9e48e544931ac8e1d93                                                          1.1s
=> => extracting sha256:b9e33cc8aa8c7049ee74b17da1b0121bbee92b33dd70beddb9e7afd745a3cd69                                                          0.0s
=> => extracting sha256:b576e4a56718c7c91c2324bebaeb3a27819b1dc55a7854f2549c9ae53e3fc8f9                                                          0.0s
=> => extracting sha256:395a946c3309e7c3158fd712d7168056e3b7824fd7dfe6fdac53a82bc3fef8f5                                                          0.0s
=> => extracting sha256:d48994bc2006b3d4a992f0435d3da2406ec5b789b66f67b2707c102bc9d2e99c                                                          0.0s
=> [linux/amd64 1/2] FROM docker.io/library/nginx@sha256:0047b729188a15da49380d9506d65959cce6d40291ccfb4e039f5dc7efd33286                         0.1s
=> => resolve docker.io/library/nginx@sha256:0047b729188a15da49380d9506d65959cce6d40291ccfb4e039f5dc7efd33286                                     0.1s
=> [internal] load build context                                                                                                                  0.1s
=> => transferring context: 13.18kB                                                                                                               0.1s
=> CACHED [linux/amd64 2/2] COPY /docs /usr/share/nginx/html                                                                                      0.0s
=> [linux/arm64 2/2] COPY /docs /usr/share/nginx/html                                                                                             0.7s
=> exporting to image                                                                                                                            76.4s
=> => exporting layers                                                                                                                            0.9s
=> => exporting manifest sha256:5de25b6df58dc43d36675f3d193f2612262690ac31773bd5ea88b3410a39c79f                                                  0.0s
=> => exporting config sha256:ecbd04a1f6f460526ad56f17c81ccdee945c8ad71e25dafe02f402a51e7da0c3                                                    0.0s
=> => exporting manifest sha256:d2017164c15212fef955de57f96d4462e85ebf78f3e6cc5ec0758fad14ee22ad                                                  0.0s
=> => exporting config sha256:ed6af09d02b9ea2aa099e1422cf05d91ad0f3b8da89b9ceb93b54c7da8f2cc3d                                                    0.0s
=> => exporting manifest list sha256:fa8130d2f4322d2c5305210c036c79fa2422ca7f03d9e1fd0ecc15eb143472b5                                             0.0s
=> => pushing layers                                                                                                                             74.2s
=> => pushing manifest for docker.io/donb4iu/mynginx_docs:latest@sha256:fa8130d2f4322d2c5305210c036c79fa2422ca7f03d9e1fd0ecc15eb143472b5          1.3s
=> [auth] donb4iu/mynginx_docs:pull,push token for registry-1.docker.io
```

### Single Arch Build NGINX with static site

[Demystifying Persistent Volumes and Persistent Volume Claims](https://learning.kasten.io/kubernetes/blog/demystifying-persistent-volumes-and-persistent-volume-claims/)

#### #( 07/29/22@ 5:23PM )( donbuddenbaum@donbs-imac ):~/Documents/rPi4/kalaxy@main✗✗✗

   docker build -f yaml/nginx-docs/k8s-doc-to-nginx/nginx/Dockerfile -t donb4iu/mynginx_docs .
   
```
[+] Building 0.5s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                        0.0s
 => => transferring dockerfile: 36B                                                                                                                         0.0s
 => [internal] load .dockerignore                                                                                                                           0.0s
 => => transferring context: 126B                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                                                             0.4s
 => [internal] load build context                                                                                                                           0.0s
 => => transferring context: 8.10kB                                                                                                                         0.0s
 => [1/2] FROM docker.io/library/nginx@sha256:bd06dfe1f8f7758debd49d3876023992d41842fd8921565aed315a678a309982                                              0.0s
 => CACHED [2/2] COPY /docs /usr/share/nginx/html                                                                                                           0.0s
 => exporting to image                                                                                                                                      0.0s
 => => exporting layers                                                                                                                                     0.0s
 => => writing image sha256:676ea3c57ea7bf2d3a49cbba8f9069f2d18e751a42779a2a9e3a367b0233252f                                                                0.0s
 => => naming to docker.io/donb4iu/mynginx_docs                                                                                                             0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

### #( 08/22/22@ 5:07PM )( donbuddenbaum@donbs-imac ):~/Documents/rPi4/kalaxy/yaml/nginx/k8s-doc-to-nginx@main✗✗✗
   kubectl apply -f ns.yaml
   
    namespace/documentation created
### #( 08/22/22@ 5:19PM )( donbuddenbaum@donbs-imac ):~/Documents/rPi4/kalaxy/yaml/nginx/k8s-doc-to-nginx@main✗✗✗
   kubectl apply -f nginx-doc-deployment.yaml
   
    deployment.apps/nginx created
### #( 08/22/22@ 5:20PM )( donbuddenbaum@donbs-imac ):~/Documents/rPi4/kalaxy/yaml/nginx/k8s-doc-to-nginx@main✗✗✗
   kubectl apply -f nginx-doc-service.yaml
   
    service/nginx created
### #( 08/22/22@ 5:31PM )( donbuddenbaum@donbs-imac ):~/Documents/rPi4/kalaxy@main✗✗✗
   kubectl get services -n documentation
       
    NAME    TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)          AGE
    nginx   LoadBalancer   10.152.183.178   192.168.2.25   3001:32512/TCP   16m
    
## Updating documentation 

- kubectl scale -n documentation deployment nginx --replicas=0
- kubectl scale -n documentation deployment nginx --replicas=1
