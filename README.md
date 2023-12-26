# Horizontally spinning rat - now on your desktop!

**NEW - Rewritten from scratch in C, for maximum ratting performance.**  
**The old bash script version is still available on the old_bash branch.**

A terminal port of the horizontally spinning rat meme, complete with soundtrack and spin counter.

![rat](https://rat.nicroxio.co.uk/rat.gif)

## Usage
    Usage: rat [OPTIONS]
    Options:
      -r, --rainbow     Enable rainbow mode
      -m, --ratmark     Enable ratmark
                        depends - lolcat
      -u, --unlock      Enable framerate unlock
      -d, --debug       Enable debug mode
      -h, --help        Display this help menu

## Compiling
Horizontally Spinning Rat should support all POSIX-compliant systems, including Linux. Windows support is achieved through the MSYS compatibility layer.  
Audio support is only available on Linux and Windows.  
Rainbow mode support requires a `lolcat` implementation installled.
### Linux:
`make linux` - without audio  
`make linux_audio` - with audio  
The output binary is bin/rat
### Windows:
Install MSYS and GCC - guide [here](https://www.msys2.org/wiki/MSYS2-introduction/).  
`make win` - without audio  
`make win_audio` - with audio  
The output binary is bin/rat.exe

## Packages
A package is also available on the [AUR](https://aur.archlinux.org/packages/horizontallyspinningrat)