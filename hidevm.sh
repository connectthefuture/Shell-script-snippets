#!/bin/bash

gen_random_string()
{
	if [ $# -ne 1 ] ; then
		echo "Usage: gen_random_string length" >&2
		return 1
	fi
	
	echo $(cat /dev/urandom | env LC_CTYPE=C tr -cd 'A-F0-9' | head -c $1)
}

echo "VirtualBox Hider for SolidWorks"
echo "by TeAM SolidSQUAD-SSQ"
echo "adapted for shell script"

if [ $# -lt 1 ] ; then
	echo "You must specify a virtual machine name" >&2
	exit 1
fi

VMNAME=$1

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVendor" "American Megatrends Inc"
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcbios/0/Config/DmiBIOSVersion" "2.1.0"
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemVendor" "ASUSTek Computer"
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSerial" "$(gen_random_string 9)"
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber" "$(gen_random_string 20)"
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/ahci/0/Config/Port0/FirmwareRevision" "$(gen_random_string 8)"
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/ahci/0/Config/Port0/ModelNumber" "SEAGATE ST3750525AS"

echo Success!
