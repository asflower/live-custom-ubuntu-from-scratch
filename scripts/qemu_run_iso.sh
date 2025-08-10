#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 </path/to/iso>"
    exit 1
fi

qemu-system-x86_64 \
  -m 4G \
  -smp 4 \
  -machine type=q35,accel=kvm \
  -cpu host \
  -cdrom $1 \
  -boot d \
  -vga virtio \
  -display gtk,grab-on-hover=on \
  -bios /usr/share/OVMF/OVMF_CODE.fd \
  -enable-kvm
