#!/bin/bash

cd /mnt/arquivos/cursos/alura/shell


if [[ -z $1 ]]; then
    while [[ -z $requisicao ]]; do
        read -p "Você esqueceu de informar o parâmetro (GET,PUT,POST,DELETE): " requisicao
        param=$(echo $requisicao | awk '{ print toupper($1) }')
    done
else    
    param=$(echo $1 | awk '{ print toupper($1) }')
fi

case $param in
    GET)
        cat apache.log|grep GET 
        ;;
    POST)
        cat apache.log|grep POST
        ;;
    DELETE)
        cat apache.log|grep DELETE
        ;;
    PUT)
        cat apache.log|grep PUT
        ;;
    *)
        echo "Parâmetro inválido"
        ;;
esac

