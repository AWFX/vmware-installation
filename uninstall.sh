#!bin/bash

echo -n "Do you want to uninstall VMware? [Y/n] "
read ans
if ((ans == "Y"))
then
 sudo vmware-installer -u vmware-workstation
else
echo "Bye!"
fi
