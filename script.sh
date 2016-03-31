#!/bin/bash
#http://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html
devCam=$(ls /dev/v4l/by-id/usb-* | head -1)
directorio=/home/jorge2/Descargas
if [ -d "$directorio" ]; then
 mkdir $directorio
fi
ffmpeg -f video4linux2 -i $devCam -vframes 1 $directorio/pic_`date +%F_%T`.jpeg
