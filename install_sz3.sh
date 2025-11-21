#!/bin/bash

git clone -b v3.3.1 https://github.com/szcompressor/SZ3.git
cmake -B build-SZ3 -S SZ3 -GNinja -DBUILD_SZ3_BINARY=OFF -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/opt/pressio
cmake --build build-SZ3
cmake --install build-SZ3
