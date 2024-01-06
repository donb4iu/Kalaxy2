# Ubuntu

The following instructions are to flash your SD card with the desired OS and configuration specified in the cloud-init config.

> See https://cloudinit.readthedocs.io/en/latest/ for more details.


[cloud-init](https://github.com/canonical/cloud-init)

[cloud-init-doc](https://cloudinit.readthedocs.io/en/latest/topics/examples.html)

## Downloads the Flash tool

```bash
sudo curl -L "https://github.com/hypriot/flash/releases/download/2.5.0/flash" -o /usr/local/bin/flash
sudo chmod +x /usr/local/bin/flash
```

## Download and extract the image

```bash
curl -L "http://cdimage.ubuntu.com/releases/focal/release/ubuntu-20.04-preinstalled-server-arm64+raspi.img.xz" -o ~/Downloads/ubuntu-20.04-preinstalled-server-arm64+raspi.img.xz
unxz -T 0 ~/Downloads/ubuntu-20.04-preinstalled-server-arm64+raspi.img.xz
```

## Flash

```
flash --userdata setup/cloud-config.yml ~/Downloads/ubuntu-20.04.2-preinstalled-server-arm64+raspi.img
```

## Boot

Place the SD Card in your RPi and give the system approx ~10 minutes to boot before trying to SSH.


## USB Boot
    
    
####( 09/06/21@ 1:00AM )( donbuddenbaum@donbs-iMac ):~/Documents/rPi4/kalaxy@main✗✗✗
```
   flash \
    --userdata setup/cloud-config-5.yml \
    ~/Downloads/ubuntu-20.04.2-preinstalled-server-arm64+raspi.img

Is /dev/disk3 correct?
```

```
flash --userdata setup/cloud-config-4.yml ~/Downloads/RPI-USB-BOOT.img
```


- switch to USB drive to trick flash
- remove the card, reboot, and then add the card to solve the boot requirement. so the rPi looks for a new boot devices

```

Is /dev/disk3 correct? y
Unmounting /dev/disk3 ...
Unmount of all volumes on disk3 was successful
Unmount of all volumes on disk3 was successful
Flashing /Users/donbuddenbaum/Downloads/ubuntu-20.04.2-preinstalled-server-arm64+raspi.img to /dev/rdisk3 ...
Password:

```
