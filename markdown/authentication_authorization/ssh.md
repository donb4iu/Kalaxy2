# SSH

![alt text](image-1.png)

## References

- [How to access your Raspberry Pi via SSH orVNC from anywhere in the World using CloudFlare’s Zero Trust.
This article will show you a step by step guide on how you can access your Raspberry Pi from anywhere in the world even if you’re behind your ISP’s NAT.](https://medium.com/@mohsentaleb/how-to-access-your-raspberry-pi-via-ssh-orvnc-from-anywhere-in-the-world-using-cloudflares-zero-9dcd2e75a9d7)

- [SSH into your private machines from anywhere, for free, using Cloudflare Tunnel](https://theitbros.com/cloudflare-tunnel/)

- [Cloudflare Tunnel: Expose Your Home Network to the Internet Securely]

- [Kalaxy2 Cloudflare](../homelab/cloudflare.md)

## Execution
#### #( 09/07/24@ 6:48AM )( dbuddenbaum@Dons-MBP-4191 ):~/.ssh
   ssh dbuddenbaum@xxx.yyy.zzz

```
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-117-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

Expanded Security Maintenance for Applications is not enabled.

17 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

3 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

Your Hardware Enablement Stack (HWE) is supported until April 2025.
*** System restart required ***
Last login: Fri Sep  6 17:14:00 2024 from u.x.y.z
```

## Setup
#### #( 09/07/24@ 6:53AM )( dbuddenbaum@Dons-MBP-4191  ):~/.ssh
   ssh-keygen -t rsa -b 4096 -C "<EMAIL>"   
   ssh-add -K ~/.ssh/id_rsa
   ssh-copy-id -i ~/.ssh/id_rsa.pub dbuddenbaum@u.x.y.z

#### #( 09/07/24@ 6:53AM )( dbuddenbaum@Dons-MBP-4191   ):~/.ssh
   vim ~/.ssh/config
   ```
    Host xxx.yyy.zzz
            proxyCommand cloudflared access ssh --hostname %h
   ```
