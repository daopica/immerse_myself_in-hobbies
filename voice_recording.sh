#!/bin/bash
filename=$(date +'%Y%m%d%H%M%S').wav
folder=/home/baba/recording/$(date +'%Y%m%d')
mkdir -p "$folder"

arecord -D hw:0,0 -f S16_LE -r 48000 -c 2 -d 300 "$folder/$filename"

lame -V3 "$folder/$filename" "$folder/${filename%.wav}.mp3" && rm "$folder/$filename"
