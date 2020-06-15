#!/bin/bash

cd /mnt/arquivos/cursos/alura/shell


regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]; then
    cat apache.log | grep $1
    if [[ $? -ne 0 ]]; then
        echo "IP procurado não tá aqui"
    fi
else
    echo "formato não é válido"
fi


