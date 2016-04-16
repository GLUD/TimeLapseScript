#!/bin/bash
#http://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html
devCam=$(ls /dev/v4l/by-id/usb-* | head -1)
#directorio=$HOME/Pictures/timelapse
dirDia=`date +%Y-%m-%d`
directorio=/home/glud/Pictures/timelapse/$dirDia
if ! [ -d "$directorio" ]; then
 mkdir $directorio
 chown glud:glud $directorio -r
fi

function tomarFoto {
 nombreArchivo=$directorio/pic_`date +%F_%T`.jpeg
 ffmpeg -f video4linux2 -i $devCam -vframes 1 $nombreArchivo
 chown glud:glud $nombreArchivo
}

for i in `seq 1 5`; do
tomarFoto
sleep 10
done
