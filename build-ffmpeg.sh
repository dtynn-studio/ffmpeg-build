#!/bin/bash
set -e

BASE_DIR=$(pwd)
REPO_DIR=$BASE_DIR/ffmpeg/
PREFIX_DIR=$BASE_DIR/target
INSTALL_DIR=$PREFIX_DIR/lib/$1

echo $BASE_DIR

export PKG_CONFIG_PATH=$INSTALL_DIR/pkgconfig

cd $REPO_DIR

./configure \
    --arch=$1 \
    --prefix=$PREFIX_DIR \
    --libdir=$INSTALL_DIR \
    --disable-all \
    --disable-autodetect \
    --disable-debug \
    --disable-everything \
    --disable-shared \
    --disable-postproc \
    --disable-avdevice \
    --enable-pic \
    --enable-stripping \
    --enable-pthreads \
    --enable-avcodec \
    --enable-avfilter \
    --enable-avformat \
    --enable-swscale \
    --enable-swresample \
    --enable-libx264 \
    --enable-zlib \
    --enable-nvenc \
    --enable-ffnvcodec \
    --enable-gpl \
    --enable-encoder=libx264,h264_nvenc,hevc_nvenc \
    --enable-decoder=mjpeg,jpeg2000,tiff \
    --enable-muxer=h264,h265,mov,mp4 \
    --enable-demuxer=image2 \
    --enable-filter=scale,format \
    --enable-protocol=file \


make -j $(nproc --all)
make install

cp $REPO_DIR/ffbuild/config.mak $PREFIX_DIR
