#!/bin/bash


caminho=/mnt/arquivos/cursos/alura/shell/backup-banco
caminho_restore=$caminho/restore_multilidae_amazon

cd $caminho

if [[ ! -d restore_multilidae_amazon ]]; then
    mkdir restore_multilidae_amazon
fi

echo $caminho_restore

aws s3 sync s3://curso-shell-script-alexandre/$(date +%F) $caminho_restore

cd $caminho_restore

if [[ -f $1.sql ]]; then
    mysql -u root multilidae < $1.sql
    if [[ $? -eq 0 ]]; then
        echo "O restore foi realizado com sucesso!"
    fi
else    
    echo "O arquivo informado não existe"
fi
