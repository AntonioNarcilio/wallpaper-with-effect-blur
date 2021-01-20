#!/bin/bash

# Importando arquivo
source './an-extract_file_name_and_extension.sh'
# Chamando função
extractFileNameAndExtension
# Variaveis a serem importadas
# => fileNames  extensions


function creatingImgWithBorderAndRoundedCorners() {

	for i in ${!fileNames[@]}; do
		fileFullName="${fileNames[$i]}.${extensions[$i]}"

		function calculatingDrawingDimension() {
			convert $fileFullName \
				-format 'roundrectangle 1,1 %[fx:w+4],%[fx:h+4] 15,15'\
				info: > "${fileNames[$i]}-rounded_corner.mvg"
		}


		function generatingRoundedCornerMask() {
			convert $fileFullName -border 3 -alpha transparent \
				-background none -fill white -stroke none -strokewidth 0 \
				-draw "@${fileNames[$i]}-rounded_corner.mvg"  "${fileNames[$i]}-rounded_corner_mask.png"
		}


		function generatingRoundedCornerOverlay() {
			convert $fileFullName \
				-border 3 -alpha transparent \
				-background none -fill none -stroke white -strokewidth 4 \
				-draw "@${fileNames[$i]}-rounded_corner.mvg" "${fileNames[$i]}-rounded_corner_overlay.png"
		}


		function generatingFinalImage() {
			convert -verbose $fileFullName -alpha set -bordercolor none -border 4  \
				"${fileNames[$i]}-rounded_corner_mask.png" -compose DstIn -composite \
				"${fileNames[$i]}-rounded_corner_overlay.png" -compose Over -composite \
				"${fileNames[$i]}-rounded_border.png"

				msg="Imagem 🖼  ${fileNames[$i]}-rounded_border.png criada"
				echo -e "\e[30;42m $msg \e[0m"
				echo ""				
		}


		# Chamando funções
		calculatingDrawingDimension
		generatingRoundedCornerMask
		generatingRoundedCornerOverlay
		generatingFinalImage

	done


	# Removendo arquivos desnecessarios
	rm -rf *.mvg
	rm -rf *_mask.png
	rm -rf *_overlay.png
	
}


