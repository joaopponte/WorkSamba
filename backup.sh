#!/bin/bash

# Obtém a data atual para nomear o arquivo de backup
backup_date=$(date +"%d_%m_%y")
backup_filename="Backup_${backup_date}.zip"

# Diretórios a serem copiados para o backup
folders_to_backup=("private" "public" "usr1" "usr2")

# Cria um arquivo ZIP para o backup
zip -r /backups/$backup_filename /source/private /source/public /source/usr1 /source/usr2

echo "Backup concluído: $backup_filename"
