#!/bin/bash

source './an-find_image.sh'
# Chamando função
searchImage
# Variavel importada => imgs

# echo ${imgs[@]}

function createWallpaper() {

	for i in ${!imgs[@]}; do

		WIDTH=1920
		HEIGHT=1080

		convert "${imgs[$i]}" \
		-verbose \
			\( -clone 0 -background 'white' -blur '0x10' \
				-resize "$WIDTH x $HEIGHT^" \
			\) \
			\
			\( -clone 0 -background 'white' -gravity center \
				-resize '1510x940' -borderColor 'white' -border 5 \
			\) \
			\
			-delete '0' -gravity center \
			-compose 'over' -composite \
			-extent "$WIDTH x $HEIGHT" "${imgs[$i]}"-edited.png

	done			

}

createWallpaper

			