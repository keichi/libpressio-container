#!/bin/bash

git clone -b cuSZp-V2.0.1 https://github.com/szcompressor/cuSZp.git
cmake -B build-cuSZp -S cuSZp -GNinja -DcuSZp_BUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/opt/pressio
cmake --build build-cuSZp
cmake --install build-cuSZp
