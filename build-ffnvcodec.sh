#!/bin/bash
set -e

BASE_DIR=$(pwd)
REPO_DIR=$BASE_DIR/nv-codec-headers/
PREFIX_DIR=$BASE_DIR/target
INSTALL_DIR=$PREFIX_DIR/lib/$1

cd $REPO_DIR

sed "s#@@PREFIX@@#$PREFIX_DIR#" ffnvcodec.pc.in > ffnvcodec.pc

install -m 0755 -d "$PREFIX_DIR/include/ffnvcodec"
install -m 0644 include/ffnvcodec/*.h "$PREFIX_DIR/include/ffnvcodec"
install -m 0644 ffnvcodec.pc "$INSTALL_DIR/pkgconfig"
