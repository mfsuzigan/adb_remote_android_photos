#!/bin/bash

echo 'acessando dispositivo'
adb shell input keyevent KEYCODE_POWER
adb shell input keyevent KEYCODE_MENU 
sleep 3 

# desbloqueio via PIN, se necessário
echo 'desbloqueando dispositivo'
adb shell input text 6845
adb shell input keyevent KEYCODE_ENTER

echo 'iniciando camera'
adb shell am start -a android.media.action.STILL_IMAGE_CAMERA --ei android.intent.extras.CAMERA_FACING 0

echo 'focando camera'
adb shell input keyevent KEYCODE_FOCUS
sleep 2

echo 'tirando foto'
adb shell input keyevent KEYCODE_CAMERA

echo 'bloqueando dispositivo'
adb shell input keyevent KEYCODE_POWER

echo 'transferindo imagem'
sleep 3
adb pull '/sdcard/DCIM/Camera/'$(adb shell ls -t /sdcard/DCIM/Camera/ | head -n1) .
