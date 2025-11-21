#!/bin/bash

apt-get install -y libprotobuf-dev

git clone -b v2.2.0 https://github.com/NVIDIA/nvcomp.git
cmake -B build-nvcomp -S nvcomp -GNinja -DCMAKE_INSTALL_PREFIX=/opt/pressio
cmake --build build-nvcomp
cmake --install build-nvcomp

apt-get install -y pkg-config libzstd-dev protobuf-compiler libprotobuf-dev python3
git clone -b 1.6.0 https://github.com/CODARcode/MGARD.git
cmake -B build-MGARD -S MGARD -GNinja -DMGARD_ENABLE_OPENMP=ON -DMGARD_ENABLE_CUDA=ON -DCMAKE_CUDA_ARCHITECTURES="80;86;89;90" -DCMAKE_INSTALL_PREFIX=/opt/pressio
cmake --build build-MGARD
cmake --install build-MGARD
