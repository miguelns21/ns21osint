#!/bin/bash

#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

# Banner

function banner(){
	echo 
	echo -e "███╗   ██╗███████╗██████╗  ██╗ ██████╗ ███████╗██╗███╗   ██╗████████╗"
	echo -e "████╗  ██║██╔════╝╚════██╗███║██╔═══██╗██╔════╝██║████╗  ██║╚══██╔══╝"
	echo -e "██╔██╗ ██║███████╗ █████╔╝╚██║██║   ██║███████╗██║██╔██╗ ██║   ██║   "
	echo -e "██║╚██╗██║╚════██║██╔═══╝  ██║██║   ██║╚════██║██║██║╚██╗██║   ██║   "
	echo -e "██║ ╚████║███████║███████╗ ██║╚██████╔╝███████║██║██║ ╚████║   ██║   "
	echo -e "╚═╝  ╚═══╝╚══════╝╚══════╝ ╚═╝ ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝   "
	echo 
	echo
	echo -e "  \t\t   ${cyan}Instalación básica de herramientas OSINT${end}"
	echo -e "  \tScript para automatizar la instalación de herramientas OSINT"
	echo -e "  \t\t\t   Master en ${red}Ciberseguridad${end}"
	echo -e "  \t\t\t  Creado por ${blue}Miguel Navarro${end}"
}



# Declaracion de variables
username=""
file=$(readlink -f $0)
current_path=$(dirname $file)
info_path=$current_path/info
declare githome=$HOME/git

trap ctrl_c INT

#Función que permite pulsar ctrl+x en cualquier momento.
function ctrl_c(){
	echo -e "\n${yellow}[*]${end}${gray}Saliendo...${end}"
	tput cnorm;
	
	exit 0
}


function helpPanel(){
	echo -e "${cyan}\n[?] Uso: ./ns21Osint.sh${end}"
	echo -e "\n\t${purple}${end}${yellow} Modo${end}"
	echo -e "\t\t${red}-c${end} -> Para actualizar el sistema, instalar utilidades y fuentes necesarias..."
	echo -e "\t\t${red}-i${end} -> Para instalar las herramientas OSINT"
	echo -e "\t\t${red}-h${end} -> Mostrar este panel de ayuda"
	echo -e "\n\t${purple}${end}${yellow} Ejemplo:${end}"
	echo -e "\n\t${purple}./ns21Osint.sh -i ${end}${yellow} Instala las herramientas OSINT${end}\n"
	exit 0
}

function check(){
	if [[ "$(echo $?)" == "0" ]]; then
		echo -e "${cyan}\n[+] Acción realizada con éxito\n${end}"
	else
		echo -e "${red}\n[!] Ocurrió un error\n${end}"
		exit 1
	fi
}

function press_key(){
	echo -e "\n${red}[.] Presiona la tecla Enter para continuar...${end}" && read
}

function updates_and_dependencies(){
	# Actualizando el sistema
	echo -e "${yellow}\n[*] Buscando actualizaciones del sistema...\n${end}"
	while true; do
		sudo apt update; check
		echo -e "\n${purple}[?] ¿Ves que falta actualizar el sistema?${end}"
		echo -e "${red}[!] Si ha actualizado el sistema anteriormente y hay menos de 50 paquetes por instalar, puede proseguir tranquilamente con la instalación.${end}"
		echo -ne "\n\t - [${yellow}1${end}] Si\n\t - [${yellow}2${end}] No\n\t - Opción: "
		read option
		if [[ $option == 1 ]]; then
			while true;do
				echo -e "${yellow}\n[*] Actualizando el sistema Ubuntu...\n${end}"
				echo -e "\t${cyan}Si ${end}${yellow}sudo apt upgrade${end}"; press_key
				sudo apt upgrade -y; check
				break
			done
		elif [[ $option == 2 ]]; then
			break
		else
			echo -e "${red}\n[!] Opción incorrecta. Realizando nuevamente la comprobación de las actualizaciones...${end}"
		fi
	done
	clear && banner && echo
	echo -e "${yellow}\n[*] Instalando dependencias...\n${end}"; press_key
	sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev -y; check
}


function dependencies(){
	tput civis
	clear; banner; echo; 
	dependencies=(git python3 python3-venv libreadline-dev)

	echo -e "${yellow}[*]${end}${gray} Actualizando las fuentes de los programas (apt update)...${end}"
	apt update; check > /dev/null 2>&1
	sleep 2
	
	echo -e "${yellow}[*]${end}${gray} Comprobando programas necesarios...${end}"
	sleep 2

	for program in "${dependencies[@]}"; do
		echo -ne "\n${yellow}[*]${endC}${blue} Herramienta${end}${purple} $program${end}${blue}...${end}"

		test -f /usr/bin/$program

		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${green}(V)${end}"
		else
			echo -e " ${red}(X)${end}\n"
			echo -e "${yellow}[*]${end}${gray} Instalando herramienta ${end}${blue}$program${end}${yellow}...${end}"
			apt-get install $program -y > /dev/null 2>&1
		fi; sleep 1
	done
}

function extensiones_firefox()
{
	# Firefox extensions -- https://github.com/mozilla/policy-templates/blob/master/README.md#extensions
	echo -e "${cyan}*****  Instalación de extensiones para Firefox  *****${nc}"
	file=/usr/share/firefox-esr/distribution/policies.json
	src=`head -n -3 $file`
	ext='    },
	    "Extensions": {
	      "Install": [
		"https://addons.mozilla.org/firefox/downloads/file/3343599/cookie_quick_manager-0.5rc2-an+fx.xpi",
		"https://addons.mozilla.org/firefox/downloads/file/3616824/foxyproxy_standard-7.5.1-an+fx.xpi",
		"https://addons.mozilla.org/firefox/downloads/file/3398269/max_hackbar-4.7-fx.xpi",
		"https://addons.mozilla.org/firefox/downloads/file/898030/gnome_shell_integration-10.1-an+fx-linux.xpi",
		"https://addons.mozilla.org/firefox/downloads/file/3384326/http_header_live-0.6.5.2-fx.xpi",
		"https://addons.mozilla.org/firefox/downloads/file/3618861/wappalyzer-6.2.3-fx.xpi"
	      ]
	    }
	  }
	}'
	output=`echo -e "$src\n$ext"`
	echo -e "${yel}# ${grn}Backup del fichero Original:${yel} $file.bak${nc}"
	if [ ! -f $file.bak ]; then
	    sudo mv $file $file.bak
	else
	    echo -e "${yel}# Backup del fichero ya existe.${nc}"
	fi
	echo -e "$output" > /tmp/policies.json
	sudo mv /tmp/policies.json $file
	sudo chown root:root $file
	echo -e "\n\n"
}


function check_desktop()
{
	# Desktop environment check
	echo -e "${cyan}*****  Comprobando la existencia del entorno de escritorio Gnome.  *****${nc}\n"
	if [ $XDG_CURRENT_DESKTOP != "GNOME" ]; then
	    echo -e "${red}! *****  ${cyan}Gnome not found. Most changes in this script are Gnome specific.  ${red}*****${nc}"
		echo -e "${red}! *****           ${yel}Por favor instale el entorno de escritorio de Gnome.            ${red}*****${nc}\n"
	   
	fi
}


function crear_entorno_git()
{
	# Crea el directorio ~/git, asigna $githome, y descarga los ficheros necesarios
	echo -e "${cyan}*****  Git setup  *****${nc}"  # -e required for echo to enable backslash escapes
	if [ ! -d $HOME/git ]; then
	    mkdir $HOME/git
	else
	    echo -e "${yel}# ${grn}$HOME/git ya existe.${nc}"
	fi
	if [ ! -d /git ]; then
	    sudo ln -s $HOME/git /git
	else
	    echo -e "${yel}# ${grn}Symlink /git a $HOME/git ya existe.${nc}"
	fi
	# git clone https://github.com/takieyda/linux_customizations $githome/linux_customizations
	echo -e "${cyan}Usuario:\t ${yel}`whoami`"
	echo -e "${cyan}HOME:\t ${yel}$HOME"
	echo -e "${cyan}GITHOME: ${yel}$githome${nc}"
	echo -e "\n\n"
}

function clonando_repos()
{
	# GitHub Repo clones
	echo -e "${cyan}*****  Instalación de repositorios GitHub  *****${end}"
	declare -a repos=( \
	    Datalux/Osintgram \
	    laramies/theHarvester \
	)

	echo -e "${yel}# ${grn}Clonando repositorios...${end}"
	for repo in ${repos[@]}
	do
	    git clone https://github.com/$repo $githome/$(echo $repo | awk -F '/' '{print $NF}')
	done
}

function Osintgram()
{
	# Osintgram
	echo -e "${cyan}*****  Instalación Osintgram  *****${end}"
	cd $githome/Osintgram
	pip install -r requirements.txt > /dev/null 2>&1
	echo -e "\n\t${yellow}Ejecución: >cd $githome/Osintgram/;make setup${end}"
	echo -e "\t\t${yellow}>python3 main.py <target username> ${end}\n"
	check
}

function theHarvester()
{
	# theHarvester
	echo -e "${cyan}*****  Instalación theHarvester  *****${end}"
	cd $githome/theHarvester
	python3 -m pip install -r requirements/base.txt > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: cd $githome/theHarvester/;python3 theHarvester.py -h ${end}\n"
}

function Profil3r()
{
	# Profil3r  ==> https://github.com/Rog3rSm1th/Profil3r.git
	echo -e "${cyan}*****  Instalación Profil3r  *****${nc}"
	pip3 install PyInquirer jinja2 bs4
	#git clone ya efectuado
	cd $githome/Profil3r/
	sudo python3 setup.py install
	cd ..
}


# Main Function

if [ "$(id -u)" == "0" ]; then  #Comprobamos si somos usuario root
	if [[ $1 == "-h" ]];then
		clear; banner; echo; helpPanel; 
	elif [[ $1 == "-c" ]];then
		dependencies
		echo -e "\n${purple}[*] Sistema comprobado. Ahora puede ejecutar el script: ./ns21osing.sh -i${end}"
		tput cnorm
	elif [[ $1 == "-i" ]];then
		crear_entorno_git
		# Por motivos de depuración borraremos el directorio git antes de instalar.
		rm -rf $githome
		clonando_repos
		Osintgram
		theHarvester
		tput cnorm
	elif [[ $1 == "" ]];then
		clear; banner; echo; helpPanel;
	fi
else
	echo -e "\n${red}[*] Para la correcta instalación de las herramientas, es necesario ser root${end}\n"
fi


