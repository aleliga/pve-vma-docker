# Multi virtual images converter

This container main purpose is to be a swiss knife to convert images and dump from various virtualization platforms

Uses Proxmox VE 6 tools to extract backups, qemu-img to convert from diffrent formats

The image exposes `/backup` as a good place to mount the folder with the backup.

> $ docker run -it -v /var/lib/libvirt/images:/backup vmaconverter:latest /bin/bash

Uncrompress the archive with:

> $ lzop -d ./file.vma.lzo -p

Then extract the archive with 

> $ vma extract ./file.vma -v ./vmaextract

There should now be two file in `vmaextract`:

- config_file
- raw_backup_file

# Convert raw images to QCOW2 - raw2qcow2

> $ qemu-img convert -f raw -O qcow2 /backup/machine01.img /backup/machine01.qcow2
