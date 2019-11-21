#!/bin/bash
clear
echo '   ###    ##    ## ########  ##     ## #### ########  ########   #######  ########  '
echo '  ## ##   ###   ## ##     ## ###   ###  ##  ##     ## ##     ## ##     ## ##     ## '
echo ' ##   ##  ####  ## ##     ## #### ####  ##  ##     ## ##     ## ##     ## ##     ## '
echo '##     ## ## ## ## ##     ## ## ### ##  ##  ########  ########  ##     ## ########  '
echo '######### ##  #### ##     ## ##     ##  ##  ##   ##   ##   ##   ##     ## ##   ##   '
echo '##     ## ##   ### ##     ## ##     ##  ##  ##    ##  ##    ##  ##     ## ##    ##  '
echo '##     ## ##    ## ########  ##     ## #### ##     ## ##     ##  #######  ##     ## '
echo ===================================================================================
echo "**********************Android Screen Mirroring version 1.0 **********************"
echo "Checking ADB Package......"
pkgs="adb"
if ! dpkg -s $pkgs >/dev/null 2>&1; then
  echo "Installing ADB Package....."
  sudo apt-get install $pkgs
else
	echo "ADB is Already Installed......"
fi

echo "Checking Snap Package......"
pkgs="snapd"
if ! dpkg -s $pkgs >/dev/null 2>&1; then
  echo "Installing Anap Package....."
  sudo apt update
  sudo apt install $pkgs
else
	echo "Snap is Already Installed......"
fi


echo "Checking Scrcpy Package......"
pkgs="scrcpy"
if ! dpkg -s $pkgs >/dev/null 2>&1; then
  echo "Installing Scrcpy Package....."
  sudo snap install $pkgs
else
	echo "Scrcpy is Already Installed......"
fi

echo "***********************************************************************************"
adb disconnect
read -p "Connect Over 1.USB OR 2.WIFI (1/2):" type
echo "***********************************************************************************"
echo $type
if [ $type == 1 ]
then
	echo Checking Connected Devices
	adb devices
	echo "***********************************************************************************"
	echo Intializing Scrcpy...
	scrcpy -b15M -m2240
else
	echo "***********************************************************************************"
	echo Make Sure Your device and this system is in same network.
	echo Please plug your USB device and hit Enter
	read var1 
	echo "***********************************************************************************"

	echo Checking Connected Devices
	adb devices
	echo "***********************************************************************************"
	read -p "Enter the Port number:" Port
	echo "***********************************************************************************"
	adb tcpip $Port
	echo Restarting TCPIP in Port $Port
	echo "***********************************************************************************"
	echo Please Unplugged your USB device and hit Enter
	read var2
	echo "***********************************************************************************"
	read -p "Enter the IP Address:" IP
	echo "***********************************************************************************"
	echo Connecting $IP:$Port
	adb connect $IP:$Port
	echo "***********************************************************************************"
	echo Intializing Scrcpy...
	scrcpy -b15M -m2240
fi



