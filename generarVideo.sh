#!/bin/bash
#directorio donde desea almacenar las imágenes
directorio=/home/glud/Pictures/timelapse/
#dia="2016-04-18"
dia=$1
#comienza script
directorio="$directorio$dia"
cd $directorio
ffmpeg -framerate 24 -pattern_type glob -i "pic_*.jpeg" video.webm
