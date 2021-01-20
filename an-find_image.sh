#!/bin/bash

function searchImage() {
	
	aux=0

	# Procurando images no formato png
	function findPng() {
		ls *png > png-out.txt 

		# 📑 Lendo arquivo linha por linha e passando para uma variavel
		cont=0
		while read linha; do
			png[$cont]=$(echo $linha)
			cont=$[$cont + 1]
		done < png-out.txt

		# Pegando o retorno do comando acima
		# 📑 0 = bem sucedido / 1 = mau sucedido
		status=$?
		# Pegando a quantidade de images no formato:
		qtd_img=`ls *png | wc -l`
			
		# 📑 Se status bem sucedido então
		if [[ "$status" = 0  && "$qtd_img" -ge 1 ]]; then
			for i in ${!png[@]}; do
				imgFiles[$aux]="${png[$i]}"
				aux=$[$aux + 1]
			done
			
			# Se img encontradas menor que 10 adiciona o 0 na frente
			if [ "$qtd_img" -le 9 ]; then
				echo -e "\e[30;42m 🔎 0$qtd_img PNG  encontrado(s) \e[0m"
			# Se não
			else
				echo -e "\e[30;42m 🔎 $qtd_img PNG  encontrado(s) \e[0m"
			fi

		# 📑 Se Não encontrar nada
		elif [[ "$status" = 0  && "$qtd_img" -le 0 ]]; then
			echo -e "\e[1;41m 🔎 Nenhum PNG  encontrado \e[0m"

		fi
	}


	# Procurando images no formato jpg
	function findJpg() {
		ls *jpg > jpg-out.txt 

		# 📑 Lendo arquivo linha por linha e passando para uma variavel
		cont=0
		while read linha; do
			jpg[$cont]=$(echo $linha)
			cont=$[$cont + 1]
		done < jpg-out.txt

		# Pegando o retorno do comando acima
		# 📑 0 = bem sucedido / 1 = mau sucedido
		status=$?
		# Pegando a quantidade de images no formato:
		qtd_img=`ls *jpg | wc -l`
		
		# 📑 Se status bem sucedido então
		if [[ "$status" = 0  && "$qtd_img" -ge 1 ]]; then
			for i in ${!jpg[@]}; do
				imgFiles[$aux]="${jpg[$i]}"
				aux=$[$aux + 1]
			done

			# Se img encontradas menor que 10 adiciona o 0 na frente
			if [ "$qtd_img" -le 9 ]; then
				echo -e "\e[30;42m 🔎 0$qtd_img JPG  encontrado(s) \e[0m"
			# Se não
			else
				echo -e "\e[30;42m 🔎 $qtd_img JPG  encontrado(s) \e[0m"
			fi

		# 📑 Se Não encontrar nada
		elif [[ "$status" = 0  && "$qtd_img" -le 0 ]]; then
			echo -e "\e[1;41m 🔎 Nenhum JPG  encontrado \e[0m"

		fi
	}


	# Procurando images no formato jpeg
	function findJpeg() {
		ls *jpeg > jpeg-out.txt 

		# 📑 Lendo arquivo linha por linha e passando para uma variavel
		cont=0
		while read linha; do
			jpeg[$cont]=$(echo $linha)
			cont=$[$cont + 1]
		done < jpeg-out.txt

		# Pegando o retorno do comando acima
		# 📑 0 = bem sucedido / 1 = mau sucedido
		status=$?
		# Pegando a quantidade de images no formato:
		qtd_img=`ls *jpeg | wc -l`
		
		# 📑 Se status bem sucedido então
		if [[ "$status" = 0  && "$qtd_img" -ge 1 ]]; then
			for i in ${!jpeg[@]}; do
				imgFiles[$aux]="${jpeg[$i]}"
				aux=$[$aux + 1]
			done

			# Se img encontradas menor que 10 adiciona o 0 na frente
			if [ "$qtd_img" -le 9 ]; then
				echo -e "\e[30;42m 🔎 0$qtd_img JPEG encontrado(s) \e[0m"
			# Se não
			else
				echo -e "\e[30;42m 🔎 $qtd_img JPEG encontrado(s) \e[0m"
			fi

		# 📑 Se Não encontrar nada 
		elif [[ "$status" = 0  && "$qtd_img" -le 0 ]]; then
			echo -e "\e[1;41m 🔎 Nenhum JPEG encontrado \e[0m"

		fi
	}


	# Chamando funções
	findPng
	findJpg
	findJpeg

	# Quebra linha
	echo ""

	# Exportando variavel
	export imgs=(${imgFiles[@]})

  # Removendo arquivo desnecesario 
	rm *-out.txt
}

