#!/bin/bash
#Se resetea el archivo
sh -c "echo 0 > /sys/class/rtc/rtc0/wakealarm"
#Se configura que al día siguiente se enciende a las 6am
sh -c "echo `date '+%s' -d 'tomorrow 6:00'` > /sys/class/rtc/rtc0/wakealarm"


