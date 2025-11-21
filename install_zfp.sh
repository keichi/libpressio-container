#!/bin/bash

git clone -b 1.0.1 https://github.com/LLNL/zfp.git
cmake -B build-zfp -S zfp -GNinja -DBUILD_UTILITIES=OFF -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/opt/pressio
cmake --build build-zfp
cmake --install build-zfp
