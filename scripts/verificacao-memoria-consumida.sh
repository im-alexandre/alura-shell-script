#!/bin/bash

CAMINHO_LOG=/var/log
cd $CAMINHO_LOG

if [[ ! -f memoria.log ]]; then
    echo "Data_hora|memoria_usada_gb|relacao_memoria_atual_total" > memoria.log
fi

memoria_usada_gb=$(free -h | grep -i mem | awk '{ print $3 }')
memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_total_gb=$(free -h | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')
data_hora=$(date +%F,%H:%M:%S)

echo "$data_hora|$memoria_usada_gb|$relacao_memoria_atual_total" >> memoria.log

if [[ $relacao_memoria_atual_total -gt 7 ]]; then
mail -s "Consumo memória limite" im.alexandre07@gmail.com<<del
A memória tá zoada! $memoria_usada_gb
del
fi 
