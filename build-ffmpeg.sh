#!/bin/bash
set -e
git submodule update --init --recursive

CPU_NUM=$(nproc --all)
BASE_DIR=$(pwd)
PREFIX_DIR=$BASE_DIR/target/ffmpeg
echo $BASE_DIR

cd $BASE_DIR/ffmpeg


./configure \
    --arch=$1 \
    --prefix=$PREFIX_DIR \
    --libdir=$PREFIX_DIR/lib/$1 \
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
    --enable-libx265 \
    --enable-nvenc \
    --enable-ffnvcodec \
    --enable-zlib \
    --enable-gpl \
    --enable-encoder=h264_nvenc,libx264,hevc_nvenc,libx265 \
    --enable-decoder=mjpeg,jpeg2000,tiff \
    --enable-muxer=h264,h265,mov,mp4 \
    --enable-demuxer=image2 \
    --enable-filter=scale,format \
    --enable-protocol=file

make -j $CPU_NUM
make install
