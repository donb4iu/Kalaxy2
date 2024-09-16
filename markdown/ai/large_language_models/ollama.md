# Ollama

![alt text](image.png)

## References

- [Ollama: The Ultimate Tool for Running Language Models Locally](https://medium.com/devops-dev/ollama-the-ultimate-tool-for-running-language-models-locally-062589ec3a09)

- [ollama/README.md](https://github.com/ollama/ollama/blob/main/README.md)

- [ollama/docs/](https://github.com/ollama/ollama/tree/main/docs)

- [Ollama: The Ultimate Tool for Running Language Models Locally](https://blog.devops.dev/ollama-the-ultimate-tool-for-running-language-models-locally-062589ec3a09)

- [ollama/docs/tutorials/langchainpy.md](https://github.com/ollama/ollama/blob/main/docs/tutorials/langchainpy.md)

- [Deploy Ollama on Local Kubernetes in 15 minutes](https://sarinsuriyakoon.medium.com/deploy-ollama-on-local-kubernetes-microk8s-6ca22bfb7fa3)

- [Ollama & open-webui on Kubernetes](https://medium.com/@arslankhanali/ollama-open-webui-on-kubernetes-3c18497a3ed2)

- [Running Ollama & OpenUI on Kubernetes](https://towardsaws.com/running-ollama-openui-on-kubernetes-6126c324be16)

- [kubernetes/manifest/base](https://github.com/open-webui/open-webui/tree/main/kubernetes/manifest/base)

- [kalaxy - private copilot](../private_copilot.md)

## Tutorials

- [ollama/docs/tutorials/langchainpy.md](https://github.com/ollama/ollama/blob/main/docs/tutorials/langchainpy.md)

## OpenWebUI

- [Kalaxy OpenWebUI](../openwebUI.md)

## Models

- [Ollama](https://ollama.com/library)
- [OpenWebUI](https://openwebui.com/)

## Install Kubernetes

### #( 08/14/24@ 5:46PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/ollama@main✗✗✗
   helm install ollama-release ./server

```
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: /Users/donbuddenbaum/.kube/config
NAME: ollama-release
LAST DEPLOYED: Wed Aug 14 17:47:40 2024
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

## Install Batch

### #( 08/09/24@ 4:19PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/shell_operator@main✗✗✗
   ollama pull llama3

```
pulling manifest
pulling 6a0746a1ec1a... 100% ▕████████████████████████████████████████████████████████████████████████████████████████████████▏ 4.7 GB
pulling 4fa551d4f938... 100% ▕████████████████████████████████████████████████████████████████████████████████████████████████▏  12 KB
pulling 8ab4849b038c... 100% ▕████████████████████████████████████████████████████████████████████████████████████████████████▏  254 B
pulling 577073ffcc6c... 100% ▕████████████████████████████████████████████████████████████████████████████████████████████████▏  110 B
pulling 3f8eb4da87fa... 100% ▕████████████████████████████████████████████████████████████████████████████████████████████████▏  485 B
verifying sha256 digest
writing manifest
removing any unused layers
success
```

## List

### #( 08/09/24@ 4:33PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/shell_operator@main✗✗✗
   ollama ls

```
NAME                   	ID          	SIZE  	MODIFIED
llama3:latest          	365c0bd3c000	4.7 GB	About a minute ago
nomic-embed-text:latest	0a109f422b47	274 MB	15 minutes ago
llava:latest           	8dd30f6b0cb1	4.7 GB	9 days ago
phi3:latest            	4f2222927938	2.2 GB	9 days ago
```

## Setup

### #( 08/09/24@ 3:29PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/shell_operator@main✔
   ollama ls
   
```
NAME        	ID          	SIZE  	MODIFIED
llava:latest	8dd30f6b0cb1	4.7 GB	8 days ago
phi3:latest 	4f2222927938	2.2 GB	8 days ago
```

## Langchain

### code

pip install langchain_community

```
from langchain_community.llms import Ollama
ollama = Ollama(
    base_url='http://localhost:11434',
    model="llama3"
)
print(ollama.invoke("why is the sky blue"))
```

## execution

#### #( 08/09/24@ 4:03PM )( donbuddenbaum@donbs-imac ):~/Documents/multichat@main✗✗✗
   /Users/donbuddenbaum/.pyenv/versions/3.12.3/bin/python /Users/donbuddenbaum/Documents/multichat/src/lanchain.py

```
The color of the sky appears blue to us due to a phenomenon called Rayleigh scattering. When sunlight enters Earth' end atmosphere, it interacts with molecules and small particles which causes shorter wavelength light (blue) to be scattered more than other colors because they travel as smaller, faster waves. This excess of blue light is then seen from the ground in every direction around us resulting into a uniformly distributed 'blue sky'. During sunrise or sunset when Sun's ray passes through even more atmosphere at an angle, shorter wavelength (and therefore bluer) colors are scattered out leaving predominantly longer-wavelength red and orange light. However this effect can cause the beautifully colored skies we often observe during these times of day as well due to a complex interplay between different atmospheric particles size, composition etc., which varies based on location and weather conditions among other factors.
```