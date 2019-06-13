#!/bin/bash -eux

if ! which gcc-9 ; then
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9
fi


if ! which clang-9 ; then
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
    
    sudo tee /etc/apt/sources.list.d/llvm.list > /dev/null << EOF
deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic main
EOF
    
    sudo apt-get update
    sudo apt-get install clang-9 lldb-9 lld-9 clang-format-9
fi
