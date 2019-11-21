
@ECHO OFF 
cls

echo    ===    ==    == ========  ==     == ==== ========  ========   =======  ========  
echo   == ==   ===   == ==     == ===   ===  ==  ==     == ==     == ==     == ==     == 
echo  ==   ==  ====  == ==     == ==== ====  ==  ==     == ==     == ==     == ==     == 
echo ==     == == == == ==     == == === ==  ==  ========  ========  ==     == ========  
echo ========= ==  ==== ==     == ==     ==  ==  ==   ==   ==   ==   ==     == ==   ==  
echo ==     == ==   === ==     == ==     ==  ==  ==    ==  ==    ==  ==     == ==    ==  
echo ==     == ==    == ========  ==     == ==== ==     == ==     ==  =======  ==     ==    
echo ===================================================================================
echo "**********************Android Screen Mirroring version 1.0 **********************"


echo Initalizing Scrcpy
set /P Path="Enter Full Scrcpy Path i.e  C:\Users\win 10\Desktop\Scrcpy: "
cd %Path%
echo "***********************************************************************************"
adb disconnect
set /P type="Connect Over 1.USB OR 2.WIFI (1/2):"
echo "***********************************************************************************"

if %type%==1 CALL :USB
if %type%==2 CALL :WIFI
pause


:USB 
echo Checking Connected Devices 
adb devices 
echo "***********************************************************************************" 
echo Intializing Scrcpy...  
scrcpy -b15M -m2240 
EXIT /B 0


:WIFI
echo "***********************************************************************************" 
echo Make Sure Your device and this system is in same network.  
echo Please plug your USB device and hit Enter 
set /P var1 
echo "***********************************************************************************" 
echo Checking Connected Devices 
adb devices  
echo "***********************************************************************************" 
set /P Port= "Enter the Port number:"  
echo "***********************************************************************************"  	
adb tcpip %Port%  
echo Restarting TCPIP in Port $Port  	
echo "***********************************************************************************"  
echo Please Unplugged your USB device and hit Enter
set /P var2
echo "***********************************************************************************"
set /P IP="Enter the IP Address:"
echo "***********************************************************************************"
echo Connecting %IP%:%Port%
adb connect %IP%:%Port%
echo "***********************************************************************************"
echo Intializing Scrcpy...
scrcpy -b15M -m2240
EXIT /B 0






