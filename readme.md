# Montando a estrutura necessária para o curso:

## Instalação do mysql:
```
sudo apt install mysql
pip install awscli
sudo apt install awscli
```

## Configuração do client amazon
```
sudo -i
aws configure
```
**Para criar a credencial de acesso ao bucket, deverá ser criado um usuário no IAM (serviço amazon)**
**Quando baixamos o arquivo csv, o campo password vem vazio e as células à esquerda são deslocadas. O último campo não é vazio.**

### para listar os buckets do awscli (como root):
```
aws s3 ls
```
