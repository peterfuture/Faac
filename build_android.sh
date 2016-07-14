#!/bin/bash

CROSS_PREFIX=arm-linux-androideabi-

./configure \
  --host=arm-linux \
  --with-sysroot=${ANDROID_SYSROOT} \
  --disable-shared \
  --enable-static \
  --with-pic=no \
  CC="arm-linux-androideabi-gcc --sysroot=${ANDROID_SYSROOT}" \
  CXX="arm-linux-androideabi-g++ --sysroot=${ANDROID_SYSROOT}" \
  RANLIB="arm-linux-androideabi-ranlib" \
  AR="arm-linux-androideabi-ar" \
  AR_FLAGS=rcu \
  STRIP="arm-linux-androideabi-strip" \
  NM="arm-linux-androideabi-nm" \
  CFLAGS="-O3  --sysroot=${ANDROID_SYSROOT}" \
  CXXFLAGS="-O3 --sysroot=${ANDROID_SYSROOT}" \
  || exit 1

make clean
make -j8
