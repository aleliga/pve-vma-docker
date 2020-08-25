FROM debian:buster

WORKDIR /tmp

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget libglib2.0-0 libiscsi7 librbd1 libaio1 lzop glusterfs-common gnupg2 && \
  echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" >> /etc/apt/sources.list && \
  wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg && \
  chmod +r /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg && \
  apt-get update && \
  apt-get download pve-qemu-kvm && \
  dpkg --fsys-tarfile ./pve-qemu-kvm*.deb | tar xOf - ./usr/bin/vma > ./vma && \
  chmod u+x ./vma && \
  mv ./vma /usr/local/bin && \
  ln -sf /usr/lib/x86_64-linux-gnu/libiscsi.so.7 /usr/lib/x86_64-linux-gnu/libiscsi.so.1 && \
  apt install -y libproxmox-backup-qemu0 libcurl3-gnutls libjemalloc2 qemu-utils && \
  mkdir -p /backup && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /backup

VOLUME /backup
