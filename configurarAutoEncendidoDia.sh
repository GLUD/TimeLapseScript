#Se resetea el archivo
echo 0 > /sys/class/rtc/rtc0/wakealarm
#Se configura que al día siguiente se enciende a las 8am
echo `date '+%s' -d 'tomorrow 8:00'` > /sys/class/rtc/rtc0/wakealarm
