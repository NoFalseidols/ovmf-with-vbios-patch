#! /bin/bash

mkdir -p build
docker build -t ovmf-vbios-patch docker-build
docker run --rm -v "$PWD/build:/build" -v "$PWD/roms:/roms" ovmf-vbios-patch /ovmf/compile-ovmf.sh MSI.RTX306012GB.12288.210117.rom
tar -czf build/ovmf-vbios-patched.tgz build/OVMF*
