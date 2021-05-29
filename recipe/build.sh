#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

export CFLAGS="-O3 -g -fPIC $CFLAGS"
export CXXFLAGS="-O3 -g -fPIC $CXXFLAGS"

chmod +x configure

if [[ "$CI" == "travis" ]]; then
  export CPU_COUNT=2
fi

./configure --prefix=$PREFIX --libdir=$PREFIX/lib

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" || "${CMAKE_CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
