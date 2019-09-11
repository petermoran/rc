#!/bin/bash -eux

# install gcc-9 + extras
if ! which gcc-9 ; then
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9
fi


# install clang-9
if ! which clang-9 ; then
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
    
    sudo tee /etc/apt/sources.list.d/llvm.list > /dev/null << EOF
deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic main
EOF
    
    sudo apt-get update
    sudo apt-get install clang-9 lldb-9 lld-9 clang-format-9
fi

# use gcc-9 by default
sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 30

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 30

sudo update-alternatives --config gcc
sudo update-alternatives --config g++
