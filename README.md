# Virtual images and dump multi converter

This container purpose, is to be a swiss knife, to convert images and dump, from various virtualization platforms

Uses Proxmox VE 6 tools to extract backups, qemu-img to convert from diffrent formats

The image exposes `/backup` as a good place to mount the folder with the backup.

## Extract Proxmox dump - vma2raw

> $ docker run -it -v /var/lib/libvirt/images:/backup aleliga/pve-vma-docker:latest /bin/bash

Uncrompress the archive with:

> $ lzop -d ./file.vma.lzo -p

Then extract the archive with:

> $ vma extract ./file.vma -v ./vmaextract

There should now be two file in `vmaextract`:

- config_file
- raw_backup_file

## Convert raw disk images to QCOW2 - raw2qcow2

> $ qemu-img convert -f raw -O qcow2 /backup/disk01.img /backup/disk01.qcow2

## Convert QCOW2 disk images to raw - qcow2raw

> $ qemu-img convert -f qcow2 -O raw /backup/disk01.qcow2 /backup/disk01.img
