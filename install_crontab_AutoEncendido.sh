#!/bin/bash
#rationale: se valida si es root, de lo contrario, usa sudo para las operaciones
# que requieren privilegios de root
SUDO=''
if [ "$USER" != "root" ]
then
  SUDO='sudo'
fi

if [ -f /etc/cron.d/encender ]
then
  echo 'El servicio ya está instalado.'
else
#rationale: copio el script a una ubicación natural de software instalado manualmente
$SUDO cp -R configurarAutoEncendidoDia.sh /usr/local/bin/

#rationale: creo un archivo que lee el servicio/demonio CRON se ejecuta todos los dias a las 6:10 am 
#y reinicia el conteo para el siguiente encendido 

$SUDO tee /etc/cron.d/encender << EOF
*/10 6 * * * root /usr/local/bin/configurarAutoEncendidoDia.sh &>/tmp/mycommand.log
EOF
fi

