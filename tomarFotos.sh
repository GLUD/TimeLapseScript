#!/bin/bash
#http://cecs.wright.edu/~pmateti/Courses/233/Labs/Scripting/bashVsPowerShellTable.html
#Variables de configuración:
#directorio donde desea almacenar las imágenes
directorio=/home/glud/Pictures/timelapse/
#usuario y grupo de quien es propietario la carpeta
usuario="glud"
grupo="glud"

#Se obtiene el primer recurso de cámara detectado por el sistema operativo
devCam=$(ls /dev/v4l/by-id/usb-* | head -1)
#directorio=$HOME/Pictures/timelapse
#directorio="/home/jorge2/Imágenes/timelapse/$dirDia"
dirDia=`date +%Y-%m-%d`
directorio="$directorio$dirDia"
if ! [ -d "$directorio" ]; then
 mkdir -p $directorio
 chown "$usuario:$grupo" $directorio -R
fi

function tomarFoto {
 nombreArchivo=$directorio/pic_`date +%F_%T`.jpeg
 ffmpeg -f video4linux2 -i $devCam -vframes 1 $nombreArchivo
 cp $nombreArchivo /tmp
 chown "$usuario:$grupo" $nombreArchivo
}

for i in `seq 1 5`; do
tomarFoto
sleep 10
done
