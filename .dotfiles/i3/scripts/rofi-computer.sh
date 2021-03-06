#!/bin/sh

DIALOG_RESULT=$(echo -e 'exit i3\nsuspend\nreboot\nshutdown\nlock screen' | rofi -dmenu -i -p "power options" -hide-scrollbar)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "exit i3" ];
then
    i3-msg 'exit'
elif [ "$DIALOG_RESULT" = "suspend" ];
then
    exec systemctl suspend
elif [ "$DIALOG_RESULT" = "reboot" ];
then
    exec reboot
elif [ "$DIALOG_RESULT" = "shutdown" ];
then
    exec shutdown -h now
elif [ "$DIALOG_RESULT" = "lock screen" ];
then
    exec betterlockscreen -l dim
fi