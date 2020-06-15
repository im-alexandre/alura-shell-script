#!/bin/bash

# Instalar os pacotes ssmtp e mailutils

resposta=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [[ $resposta -ne 200 ]]; then
mail -s "Problema no servidor" im.alexandre07@gmail.com<<del
Houve um problema no seu servidor apache. Os usuários não conseguirão acessar a parada
del
    systemctl restart apache2
fi
