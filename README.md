# PVE VMA extract

Image with all the necessary dependencies to extract a "backup" file from ProxmoxVE.

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
