#!/bin/bash

caminho=/mnt/arquivos/cursos/alura/shell/backup-banco

cd $caminho
if [[ ! -d backup ]]; then
    mkdir backup
fi

mysqldump -u root $1 > $caminho/backup/$1.sql

if [[ $? -eq 0 ]]; then
    echo "Backup realizado com sucesso"
else
    echo "Houve problemas no backup"
fi
