#!/bin/bash
set -e

BASE_DIR=$(pwd)
REPO_DIR=$BASE_DIR/zlib/
PREFIX_DIR=$BASE_DIR/target/zlib
INSTALL_DIR=$PREFIX_DIR/lib

cd $REPO_DIR
./configure \
    --static \
    --prefix=$PREFIX_DIR \
    --libdir=$INSTALL_DIR \

make
make install
