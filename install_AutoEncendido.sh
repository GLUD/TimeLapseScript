#/bin/bash
#se copia el script a la carpeta init.d
sudo cp configurarAutoEncendidoDia.sh /etc/init.d/
#se pone el comando como un demonio, es decir, se inicia con el sistema
sudo update-rc.d configurarAutoEncendidoDia.sh defaults
#Si se quiere remover se ejecuta el comando
#sudo update-rc.d -f configurarAutoEncendidoDia.sh remove
