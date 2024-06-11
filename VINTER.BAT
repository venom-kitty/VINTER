@echo off
:menu
mode con cols=36 lines=12
cls
title VINTER
color D

echo  _  _  __  __ _  ____  ____  ____ 
echo / )( \(  )(  ( \(_  _)(  __)(  _ \
echo \ \/ / )( /    /  )(   ) _)  )   /
echo  \__/ (__)\_)__) (__) (____)(__\_)
echo ===================================
echo       IP Sniffer And Toolkit
echo 1. IP Geolocation
echo 2. Auto-Ping IP
echo 3. WiFi Password Finder




set /p vinterchoice1=[*] 

if %vinterchoice1%==1 goto geolocate
if %vinterchoice1%==2 goto ping
if %vinterchoice1%==3 goto wifiscan

:geolocate
mode con cols=100 lines=30
cls
echo  _  _  __  __ _  ____  ____  ____ 
echo / )( \(  )(  ( \(_  _)(  __)(  _ \
echo \ \/ / )( /    /  )(   ) _)  )   /
echo  \__/ (__)\_)__) (__) (____)(__\_)
echo ===================================
echo.
set /p ip=Enter IP to geolocate here: 
echo =================================
curl "https://ipinfo.io/%ip%/json/" -o geolocation.json
title VINTER - Geolocating %ip%
echo %ip% Geolocation.
type geolocation.json
del geolocation.json
echo.
echo.
pause
goto menu

:ping
cls
mode con cols=36 lines=12
echo  _  _  __  __ _  ____  ____  ____ 
echo / )( \(  )(  ( \(_  _)(  __)(  _ \
echo \ \/ / )( /    /  )(   ) _)  )   /
echo  \__/ (__)\_)__) (__) (____)(__\_)
echo ===================================
echo.
set /p ip=Enter IP to ping here:
echo ===========================
echo IP pinging starting...
echo Another window will be opened.
echo Press any key to start the ping.
echo.
pause
color 5
title pinging...
start VINTER.BAT
ping %ip% -t
echo ================================
echo Pinging failed. Press any key to
echo kill the window...
echo.
pause
exit


:idk
cls
mode con cols=41 lines=12
echo  _  _  __  __ _  ____  ____  ____ 
echo / )( \(  )(  ( \(_  _)(  __)(  _ \
echo \ \/ / )( /    /  )(   ) _)  )   /
echo  \__/ (__)\_)__) (__) (____)(__\_)
echo ===================================
echo.
set /p savescan=Would you like to save this scan? Y/N. 
set /p ip=Enter IP to scan here:
set /p start_port=Enter port to scan here:

echo =============================
echo Initiating Port Scan on %ip%.
if %savescan%==Y echo Port scanning started using VINTER...>portscanning-report.txt
if %savescan%==y echo Port scanning started using VINTER...>portscanning-report.txt
if %savescan%==yes echo Port scanning started using VINTER...>portscanning-report.txt

telnet %ip% %start_port%
exit

:wifiscan
cls
mode con cols=80 lines=40
echo  _  _  __  __ _  ____  ____  ____ 
echo / )( \(  )(  ( \(_  _)(  __)(  _ \
echo \ \/ / )( /    /  )(   ) _)  )   /
echo  \__/ (__)\_)__) (__) (____)(__\_)
echo ===================================
echo.
echo *Note this feature only works for
echo WiFis registered to the device.
echo ===================================
set /p wifi=Enter WiFi name to scan here:
echo ====================================
netsh wlan show profile name= %wifi% key=clear
pause
goto menu








pause
