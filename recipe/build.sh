#!/bin/bash

export CFLAGS="-O3 -g -fPIC $CFLAGS"
export CXXFLAGS="-O3 -g -fPIC $CXXFLAGS"

chmod +x configure

if [[ "$CI" == "travis" ]]; then
  export CPU_COUNT=2
fi

./configure --prefix=$PREFIX --libdir=$PREFIX/lib

make -j${CPU_COUNT}
make check
make install
