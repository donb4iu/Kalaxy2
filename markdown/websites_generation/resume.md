# DauxIO Resume Website Generation



## Build

### #( 04/30/24@ 8:18PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2@main✗✗✗
   docker buildx create --use

   docker buildx build --platform linux/amd64,linux/arm64 -f yaml/nginx-docs/k8s-resume-to-nginx/nginx/Dockerfile -t donb4iu/mynginx_resume --push .

```
recursing_wescoff
[+] Building 28.9s (13/13) FINISHED                                                                                                                               docker-container:recursing_wescoff
 => [internal] booting buildkit                                                                                                                                                                 2.5s
 => => pulling image moby/buildkit:buildx-stable-1                                                                                                                                              1.7s
 => => creating container buildx_buildkit_recursing_wescoff0                                                                                                                                    0.8s
 => [internal] load build definition from Dockerfile                                                                                                                                            0.1s
 => => transferring dockerfile: 323B                                                                                                                                                            0.0s
 => [linux/arm64 internal] load metadata for docker.io/library/nginx:latest                                                                                                                     1.8s
 => [linux/amd64 internal] load metadata for docker.io/library/nginx:latest                                                                                                                     1.8s
 => [auth] library/nginx:pull token for registry-1.docker.io                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                                                 0.0s
 => [internal] load build context                                                                                                                                                               0.3s
 => => transferring context: 106.56kB                                                                                                                                                           0.1s
 => [linux/arm64 1/2] FROM docker.io/library/nginx:latest@sha256:ed6d2c43c8fbcd3eaa44c9dab6d94cb346234476230dc1681227aa72d07181ee                                                              18.8s
 => => resolve docker.io/library/nginx:latest@sha256:ed6d2c43c8fbcd3eaa44c9dab6d94cb346234476230dc1681227aa72d07181ee                                                                           0.2s
 => => sha256:68b681650ba331f6f2aaa2d02b22553d1617ef337ea7b3d8d813cba3c30e6478 1.40kB / 1.40kB                                                                                                  0.3s
 => => sha256:b3678f371bddfc5d9c0778c5b91b023d322156a9c1aa0a33e338383f9496f0eb 396B / 396B                                                                                                      0.3s
 => => sha256:b4b06232e7eb4c182d44f3097b5663321c39f38de320e31aac410f44c5f1e3ca 1.21kB / 1.21kB                                                                                                  0.2s
 => => sha256:6a5cdb238fe4270ae006016ecf23e6786648a54b46bf7b8df1ba05dd0c9e12ee 959B / 959B                                                                                                      0.2s
 => => sha256:986afc5da1579073a4dfd06291753c109d6560b0da47fa06a7a3aef2144a0d83 629B / 629B                                                                                                      0.2s
 => => sha256:21f638c63a61c6f4eee13edc329c79aa304474af8825ca01c9133c36e6bdafe8 38.46MB / 38.46MB                                                                                                7.2s
 => => sha256:22d97f6a5d13532e867231d23d92620a81874d51a456196be50154eeb32edc08 29.18MB / 29.18MB                                                                                               12.1s
 => => extracting sha256:22d97f6a5d13532e867231d23d92620a81874d51a456196be50154eeb32edc08                                                                                                       3.2s
 => => extracting sha256:21f638c63a61c6f4eee13edc329c79aa304474af8825ca01c9133c36e6bdafe8                                                                                                       1.8s
 => => extracting sha256:986afc5da1579073a4dfd06291753c109d6560b0da47fa06a7a3aef2144a0d83                                                                                                       0.0s
 => => extracting sha256:6a5cdb238fe4270ae006016ecf23e6786648a54b46bf7b8df1ba05dd0c9e12ee                                                                                                       0.0s
 => => extracting sha256:b3678f371bddfc5d9c0778c5b91b023d322156a9c1aa0a33e338383f9496f0eb                                                                                                       0.0s
 => => extracting sha256:b4b06232e7eb4c182d44f3097b5663321c39f38de320e31aac410f44c5f1e3ca                                                                                                       0.0s
 => => extracting sha256:68b681650ba331f6f2aaa2d02b22553d1617ef337ea7b3d8d813cba3c30e6478                                                                                                       0.0s
 => [linux/amd64 1/2] FROM docker.io/library/nginx:latest@sha256:ed6d2c43c8fbcd3eaa44c9dab6d94cb346234476230dc1681227aa72d07181ee                                                              17.5s
 => => resolve docker.io/library/nginx:latest@sha256:ed6d2c43c8fbcd3eaa44c9dab6d94cb346234476230dc1681227aa72d07181ee                                                                           0.1s
 => => sha256:93295add984dbd114a6f43401f08e6faf4510809e33e8f8a2e6485399fa0e03c 1.21kB / 1.21kB                                                                                                  0.2s
 => => sha256:ebde0aa1d1aaad9d43da96b7f0e4a4ebccde16cc4d785944629f02406cd54b44 1.40kB / 1.40kB                                                                                                  0.2s
 => => sha256:7102627a7a6e4da3b80e192b686d57139b8c6d4ff405918dd508e784a4abc639 393B / 393B                                                                                                      0.2s
 => => sha256:988b92d96970464ab9435aa6af3077e283c1c8eacaee200f8c123315486066ec 954B / 954B                                                                                                      0.2s
 => => sha256:5252b206aac298fb004dbe62210d127533f8aeb6a5eb0b8f79e28ddc01bd2419 629B / 629B                                                                                                      0.1s
 => => sha256:8ddb1e6cdf341aca028fb6fc4cbd9c2ba9e9a1cae1b186a587f2dffe33c0d587 41.82MB / 41.82MB                                                                                               13.2s
 => => sha256:b0a0cf830b12453b7e15359a804215a7bcccd3788e2bcecff2a03af64bbd4df7 29.15MB / 29.15MB                                                                                               10.8s
 => => extracting sha256:b0a0cf830b12453b7e15359a804215a7bcccd3788e2bcecff2a03af64bbd4df7                                                                                                       3.7s
 => => extracting sha256:8ddb1e6cdf341aca028fb6fc4cbd9c2ba9e9a1cae1b186a587f2dffe33c0d587                                                                                                       2.2s
 => => extracting sha256:5252b206aac298fb004dbe62210d127533f8aeb6a5eb0b8f79e28ddc01bd2419                                                                                                       0.0s
 => => extracting sha256:988b92d96970464ab9435aa6af3077e283c1c8eacaee200f8c123315486066ec                                                                                                       0.0s
 => => extracting sha256:7102627a7a6e4da3b80e192b686d57139b8c6d4ff405918dd508e784a4abc639                                                                                                       0.0s
 => => extracting sha256:93295add984dbd114a6f43401f08e6faf4510809e33e8f8a2e6485399fa0e03c                                                                                                       0.0s
 => => extracting sha256:ebde0aa1d1aaad9d43da96b7f0e4a4ebccde16cc4d785944629f02406cd54b44                                                                                                       0.0s
 => [linux/amd64 2/2] COPY /resume /usr/share/nginx/html                                                                                                                                        0.4s
 => [linux/arm64 2/2] COPY /resume /usr/share/nginx/html                                                                                                                                        0.2s
 => exporting to image                                                                                                                                                                          4.2s
 => => exporting layers                                                                                                                                                                         0.1s
 => => exporting manifest sha256:70fa60260336a9f33c9e25d98d0fa40aa9a30b44a6d921568ec5a69ac74e65f8                                                                                               0.0s
 => => exporting config sha256:d98db752eb22451a1a2a6bef242452b6db2a5e9b2c47d501f7af129cbeaf9d47                                                                                                 0.0s
 => => exporting attestation manifest sha256:9d9b596c7a1001746b3410bb688d40cdce718504fe9be6a779b9162cea9856a3                                                                                   0.0s
 => => exporting manifest sha256:3da92eb88f1316129e30019e51d234848f7169e062a9d7408a35e29f81c3c0d4                                                                                               0.0s
 => => exporting config sha256:2286ed219022e0f2d4fcf5e04f019c2208ae917120b33b44ec15e525c7d12d06                                                                                                 0.0s
 => => exporting attestation manifest sha256:a2f3dc58b0c33c3674161618c11a8a02ee589adc70917ccc5c84629d4bff8d1d                                                                                   0.0s
 => => exporting manifest list sha256:a637ccd80b585a718b0fd864e905aaa5ccbe558783f9f0c207bf033211c90d30                                                                                          0.0s
 => => pushing layers                                                                                                                                                                           2.4s
 => => pushing manifest for docker.io/donb4iu/mynginx_resume:latest@sha256:a637ccd80b585a718b0fd864e905aaa5ccbe558783f9f0c207bf033211c90d30                                                     1.5s
 => [auth] donb4iu/mynginx_resume:pull,push token for registry-1.docker.io                                                                                                                      0.0s

Build multi-platform images faster with Docker Build Cloud: https://docs.docker.com/go/docker-build-cloud
```

### 