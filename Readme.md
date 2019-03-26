# Ambiente
### Preparando o ambiente 
 [Instalando o docker](https://www.digitalocean.com/community/tutorials/como-instalar-e-usar-o-docker-no-ubuntu-18-04-pt)
 
### Excutando o código: 
Para executar o código basta executar esse comando no terminal dentro da pasta que contém o  \<arquivo>.rb e o Dockerfile.
>docker run -it --rm --name lex -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.5 ruby \<nome-do-arquivo>.rb

