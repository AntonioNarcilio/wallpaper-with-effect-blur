#!/bin/bash

# Importando arquivo
source './an-find_image.sh'
# Chamando função
searchImage


function extractFileNameAndExtension() {

	# imgs => variavel exportada da funcao searchImage
	for i in ${!imgs[@]}; do

		fileFullName=$(basename -- "${imgs[$i]}")
		extension[$i]="${fileFullName##*.}"
		fileName[$i]="${fileFullName%.*}"

	done

	export fileNames=(${fileName[@]})
	export extensions=(${extension[@]})

}

