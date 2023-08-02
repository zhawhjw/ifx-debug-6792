#!/usr/bin/env bash
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     
        machine=Linux
        ./fpm-0.9.0-linux-x86_64 build --compiler ifx
        ;;
    Darwin*)    
        machine=Mac
        ./fpm-0.9.0-macos-x86_64 build --compiler ifx 
        ;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=Git;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

#./fpm-0.9.0-linux-x86_64 build --compiler ifx
