#!/bin/bash

memoria_usada_gb=$(free -h | grep -i mem | awk '{ print $3 }')
memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [[ $relacao_memoria_atual_total -gt 7 ]]; then
mail -s "Consumo memória limite" im.alexandre07@gmail.com<<del
A memória tá zoada! $memoria_usada_gb
del
fi 
