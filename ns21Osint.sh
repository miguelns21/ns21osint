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
	echo -e "  \t\t\t   Master en ${red}Ciberseguridad 7ª Edición ${end}"
	echo -e "  \t\t\t   Tutores: ${cyan}Félix Brezo y Yaiza Rubio"${end}
	echo -e "  \t\t\t  Creado por ${blue}Miguel Navarro Santa${end}"
	echo -e "  \t\t\t  Versión ${blue}1.0${end}"
}



# Declaracion de variables
username=""
file=$(readlink -f $0)
current_path=$(dirname $file)
info_path=$current_path/info
declare githome=$HOME/git
declare userdesktop=""

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
	echo -e "\t\t${red}-a${end} -> Actualizar el sistema e instala requerimientos."
	echo -e "\t\t${red}-i${end} -> Para instalar las herramientas OSINT"
	echo -e "\t\t${red}-e${end} -> Para instalar las extensiones Firefox"
	echo -e "\t\t${red}-m${end} -> Para instalar los marcadores Firefox"
	echo -e "\t\t${red}-u${end} -> Para actualizar el script"
	echo -e "\t\t${red}-h${end} -> Mostrar este panel de ayuda"
	echo -e "\n\t${purple}${end}${yellow} Ejemplo de uso:${end}"
	echo -e "\n\t${purple}./ns21Osint.sh -i ${end}"
	echo -e "\n\t\t${yellow} Instala las herramientas OSINT${end}\n"
	exit 0
}

function check(){
	if [[ "$(echo $?)" == "0" ]]; then
		echo -e "${cyan}\n[+] Acción realizada con éxito\n${end}"
	else
		echo -e "${red}\n[!] Ocurrió un error\n${end}"
		tput cnorm
		exit 1
	fi
}

function checkV(){
	if [ "$(echo $?)" == "0" ]; then
		echo -e " ${green}(V)${end}"
	else
		echo -e " ${red}(X)${end}\n"
	fi; sleep 1
}

function press_key(){
	echo -e "\n${red}[.] Presiona la tecla Enter para continuar...${end}" && read
}

function dependencies(){
	tput civis
	 
	dependencies=(git python3 python3-venv python3-pip libreadline-dev mongodb pdfgrep default-jre sqlite3 firefox)

	echo -e "${yellow}[*]${end}${gray} Actualizando las fuentes de los programas (apt update)...${end}\n"
	sudo apt update; check > /dev/null 2>&1
	sleep 2
	
	echo -e "\n${yellow}[*]${end}${gray} Comprobando programas necesarios...${end}"
	sleep 2

	for program in "${dependencies[@]}"; do
		echo -ne "\n${yellow}[*]${endC}${blue} Herramienta${end}${purple} $program${end}${blue}...${end}"

		dpkg -s $program &> /dev/null

		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${green}(V)${end}"
		else
			echo -e " ${red}(X)${end}\n"
			echo -e "${yellow}[*]${end}${gray} Instalando ${end}${blue}$program${end}${yellow}...${end}"
			sudo apt-get install $program -y > /dev/null 2>&1
		fi; sleep 1
	done
}

function crear_entorno_entorno()
{
	# Crea el directorio ~/git, asigna $githome, y descarga los ficheros necesarios
	echo -e "${yellow}[*]${end}${gray}*****  Configuración de Entorno  *****${end}"
	if [ ! -d $HOME/git ]; then
	    mkdir $HOME/git  > /dev/null 2>&1
	fi
	
	if [ -d $HOME/Escritorio ]; then
		userdesktop=$HOME/Escritorio
	else 
		userdesktop=$HOME/Desktop
	fi
	
	#Creo las distintas categorias en el escritorio
	if [ ! -d $userdesktop/Redes_Sociales ]; then
	    mkdir $userdesktop/Redes_Sociales  > /dev/null 2>&1
	fi
	if [ ! -d $userdesktop/Email ]; then
	    mkdir $userdesktop/Email  > /dev/null 2>&1
	fi
	if [ ! -d $userdesktop/Dominios ]; then
	    mkdir $userdesktop/Dominios  > /dev/null 2>&1
	fi
	if [ ! -d $userdesktop/General ]; then
	    mkdir $userdesktop/General  > /dev/null 2>&1
	fi
	if [ ! -d $userdesktop/Metadatos ]; then
	    mkdir $userdesktop/Metadatos  > /dev/null 2>&1
	fi
	
	test -f /usr/bin/git &> /dev/null

	if [ "$(echo $?)" != "0" ]; then
		echo -e "${red}\n[!] No existe 'git'. Ejecute ./ns21osint.sh -i para instalar los requisitos mínimos.\n${end}"
	tput cnorm
	exit 1
	fi;
	
	echo -e "${cyan}Usuario:\t\t ${yel}`whoami`"
	echo -e "${cyan}HOME:\t\t\t ${yel}$HOME"
	echo -e "${cyan}GITHOME:\t\t ${yel}$githome${nc}"
	echo -e "${cyan}Escritorio Usuario:\t ${yel}$userdesktop${nc}"
	echo -e "\n"
}

function clonando_repos()
{
	tput civis
	# GitHub Repo clones
	echo -e "${yellow}[*]${end}${gray}*****  Instalación de repositorios GitHub  *****${end}"
	declare -a repos=( \
	    Datalux/Osintgram \
	    laramies/theHarvester \
	    lanmaster53/recon-ng \
	    Quantika14/osint-suite-tools \
	    smicallef/spiderfoot \
	    thewhiteh4t/nexfil \
	)

	for repo in ${repos[@]}
	do
		echo -ne "\n${yellow}[*]${endC}${blue} Repositorio ${end}${purple} $repo${end}${blue}...${end}"
		
		git clone https://github.com/$repo $githome/$(echo $repo | awk -F '/' '{print $NF}') > /dev/null 2>&1
		
		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${green}(V)${end}"
		else
			echo -e " ${red}(X)${end}\n"
		fi; sleep 1
	done
}

function Osintgram()
{
	# Osintgram
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}Osintgram ${end}${blue}...${end}"
	cd $githome/Osintgram
	
	test -f /usr/bin/pip &> /dev/null

	if [ "$(echo $?)" != "0" ]; then
		echo -e "${red}\n[!] No existe 'pip'. Ejecute ./ns21osint.sh -i para instalar los requisitos mínimos.\n${end}"
	tput cnorm
	exit 1
	fi;
	
	pip install -r requirements.txt > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>cd $githome/Osintgram/;make setup${end}"
	echo -e "\t${yellow}\t>python3 main.py <target username> ${end}\n"
	
	ln -s $githome/Osintgram $userdesktop/Redes_Sociales/Osintgram > /dev/null 2>&1
}

function nexfil()
{
	# nexfil
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}nexfil ${end}${blue}...${end}"
	cd $githome/nexfil
	
	test -f /usr/bin/pip3 &> /dev/null

	if [ "$(echo $?)" != "0" ]; then
		echo -e "${red}\n[!] No existe 'pip3'. Ejecute ./ns21osint.sh -i para instalar los requisitos mínimos.\n${end}"
	tput cnorm
	exit 1
	fi;
	
	pip3 install -r requirements.txt > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>cd $githome/nexfil/${end}"	
	echo -e "\t${yellow}\t>python3 nexfil.py -h ${end}\n"

	ln -s $githome/nexfil $userdesktop/Redes_Sociales/nexfil > /dev/null 2>&1
}

function theHarvester()
{
	# theHarvester
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}theHarvester ${end}${blue}...${end}"
	cd $githome/theHarvester
	
	test -f /usr/bin/python3 &> /dev/null

	if [ "$(echo $?)" != "0" ]; then
		echo -e "${red}\n[!] No existe 'python3'. Ejecute ./ns21osint.sh -i para instalar los requisitos mínimos.\n${end}"
	tput cnorm
	exit 1
	fi;
	
	python3 -m pip install -r requirements/base.txt > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>cd $githome/theHarvester/${end}"
	echo -e "\t${yellow}\t>python3 theHarvester.py -h ${end}\n"
	
	ln -s $githome/theHarvester $userdesktop/Email/theHarvester > /dev/null 2>&1
}

function dmitry()
{
	# dmitry
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}dmitry ${end}${blue}...${end}"
	mkdir $githome/dmitry > /dev/null 2>&1;
	sudo apt-get install -y dmitry > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>dmitry ${end}\n"
	
	ln -s /usr/bin/dmitry $userdesktop/Dominios/dmitry > /dev/null 2>&1
}

function maltego()
{
	# maltego
	echo -ne "\n${yellow}[*]${endC}${blue} Descargando ${end}${purple}maltego ${end}${blue}...${end}"
	mkdir $githome/maltego > /dev/null 2>&1; 
	cd $githome/maltego
	wget https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.2.18.13878.deb > /dev/null 2>&1
	check
	echo -ne "\n${yellow}[*]${endC}${blue} Instalando maltego ${end}${blue}...${end}"
	sudo dpkg -i Maltego.v4.2.18.13878.deb > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>maltego ${end}\n"
	
	ln -s /usr/bin/maltego $userdesktop/General/maltego > /dev/null 2>&1
}

function recon-ng()
{
	# recon-ng
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}recon-ng ${end}${blue}...${end}"
	cd $githome/recon-ng
	pip install -r REQUIREMENTS > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>cd $githome/recon-ng/${end}"
	echo -e "\t${yellow}\t>./recon-ng ${end}\n"
	
	ln -s $githome/recon-ng $userdesktop/General/recon-ng > /dev/null 2>&1
}

function dante-osint-suite-tools()
{
	# osint-suite-tools
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}osint-suite-tools ${end}${blue}...${end}"
	cd $githome/osint-suite-tools
	sed -i '1d' requiriments.txt #Existe una dependencia no compatible en la línea 1.
	pip3 install -r requiriments.txt > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>cd $githome/osint-suite-tools/${end}"
	echo -e "\t${yellow}\t>python3 BuscadorPersonas.py ${end}\n"
		
	ln -s $githome/osint-suite-tools $userdesktop/General/osint-suite-tools > /dev/null 2>&1
}

function osrframework()
{
	# osrframework
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}osrframework ${end}${blue}...${end}"
	pip3 install osrframework > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>sudo osrf --help ${end}\n"
	
	ln -s /usr/local/bin/osrf $userdesktop/General/osrf > /dev/null 2>&1
}

function spiderfoot()
{
	# spiderfoot
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}spiderfoot ${end}${blue}...${end}"
	cd $githome/spiderfoot
	pip3 install -r requirements.txt > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>cd $githome/spiderfoot/${end}"
	echo -e "\t${yellow}\t>python3 ./sf.py -l 127.0.0.1:5001 ${end}\n"
	
	ln -s $githome/spiderfoot $userdesktop/General/spiderfoot > /dev/null 2>&1
}

function exiftool()
{
	# exiftool
	echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}exiftool ${end}${blue}...${end}"
	sudo apt-get install -y exiftool > /dev/null 2>&1
	checkV
	
	echo -e "\n\t${yellow}Ejecución:${end}\n"
	echo -e "\t${yellow}\t>exiftool [OPTIONS] FILE ${end}\n"
	
	ln -s /usr/bin/exiftool $userdesktop/Metadatos/exiftool > /dev/null 2>&1
}


function extensiones_firefox()
{
	# Opción que pide permiso para añadirlas despues
	echo -e "${yellow}[*]${end}${gray}*****  Instalación de extensiones para Firefox  *****${end}"
	mkdir $HOME/git  > /dev/null 2>&1
	mkdir $githome/extensiones > /dev/null 2>&1 
	
	cd $githome/extensiones

 	#Declaro un diccionarios con los valores
	declare -A extensiones
	extensiones[3802468]='Wappalyzer'
	extensiones[929315]='Wyaback Machine'
	extensiones[3757144]='xlFr'
	extensiones[3752246]='Sputnik'
	extensiones[3522684]='User-Agent Switcher'
	extensiones[3815277]='Search by Image'
	extensiones[3645240]='hunter.io'
	extensiones[3816197]='Fireshot'
	
	RESULT=`pgrep firefox` #Compruebo si Firefox está abierto
	
	if [ "${RESULT:-null}" = null ]; then 
	
		for i in ${!extensiones[@]}
		do
			echo -ne "\n${yellow}[*]${endC}${blue} Extensión ${end}${purple}${extensiones[$i]}${end}${blue}...${end}"
			wget "https://addons.mozilla.org/firefox/downloads/file/$i/addon-$i-latest.xpi" > /dev/null 2>&1 	    
			checkV
		done
	
		firefox *.xpi && rm *.xpi &
		
		echo -e "\n\n${cyan}\n[+] Extensiones instaladas con éxito\n${end}"
	else 
		echo -e "${red}\n[!] Ocurrió un error: Firefox se está ejecutando.\n${end}"
	fi
}

function marcadores_firefox()
{
	# Utilizo sqlite3 para la restauración de los marcadores desde dump
	echo -e "${yellow}[*]${end}${gray}*****  Instalación de marcadores para Firefox  *****${end}"
	
	#Existe el perfil del usuario
	if test -f ~/.mozilla/firefox/*default-release/places.sqlite; then
	
		RESULT=`pgrep firefox` #Compruebo si Firefox está abierto
	
		if [ "${RESULT:-null}" = null ]; then 
			if test -f marcadores.sql; then
			
				test -f /usr/bin/sqlite3 &> /dev/null

				if [ "$(echo $?)" != "0" ]; then
					echo -e "${red}\n[!] No existe 'sqlite3'. Ejecute ./ns21osint.sh -i para instalar los requisitos mínimos.\n${end}"
				tput cnorm
				exit 1
				fi;
			
				sqlite3 ~/.mozilla/firefox/*default-release/places.sqlite < marcadores.sql > /dev/null 2>&1
			
				echo -e "\n${cyan}\n[+] Marcadores instalados con éxito\n${end}"
			else
				echo -e "${red}\n[!] Ocurrió un error: El fichero de marcadores no existe.\n${end}"
			fi
		else 
			echo -e "${red}\n[!] Ocurrió un error: Firefox se está ejecutando.\n${end}"
		fi
	else
		echo -e "${red}\n[!] Ocurrió un error: Debe ejecutar Firefox una vez para que se cree su perfil de usuario.\n${end}"
	fi
}

function actualiza_script()
{
	echo -e "${yellow}[*]${end}${gray}*****  Actualización de script  *****${end}"
	
	if [ "$(echo $?)" != "0" ]; then
		echo -e "${red}\n[!] No existe 'git'. Ejecute ./ns21osint.sh -i para instalar los requisitos mínimos.\n${end}"
		tput cnorm
		exit 1
	fi;
	
	git clone https://github.com/miguelns21/ns21Osint $githome/ns21osint > /dev/null 2>&1
	cp $githome/ns21osint/* .
	echo -e "\n${cyan}\n[+] Script actualizado a la última versión disponible con éxito\n${end}"
}


# Main Function
if [ "$(id -u)" == "0" ]; then  #Comprobamos si somos usuario root
	clear; banner; echo;
	echo -e "\n${red}[*] Este script instalará herramientas en el perfil de usuario actual.${end}\n"
	echo -e "${red}[*] Por favor, logeese como un usuario NO root para la correcta instalación.${end}\n"
	echo -e "${red}[*] El script le solicitará la clave root cuando sea necesario.${end}\n"
	exit 1;	
fi


if [[ $1 == "-h" ]] || [[ $1 == "" ]];then
	clear; banner; echo; helpPanel; 
elif [[ $1 == "-a" ]];then
	clear; banner; echo;
	if [ "$(id -u)" != "0" ]; then  #Comprobamos si somos usuario root
		echo -e "\n${red}[*] Para la correcta instalación de las herramientas, es necesario ser root${end}\n"
		dependencies   #Esta opción requiere ser root
		echo -e "\n${purple}[*] Sistema comprobado. Ahora puede ejecutar el script: ./ns21osing.sh -i${end}"
		tput cnorm
	fi

elif [[ $1 == "-i" ]];then
		clear; banner; echo;
		crear_entorno_entorno
		# Por motivos de depuración borraremos el directorio git antes de instalar.
		rm -rf $githome
		clonando_repos
		Osintgram
		nexfil
		theHarvester
		dmitry
		maltego
		recon-ng
		dante-osint-suite-tools
		osrframework
		spiderfoot 
		exiftool
		echo -e "\n${purple}[*] Herramientas instaladas con éxito.${end}"
		tput cnorm
 elif [[ $1 == "-e" ]];then #Instalación de las Extensiones de firefox
 	clear; banner; echo;
	tput civis
	extensiones_firefox
 	tput cnorm
 elif [[ $1 == "-m" ]];then #Instalación de los Marcadores de firefox
 	clear; banner; echo;
	tput civis
	marcadores_firefox
	tput cnorm
 elif [[ $1 == "-u" ]];then #Actualización del script y del fichero de marcadores a través de github
 	clear; banner; echo;
	tput civis
	actualiza_script
	tput cnorm
 else  #Se ha introducido un parámetro desconocido o no soportado
 	clear; banner; echo; helpPanel;
fi

