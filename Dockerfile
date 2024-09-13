# Usar a imagem base do Debian
FROM debian:latest

# Atualizar o sistema e instalar o Apache
RUN apt-get update && apt-get install -y apache2

# Copiar o arquivo index.html para o diretório padrão do Apache
COPY index.html /var/www/html/

# Expor a porta 80 para o tráfego HTTP
EXPOSE 80

# Comando para iniciar o Apache no modo foreground
CMD ["apachectl", "-D", "FOREGROUND"]
