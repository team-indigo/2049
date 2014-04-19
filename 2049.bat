@echo off

echo.
echo  === 2048 CRACKER THING === 
echo           by reduxd         
echo. 

echo [!] Waiting for device...
adb wait-for-device

echo. 

echo [!] Found device!

echo. 

echo [!] Unpacking loader...
adb push dir\up /data/local/tmp/up > nul
adb push dir\down /data/local/tmp/down > nul
adb push dir\left /data/local/tmp/left > nul
adb push dir\right /data/local/tmp/right > nul

echo. 

echo [!] Loader unpacked!

echo.

echo [!] Brute forcing!
echo [!] Press [CTRL + C] to quit...
:loop
adb shell dd if=/data/local/tmp/up of=/dev/input/event4 > nul
adb shell dd if=/data/local/tmp/down of=/dev/input/event4 > nul
adb shell dd if=/data/local/tmp/left of=/dev/input/event4 > nul
adb shell dd if=/data/local/tmp/right of=/dev/input/event4 > nul
goto loop
