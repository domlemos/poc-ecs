### Autodocker

Projeto base para o ambiente de denvolvimento local utilizando docker.

* [Imagens docker](#imagens-docker)
* [Serviços já definidos](#servicos-definidos)
* [Configurando seu ambiente](#configurando-ambiente)
* [Criando seu próprio serviço](#criando-servicos)


<a name="imagens-docker"></a>
### Imagens docker

Repositórios|Descrição
---|---
autodoc/php5.6-apache|php5.6 + apache2 + nodejs + bower + phpunit + composer + deployer-php
autodoc/php7.1-apache|php7.1 + apache2 + nodejs + bower + phpunit + composer + deployer-php 

<a name="servicos-definidos"></a>
#### Serviços já definidos

Lista de todos os serviços pré-definidos no arquivo de docker-compose-exemplo.tml

* gdfor
* cockpit
* databook
* checklist
* fvm
* fvs2
* entrega
* calibracao
* sac
* gestao
* controletec
* qro
* prazos-projetos
* iss
* personalizacao
* fvm
* for205
* for147
* changelog 


<a name="configurando-ambiente"></a>
#### Configurando seu ambiente

faça o git clone desse projeto.

```
git clone git@code.autodoc.com.br:geral/autodocker.git
```


Renomeie o arquivo docker-compose-exemplo.yml para docker-compose.yml.

```shell
cp docker-compose-exemplo.yml docker-compose.yml
```

Executando um serviço pré-definido **(gdfor)**. 

```shell
docker-compose up -d gdfor
```

Executando mais de um serviço  **(gdfor, databook)**. 

```shell
docker-compose up -d gdfor databook
```

Acessando um serviço com usuário **root**.

```shel
docker-compose exec gdfor bash
```

Acessando um serviço com usuário **application**

> Sempre que precisar utilizar algum comando que gere arquivos na aplicação (Ex: compser install, bower install), acesse o serviço com o usuário application

```shell
docker-compose exec --user=application gdfor bash
```

<a name="criando-servicos"></a>
#### Criando seu propŕio serviço

Caso você queira adicionar mais serviços.

* Copie o bloco abaixo.
* Cole dentro do nó `servico` do seu arquivo docker-compose.yml
* Renomeie a variável `$nome` para o nome do seu serviço desejado

```yml
    $nome:
        image: autodoc/php5.6-apache
        container_name: $nome
        hostname: '$nome.app'
        environment:
            - APACHE_DOCUMENT_ROOT=/home/application/$nome
            - CERT_NAME=shared
            - VIRTUAL_HOST=$nome.app
        depends_on:
            - nginx-proxy
            - mysql
        volumes:
            - ./../$nome:/home/application/$nome
        networks:
            - application
```