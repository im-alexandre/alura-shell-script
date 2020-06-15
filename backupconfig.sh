#######################################
# SCRIPT BACKUP ARQUIVO DE CONFIG     #
#######################################

# DEFINE AS VARIÁVEIS QUE SERÃO UTILIZADAS

DATA=`date +%d-%m-%Y-%H.%M`
LOG="/var/log/backup.log"
# MONTA O PONTO DE MONTAGEM /BACKUP

#mount /dev/disk/by-uuid/f5e21395-03f0-4cd6-be49-37e595e5cedb /mnt 
mount /dev/sdb1 /mnt
montado=`mount | grep /mnt`

# SE A MONTAGEM NÃO ESTIVER UP ENTÃO FECHA, CASO CONTRÁRIO REALIZA O BACKUP
if [ -z "$montado"]; then
    echo -ne "Erro ao montar o HD, backup não realizado: $DATA \n"  >> $LOG;
    exit 1
else
    echo -ne "Início do backup: $DATA \n" >> $LOG;
# Emite um som de 1 segundo, informando que começou o backup
# 1000ms=1s
#$ beep -l 1000

# COMPACTA TODO O CONTEÚDO DAS PASTAS DENTRO DE /BACKUP.

service samba4 stop
tar -zcvf /mnt/sambaconfig-$DATA.tar.gz /usr/local/samba
service samba4 start


# Emite dois sons de 0,5 segundo5, informando que começou o backup
# 1000ms=1s
# repetir duas vezes
# -f = frequencia
#$ beep -l 20002
DATA=`date +%d-%m-%Y-%H.%M`

    echo -ne "Fim do backup: $DATA \n" >> $LOG;
    echo -ne "-------------------------------------------- \n" >> $LOG;

# DESMONTA O PONTO DE MONTAGEM /BACKUP
umount /mnt
