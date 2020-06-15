#######################################
# SCRIPT BACKUP DI�RIO SERVIDOR DADOS #
#######################################

# DEFINE AS VARI�VEIS QUE SER�O UTILIZADAS

DATA=$(date +%F)
LOG="/var/log/backuppastas.log"
# MONTA O PONTO DE MONTAGEM /BACKUP

#mount /dev/disk/by-uuid/f5e21395-03f0-4cd6-be49-37e595e5cedb /mnt 
mount /dev/sdb1 /mnt
montado=`mount | grep /mnt`

# SE A MONTAGEM N�O ESTIVER UP ENT�O FECHA, CASO CONTR�RIO REALIZA O BACKUP
if [ -z "$montado"]; then 	
    echo -ne "Erro ao montar o HD, backup n�o realizado: $DATA \n"  >> $LOG;
    exit 1
else    
    echo -ne "In�cio do backup: $DATA \n" >> $LOG;    	
# Emite um som de 1 segundo, informando que come�ou o backup
# 1000ms=1s
#$ beep -l 1000

# COMPACTA TODO O CONTE�DO DAS PASTAS DENTRO DE /BACKUP.
executa_backup(){
    tar -zcvf /mnt/grupos-$DATA.tar.gz /home/grupos
    tar -zcvf /mnt/publico-$DATA.tar.gz /home/publico
    tar -zcvf /mnt/usuarios-$DATA.tar.gz /home/usuarios
    tar -zcvf /mnt/etc-$DATA.tar.gz /usr/local/samba/etc
    tar -zcvf /mnt/private-$DATA.tar.gz /usr/local/samba/private
    tar -zcvf /mnt/sysvol-$DATA.tar.gz /usr/local/samba/var/locks/sysvol
}

executa_backup

if [[ $? -ne 0 ]]; then
    msg="erro"
else
    msg="sucesso"
fi

# Emite dois sons de 0,5 segundo5, informando que come�ou o backup
# 1000ms=1s
# repetir duas vezes
# -f = frequencia
#$ beep -l 20002
DATA=`date +%d-%m-%Y-%H.%M`

    echo -ne "Fim do backup: $DATA \n" >> $LOG;
    echo -ne "-------------------------------------------- \n" >> $LOG;

# DESMONTA O PONTO DE MONTAGEM /BACKUP
umount /mnt

fi

CAMINHO_BACKUP_LOG="/home/grupos/informatica/3-Software/Sistemas/Servidores/"
cp $LOG $CAMINHO_BACKUP_LOG
# FIM DAS INSTRU��ES 
