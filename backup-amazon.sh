#!/bin/bash

caminho=/mnt/arquivos/cursos/alura/shell/backup-banco
caminho_backup=$caminho/backup_multilidae_amazon

cd $caminho
if [[ ! -d backup_multilidae_amazon ]]; then
    mkdir backup_multilidae_amazon
    cd backup_multilidae_amazon
fi


data=$(date +%F)

if [[ ! -d $data ]]; then
    mkdir $data
fi

tabelas=$(sudo mysql -u root multilidae -e "show tables;" | grep -v Tables)

for tabela in $tabelas ; do
    mysqldump -u root multilidae $tabela > $caminho_backup/$data/$tabela.sql
done

aws s3 sync $caminho_backup s3://curso-shell-script-alexandre
