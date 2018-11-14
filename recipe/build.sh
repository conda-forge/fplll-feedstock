#!/bin/bash

if [ "$(uname)" == "Linux" ]
then
   export LDFLAGS="$LDFLAGS -Wl,-rpath-link,${PREFIX}/lib"
fi

export CFLAGS="-O3 -g -fPIC $CFLAGS"
export CXXFLAGS="-O3 -g -fPIC $CXXFLAGS"

chmod +x configure

./configure --prefix=$PREFIX --libdir=$PREFIX/lib

make
make check
make install
