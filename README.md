# ns21Osint.sh

**OSINT**: Es una metodología "de recolección, análisis y toma de decisiones sobre datos de fuentes disponibles de forma pública para ser utilizados en un contesto de inteligencia".

Se puede decir que estamos empleando OSINT para obtener la mayor cantidad de información disponible de cualquier fuente pública sobre una empresa, persona física o cualquier otra cosa sobre la que queremos hacer una investigación.

## Descripción

Script Bash para Distribución Linux para Osint (versión 1.0)

Herramienta BASH que pretende instalar una selección de las principales herramientas OSINT en una distribución basada en Debian limpia.

*Se ha probado en Ubuntu 20.04 LTS.*

El script se divide en tres partes diferenciadas:
- Instalación de herramientas: scripts, ejecutables, etc.
- Instalación de marcadores para Firefox.
- Instalación de extensiones para Firefox.


## Instalación

Ejecute en el terminal de la distribución:

> git clone https://github.com/miguelns21/ns21osint.git

> cd ns21osint

> ./ns21osint

## Uso del script

El script admite una serie de parámetros que se explican a continuación.

- Ayuda (opción -h).
Muestra la ayuda del programa.
- Requerimientos (opción -a).
Actualizar el sistema e instala requerimientos.
- Herramientas (opción -i). 
Para instalar las herramientas OSINT.
Aquí se instalaran herramientas que son descargadas de repositorios github (Osintgram, theHarvester, recon-ng, spiderfoot, nexfil, etc.), otras disponibles como ficheros descargables (maltego) y otras disponibles en la propia distribución base pero no instaladas por defecto (dmitry).
- Actualización (opción -u).
Actualiza el script y el fichero de marcadores conectándose al repositorio y clonándolo.
- Extensiones (opción -e).
Para instalar las extensiones Firefox.
- Marcadores (opción -m).
Para instalar los marcadores Firefox.