# myproject/Dockerfile
FROM httpd:2.4

# Instalar Node.js
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Copiar arquivos de configuração do Apache
COPY apache/000-default.conf /usr/local/apache2/conf/extra/000-default.conf

# Copiar arquivos HTML padrão
COPY index.html /usr/local/apache2/htdocs/

# Copiar o diretório de origem para dentro do contêiner
COPY . /app

# Definir o diretório de trabalho
WORKDIR /app

# Instalar dependências e executar o comando npm run build
RUN npm install && \
    npm run build

# Copiar os arquivos gerados para o diretório htdocs do Apache
RUN cp -r dist/* /usr/local/apache2/htdocs/

# Habilitar módulos do Apache e incluir a configuração customizada
RUN sed -i 's/^#\(LoadModule rewrite_module modules\/mod_rewrite.so\)/\1/' /usr/local/apache2/conf/httpd.conf \
    && echo 'Include /usr/local/apache2/conf/extra/000-default.conf' >> /usr/local/apache2/conf/httpd.conf
