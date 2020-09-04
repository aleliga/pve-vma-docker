# Virtual images and dump multi converter

This container purpose, is to be a swiss knife, to convert images and dump, from various virtualization platforms

Uses Proxmox VE 6 tools to extract backups, qemu-img to convert from diffrent formats

The image exposes `/backup` as a good place to mount the folder with the backup.

## Extract Proxmox vma dump - vma2raw

> $ docker run -it -v /var/lib/libvirt/images:/backup aleliga/pve-vma-docker:latest /bin/bash

Uncrompress the archive with:

> $ lzop -d ./file.vma.lzo -p

Then extract the archive with:

> $ vma extract ./file.vma -v ./vmaextract

There should now be two file in `vmaextract`:

- config_file
- raw_backup_file

## Convert raw disk images to qcow2 - raw2qcow2

> $ qemu-img convert -f raw -O qcow2 /backup/disk01.img /backup/disk01.qcow2

## Convert QCOW2 disk images to raw - qcow2raw

> $ qemu-img convert -f qcow2 -O raw /backup/disk01.qcow2 /backup/disk01.img

## Convert VMWare vmdk disk images to raw - vmdk2raw

> $ qemu-img convert -f vmdk -O raw /backup/disk01.vmdk /backup/disk01.img

## Convert VMWare vmdk disk images to raw - vmdk2qcow2

> $ qemu-img convert -f vmdk -O raw /backup/disk01.vmdk /backup/disk01.qcow2

### Supported formats

Extracted from QEMU manual:

QEMU supports various other image file formats for compatibility with older QEMU versions or other hypervisors

Supported formats: blkdebug blklogwrites blkreplay blkverify bochs cloop compress copy-on-read dmg file ftp ftps gluster host_cdrom host_device http https iscsi iser luks nbd nfs null-aio null-co nvme parallels qcow qcow2 qed quorum raw rbd replication sheepdog ssh throttle vdi vhdx vmdk vpc vvfat