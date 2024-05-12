# Backing up PVC on NFD

## Reference

-   [Which tool to backup an ext4 partition?](https://askubuntu.com/questions/5401/which-tool-to-backup-an-ext4-partition)
-   [FSArchiver - Quick Start guide](https://www.fsarchiver.org/quickstart/)
## Cleanup

### dbuddenbaum@donb-ms7821:/media/dbuddenbaum/nfs/nfs-server$ 
sudo rm -rf pvc-05da76b0-f710-4813-980b-1dde5acf2b87

### dbuddenbaum@donb-ms7821:/media/dbuddenbaum/nfs/nfs-server$ 
ls -la
```
total 28
drwxrwxrwx 6 nobody           nogroup 4096 May 12 00:41 .
drwxrwxrwx 3 root             root    4096 Apr 10  2022 ..
drwxr-xr-x 4 root             root    4096 May 11 21:29 pvc-12dd438f-229d-4689-95be-95705d37f450
drwxr-xr-x 4 systemd-coredump root    4096 May 12 00:03 pvc-13f27a96-e4e6-44b7-b2ce-1335f55e6455
drwxr-xr-x 4 root             root    4096 May 11 01:29 pvc-2c9d7f1a-9aab-4d1c-9241-ad05b4c57048
drwxr-xr-x 2 root             root    4096 Apr  9 22:45 pvc-cb075f35-3b04-4a75-9e98-c7402d54f11d
-rw-r--r-- 1              502 dialout    8 Apr 10  2022 test
```
### dbuddenbaum@donb-ms7821:/media/dbuddenbaum/nfs/nfs-server$ 
sudo du -hsc *

```
428K	pvc-12dd438f-229d-4689-95be-95705d37f450
301M	pvc-13f27a96-e4e6-44b7-b2ce-1335f55e6455
80K	pvc-2c9d7f1a-9aab-4d1c-9241-ad05b4c57048
4.0K	pvc-cb075f35-3b04-4a75-9e98-c7402d54f11d
4.0K	test
302M	total
```

## Backup

save the contents of /usr/src/linux to an archive (similar to tar): **fsarchiver savedir /data/linux-sources.fsa /usr/src/linux**

### dbuddenbaum@donb-ms7821:/media/dbuddenbaum/nfs/nfs-server$ 
sudo fsarchiver savedir /mnt/sdd1/20240512nfs.fsa /media/dbuddenbaum/nfs/nfs-server -Z8 -j4

```
Statistics for filesystem 0
* files successfully processed:....regfiles=46, directories=37, symlinks=0, hardlinks=0, specials=0
* files with errors:...............regfiles=0, directories=0, symlinks=0, hardlinks=0, specials=0
```    
### dbuddenbaum@donb-ms7821:/mnt/sdd1$ 
ls -la

```
total 1168
drwxrwxrwx 4 nobody      nogroup        4096 May 12 01:14 .
drwxr-xr-x 4 root        root           4096 May 11 00:47 ..
-rw-r--r-- 1 root        root        1152360 May 12 01:14 20240512nfs.fsa
```
## Restore

restore an archive made of simple files to /tmp/extract: **fsarchiver restdir /data/linux-sources.fsa /tmp/extract**