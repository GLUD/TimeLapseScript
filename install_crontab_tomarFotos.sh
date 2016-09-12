#!/bin/bash
#rationale: se valida si es root, de lo contrario, usa sudo para las operaciones
# que requieren privilegios de root
SUDO=''
if [ "$USER" != "root" ]
then
  SUDO='sudo'
fi

if [ -f /etc/cron.d/tomarFotos ]
then
  echo 'El servicio ya está instalado.'
else
#rationale: copio el script a una ubicación natural de software instalado manualmente
$SUDO cp -R tomarFotos.sh /usr/local/bin/

#rationale: creo un archivo que lee el servicio/demonio CRON se ejecuta cada minuto
$SUDO tee /etc/cron.d/tomarFotos << EOF
*/1 * * * * root /usr/local/bin/tomarFotos.sh &>/tmp/mycommand.log
EOF
fi
