#!/bin/bash

export CFLAGS="-O3 -g -fPIC $CFLAGS"
export CXXFLAGS="-O3 -g -fPIC $CXXFLAGS"

chmod +x configure

./configure --prefix=$PREFIX --libdir=$PREFIX/lib

make -j${CPU_COUNT}
make check
make install
