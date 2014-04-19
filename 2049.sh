#!/bin/sh

clear

echo ""
echo " === 2048 CRACKER THING === "
echo "          by reduxd         "
echo ""

echo "[!] Waiting for device..."
adb wait-for-device

echo ""

echo "[!] Found device!"
echo " - $(adb shell getprop ro.product.model)"
echo " - $(adb shell getprop ro.build.description)"

echo ""

PROC=$(adb shell pgrep in.net.shreyas.game2048)

if [ -z "$PROC" ] 
then
	echo "[!] 2048 is not running!"
	echo "[![ Exiting..."
	echo ""
	exit 1
fi

echo "[!] Unpacking loader..."
adb push dir/up /data/local/tmp/up > /dev/null
adb push dir/down /data/local/tmp/down > /dev/null
adb push dir/left /data/local/tmp/left > /dev/null
adb push dir/right /data/local/tmp/right > /dev/null

echo ""

echo "[!] Loader unpacked!"

echo ""

echo "[!] Brute forcing!"
echo "[!] Press [CTRL + C] to quit..."
while true
do
	adb shell dd if=/data/local/tmp/up of=/dev/input/event4 > /dev/null
	adb shell dd if=/data/local/tmp/down of=/dev/input/event4 > /dev/null
	adb shell dd if=/data/local/tmp/left of=/dev/input/event4 > /dev/null
	adb shell dd if=/data/local/tmp/right of=/dev/input/event4 > /dev/null
done