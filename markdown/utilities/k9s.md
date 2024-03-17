# K9s

## References
- [K9s - Kubernetes CLI To Manage Your Clusters In Style!](https://k9scli.io/topics/install/)

- [Use Docker to Run K9s to Manage a Kubernetes Cluster](https://medium.com/@bestpractices/use-docker-to-run-k9s-to-manage-a-kubernetes-cluster-63e726e01444)

## Setup

### Brew

#### **#( 02/05/22@11:04PM )( dbuddenbaum@donb-mbp4 ):~**

brew install derailed/k9s/k9s

```
Running `brew update --preinstall`...
==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
https://github.com/Homebrew/brew#donations
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> New Formulae
ascii2binary               ffmpeg@4                   reshape
asyncapi                   ghcup                      rure
atlas                      http-prompt                terminalimageviewer
canfigger                  inotify-tools              tfschema
elixir-ls                  juliaup                    tidy-viewer
elvis                      libadwaita                 usbutils
esphome                    linode-cli                 vermin
fdroidcl                   odo-dev                    weggli
==> Updated Formulae
Updated 799 formulae.

==> Tapping derailed/k9s
Cloning into '/usr/local/Homebrew/Library/Taps/derailed/homebrew-k9s'...
remote: Enumerating objects: 788, done.
remote: Counting objects: 100% (372/372), done.
remote: Compressing objects: 100% (186/186), done.
remote: Total 788 (delta 90), reused 0 (delta 0), pack-reused 416
Receiving objects: 100% (788/788), 86.15 KiB | 4.53 MiB/s, done.
Resolving deltas: 100% (192/192), done.
Tapped 1 formula (12 files, 113.2KB).
==> Downloading https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_D
==> Downloading from https://objects.githubusercontent.com/github-production-rel
######################################################################## 100.0%
==> Installing k9s from derailed/k9s
🍺  /usr/local/Cellar/k9s/0.25.18: 5 files, 59.3MB, built in 6 seconds
==> Running `brew cleanup k9s`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
```

### Docker

#### #( 11/22/22@ 3:43PM )( donbuddenbaum@donbs-imac ):~
docker run --rm -it -v ~/.kube/config:/root/.kube/config quay.io/derailed/k9s