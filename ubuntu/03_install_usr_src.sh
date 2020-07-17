#!/bin/bash -eux

CWD=$(pwd)

mkdir -p $HOME/usr/src
cd $HOME/usr/src

# if [ ! -d ccls ]; then
#     git clone --depth=1 --recursive https://github.com/MaskRay/ccls.git
#     cd ccls
#     
#     wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
#     tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
#     cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
#     cmake --build Release
#     cd ..
# fi

if [ ! -d fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git
    ./fzf/install
fi

cd $CWD
