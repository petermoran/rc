#!/bin/bash -eux

git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls

cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/lib/llvm-9
cmake --build Release
