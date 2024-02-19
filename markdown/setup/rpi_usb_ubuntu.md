# USB RPI 4 Boot for Ubuntu

[RPI4 Direct USB Boot Ubuntu 20.04](https://www.raspberrypi.org/forums/viewtopic.php?t=278791)

**#( 09/13/21@11:43PM )( donbuddenbaum@donbs-iMac ):~/Documents/rPi4/kalaxy@main✗✗✗**

   flash --userdata setup/cloud-config-4.yml ~/Downloads/RPI-USB-BOOT.img

```
Is /dev/disk2 correct? y
Unmounting /dev/disk2 ...
Unmount of all volumes on disk2 was successful
Unmount of all volumes on disk2 was successful
Flashing /Users/donbuddenbaum/Downloads/RPI-USB-BOOT.img to /dev/rdisk2 ...
3.03GiB 0:01:21 [38.1MiB/s] [====================================================================================================================================================================================================================================================================================================>] 100%
0+49604 records in
0+49604 records out
3250806272 bytes transferred in 81.256937 secs (40006508 bytes/sec)
Mounting Disk
Mounting /dev/disk2 to customize...
Copying cloud-init setup/cloud-config-4.yml to /Volumes/system-boot/user-data ...
Unmounting /dev/disk2 ...
"disk2" ejected.
Finished.
```