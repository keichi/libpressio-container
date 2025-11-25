#!/bin/bash

git clone -b 0.0.22 https://github.com/robertu94/std_compat.git
cmake -B build-std_compat -S std_compat -GNinja -DSTDCOMPAT_CXX_VERSION=20 -DCMAKE_INSTALL_PREFIX=/opt/pressio ..
cmake --build build-std_compat
cmake --install build-std_compat

apt-get install -y python3-numpy python3-numcodecs libpython3-dev swig
git clone -b 1.0.6 https://github.com/robertu94/libpressio.git
cmake -B build-libpressio -S libpressio -GNinja -DLIBPRESSIO_HAS_CUDA=ON -DLIBPRESSIO_HAS_SZ3=ON -DLIBPRESSIO_HAS_ZFP=ON -DLIBPRESSIO_HAS_CUSZP=ON -DLIBPRESSIO_HAS_MGARD=ON -DBUILD_PYTHON_WRAPPER=ON -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/opt/pressio
cmake --build build-libpressio
cmake --install build-libpressio
