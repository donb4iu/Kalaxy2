# Pulumi

## References

- [Learning Pulumi by using microk8s and adding basic services to cluster.](https://github.com/Hi-Fi/pulumi-microk8s)

- [Pulumi Kubernetes: Installation & Configuration](https://www.pulumi.com/registry/packages/kubernetes/installation-configuration/)


## Setup

### #( 06/01/24@ 5:36PM )( donbuddenbaum@donbs-imac ):~/Documents
   
   brew install pulumi/tap/pulumi

```
==> Auto-updating Homebrew...
Adjust how often this is run with HOMEBREW_AUTO_UPDATE_SECS or disable with
HOMEBREW_NO_AUTO_UPDATE. Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
==> Downloading https://ghcr.io/v2/homebrew/portable-ruby/portable-ruby/blobs/sha256:5c86a23e0e3caee1a4cfd958ed7d50a38e752ebaf2e7c5717e5c8eabaa6e9f12
#=#=-  #       #                                                                                                                                                                                                                                               #=O#-     #        #                                                                                                                                                                                                                                           -#O=- #      #          #                                                                                                                                                                                                                                      -=O#-   #        #           #                                                                              ######################################################################################################################################################################################################################################################### 100.0%
==> Pouring portable-ruby-3.3.2.el_capitan.bottle.tar.gz
==> Auto-updated Homebrew!
Updated 2 taps (homebrew/core and homebrew/cask).
==> New Formulae
haproxy@2.8                              oils-for-unix                            openfa                                   pedump                                   rustls-ffi                               span-lite                                yara-x
==> New Casks
anchor-wallet                       font-anton-sc                       font-baskervville-sc                font-bona-nova-sc                   font-playwrite-nl                   font-playwrite-pl                   font-playwrite-ro                   naps2
font-alumni-sans-collegiate-one-sc  font-arsenal-sc                     font-bodoni-moda-sc                 font-playwrite-is                   font-playwrite-no                   font-playwrite-pt                   font-playwrite-sk                   qlzipinfo
Error: Unexpected method 'appcast' called on Cask minikube.
Follow the instructions here:
  https://github.com/Homebrew/homebrew-cask#reporting-bugs

You have 60 outdated formulae and 7 outdated casks installed.
Error: Unexpected method 'appcast' called on Cask minikube.
Follow the instructions here:
  https://github.com/Homebrew/homebrew-cask#reporting-bugs
Error: Unexpected method 'appcast' called on Cask minikube.
Follow the instructions here:
  https://github.com/Homebrew/homebrew-cask#reporting-bugs

==> Tapping pulumi/tap
Cloning into '/usr/local/Homebrew/Library/Taps/pulumi/homebrew-tap'...
remote: Enumerating objects: 1938, done.
remote: Counting objects: 100% (113/113), done.
remote: Compressing objects: 100% (66/66), done.
remote: Total 1938 (delta 76), reused 64 (delta 43), pack-reused 1825
Receiving objects: 100% (1938/1938), 287.49 KiB | 2.28 MiB/s, done.
Resolving deltas: 100% (1384/1384), done.
Tapped 9 formulae (25 files, 376.5KB).
pulumi 3.77.1 is already installed but outdated (so it will be upgraded).
==> Fetching pulumi/tap/pulumi
==> Downloading https://github.com/pulumi/pulumi/releases/download/v3.118.0/pulumi-v3.118.0-darwin-x64.tar.gz
==> Downloading from https://objects.githubusercontent.com/github-production-release-asset-2e65be/72477752/dfa1996f-4ca0-446a-8335-4de566dd5612?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240603%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240603T192520Z&X-A
######################################################################################################################################################################################################################################################### 100.0%
==> Upgrading pulumi/tap/pulumi
  3.77.1 -> 3.118.0
==> Caveats
zsh completions have been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/pulumi/3.118.0: 19 files, 354.9MB, built in 1 minute 1 second
==> Running `brew cleanup pulumi`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /usr/local/Cellar/pulumi/3.77.1... (21 files, 305.2MB)
```

### #( 06/03/24@ 3:26PM )( donbuddenbaum@donbs-imac ):~/Documents
  
   pulumi login

```
Manage your Pulumi stacks by logging in.
Run `pulumi login --help` for alternative login options.
Enter your access token from https://app.pulumi.com/account/tokens
    or hit <ENTER> to log in using your browser                   :
```