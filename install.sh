#!/bin/bash

echo -n "It's VMware installation script. Do you want to continue? [Y/n] "
read ans
if ((ans == Y))
then
 sudo dnf install kernel-devel kernel-headers gcc make patch wget
 wget https://dl.comss.org/download/VMware-Workstation-Full-17.5.2-23775571.x86_64.bundle
 chmod +x VMware-Workstation-Full-17.5.2-23775571.x86_64.bundle
 sudo ./VMware-Workstation-Full-17.5.2-23775571.x86_64.bundle
 
 sudo patch /usr/src/kernels/$(uname -r)/arch/x86/include/asm/timex.h vmware-timex-h.patch

 cd vmware-host-modules/
 tar -cf vmmon.tar vmmon-only
 tar -cf vmnet.tar vmnet-only
 sudo cp -v vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/
 sudo vmware-modconfig --console --install-all
else
 echo "Bye!"
fi 
