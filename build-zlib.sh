#!/bin/bash
set -e

BASE_DIR=$(pwd)
REPO_DIR=$BASE_DIR/zlib/
PREFIX_DIR=$BASE_DIR/target
INSTALL_DIR=$PREFIX_DIR/lib/$1

cd $REPO_DIR
./configure \
    --static \
    --prefix=$PREFIX_DIR \
    --libdir=$INSTALL_DIR \

make -j $(nproc --all)
make install
