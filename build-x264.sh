#!/bin/bash
set -e

BASE_DIR=$(pwd)
REPO_DIR=$BASE_DIR/x264
PREFIX_DIR=$BASE_DIR/target
INSTALL_DIR=$PREFIX_DIR/lib/$1

cd $REPO_DIR
./configure \
    --prefix=$PREFIX_DIR \
    --libdir=$INSTALL_DIR \
    --disable-cli \
    --enable-static \
    --disable-bashcompletion \
    --disable-opencl \
    --enable-strip \
    --enable-pic \
    --disable-avs \
    --disable-ffms \
    --disable-gpac \
    --disable-lsmash


make -j $(nproc --all)
make install
