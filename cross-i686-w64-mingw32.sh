#!/bin/bash
#
# script for cross compile i686-w64-mingw32
#
./bootstrap

CURLCONFIG='/usr/i686-w64-mingw32/bin/curl-config'   \
./configure --prefix=/usr/i686-w64-mingw32           \
--build=x86_64-unknown-linux-gnu                     \
--host=i686-w64-mingw32                              \
--target=i686-w64-mingw32                            \
--enable-consumer-key=${1}			     \
--enable-consumer-secret=${2}

make
