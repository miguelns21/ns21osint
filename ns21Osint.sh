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

function dependencies(){
	tput civis
	clear; banner; echo; 
	dependencies=(git python3 python3-venv libreadline-dev mongodb pdfgrep default-jre sqlite3)

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
	    # Datalux/Osintgram \
	    # laramies/theHarvester \
	    # lanmaster53/recon-ng \
	    # Quantika14/osint-suite-tools \
	    # smicallef/spiderfoot \
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

function recon-ng()
{
	# recon-ng
	echo -e "${cyan}*****  Instalación recon-ng  *****${end}"
	cd $githome/recon-ng
	pip install -r REQUIREMENTS > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: cd $githome/recon-ng/;./recon-ng ${end}\n"
}

function osrframework()
{
	# osrframework
	echo -e "${cyan}*****  Instalación osrframework  *****${end}"
	pip3 install osrframework > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: osrf --help ${end}\n"
}

function osint-suite-tools()
{
	# osint-suite-tools
	echo -e "${cyan}*****  Instalación osint-suite-tools  *****${end}"
	cd $githome/osint-suite-tools
	sed -i '1d' requiriments.txt #Existe una dependencia no compatible en la línea 1.
	pip3 install -r requiriments.txt > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: cd $githome/osint-suite-tools/;python3 BuscadorPersonas.py ${end}\n"
}


function spiderfoot()
{
	# spiderfoot
	echo -e "${cyan}*****  Instalación spiderfoot  *****${end}"
	cd $githome/spiderfoot
	pip3 install -r requirements.txt > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: cd $githome/spiderfoot/;python3 ./sf.py -l 127.0.0.1:5001 ${end}\n"
}

function dmitry()
{
	# dmitry
	echo -e "${cyan}*****  Instalación dmitry  *****${end}"
	apt-get install -y dmitry # > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: dmitry ${end}\n"
}

function maltego()
{
	# maltego
	echo -e "${cyan}*****  Instalación maltego  *****${end}"
	mkdir $githome/maltego; cd $githome/maltego
	wget https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.18.13878.deb > /dev/null 2>&1
	check
	dpkg -i Maltego.v4.2.18.13878.deb # > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: maltego ${end}\n"
}

function exiftool()
{
	# exiftool
	echo -e "${cyan}*****  Instalación exiftool  *****${end}"
	apt-get install -y exiftool # > /dev/null 2>&1
	check
	echo -e "\n\t${yellow}Ejecución: exiftool [OPTIONS] FILE ${end}\n"
}

function extensiones_firefox()
{
	# Opción que pide permiso para añadirlas despues
	echo -e "${cyan}*****  Instalación extensiones  *****${end}"
	mkdir $githome/extensiones > /dev/null 2>&1 
	cd $githome/extensiones

 	#Declaro un diccionarios con los valores
	declare -A extensiones
	extensiones[3802468]='Wappalyzer'
	extensiones['929315']='Wyaback Machine'
	extensiones['993242']='Exit Viewer'
	extensiones[3752246]='Sputnik'
	extensiones['3522684']='User-Agent Switcher'
	
	for i in ${!extensiones[@]}
	do
		echo -ne "\n${yellow}[*]${endC}${blue} ${extensiones[$i]}${end}${blue}...${end}"
		wget "https://addons.mozilla.org/firefox/downloads/file/$i/addon-$i-latest.xpi" #> /dev/null 2>&1 	    
		if [ "$(echo $?)" == "0" ]; then  
			echo -e " ${green}(V)${end}"
		else
			echo -e " ${red}(X)${end}\n"
		fi
	#	echo "La clave del programa ${extensiones[$i]} es $i"
	done

	firefox *.xpi && rm *.xpi

	echo -e "Extensiones instaladas"
}

function marcadores_firefox()
{
	# Utilizo sqlite3 para la restauración de los marcadores desde sqldump
	echo -e "${cyan}*****  Instalación marcadores  *****${end}"

	RESULT=`pgrep firefox` 
	if [ "${RESULT:-null}" = null ]; then 
		sqlite3 ~/.mozilla/firefox/7fpizqlp.default-release/places.sqlite < backup.dump.sql #> /dev/null 2>&1
		echo -e "Marcadores instalados"
	else 
		echo -e "${red}\n[!] Ocurrió un error: Firefox se está ejecutando.\n${end}"
	fi
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
		# clonando_repos
		# Osintgram
		# theHarvester
		# recon-ng
		# osrframework
		# osint-suite-tools
		# spiderfoot
		# dmitry
		# maltego
		exiftool
		
		tput cnorm
	elif [[ $1 == "-e" ]];then
		echo -e "\n${red}[*] Las extensiones deben instalarse como un usuario no root${end}\n"
		tput cnorm
	elif [[ $1 == "" ]];then
		clear; banner; echo; helpPanel;
	fi
 elif [[ $1 == "-e" ]];then #Instalación de las extensiones de firefox
 	extensiones_firefox

 elif [[ $1 == "-m" ]];then #Instalación de los marcadores de firefox
 	marcadores_firefox

 else
 	echo -e "\n${red}[*] Para la correcta instalación de las herramientas, es necesario ser root${end}\n"
 	tput cnorm
fi


