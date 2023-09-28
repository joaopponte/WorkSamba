# Use uma imagem base Linux adequada, como Ubuntu, Alpine, ou outra de sua escolha
FROM ubuntu:20.04

# Atualize o sistema e instale o Samba
RUN apt-get update && \
    apt-get install -y samba

# Crie um diretório para compartilhar arquivos (por exemplo, "shared")
RUN mkdir -p /shared

# Configure o Samba para compartilhar o diretório "/shared"
RUN echo "[shared]" >> /etc/samba/smb.conf && \
    echo "   path = /shared" >> /etc/samba/smb.conf && \
    echo "   browseable = yes" >> /etc/samba/smb.conf && \
    echo "   read only = no" >> /etc/samba/smb.conf && \
    echo "   guest ok = yes" >> /etc/samba/smb.conf

# Exponha a porta do Samba (padrão é 139 e 445)
EXPOSE 139 445

# Inicialize o serviço Samba
CMD ["smbd", "--foreground", "--no-process-group"]