#!/bin/bash
#
# script for cross compile x86_64-w64-mingw32
#
./bootstrap

CURLCONFIG='/usr/x86_64-w64-mingw32/bin/curl-config'   \
./configure --prefix=/usr/x86_64-w64-mingw32           \
--build=x86_64-unknown-linux-gnu                       \
--host=x86_64-w64-mingw32                              \
--target=x86_64-w64-mingw32                            \
--enable-consumer-key=${1}			       \
--enable-consumer-secret=${2}

make
