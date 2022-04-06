# Clínica App API - Dockerizada
## Sobre as US = User Stories:
### Caso queira ver as US, procure no README.md do repositório do mesmo nome, mas sem o "dockerizada" no final do nome.
# DOCKER
## DOCKER IMAGES
#### - Uma imagem é uma combinação de nossa aplicação e a infraestrutura que é requirida.
#### - Exemplo: Uma aplicação Java, nós precisamos do Java ligado num Tomcat num sistema operacional Linux e com Mysql ou Sql Databases.
#### - Toda esta informação irá dentro de um arquivo de imagem.
#### - E inúmeros containers similares podem ser lançados desse arquivo de imagem.
#### - Base para imagem com spring Boot:
````
FROM java:8
VOLUME /tmp
ADD target/flightservices-0.0.1-SNAPSHOT.jar flightservices-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "flightservices-0.0.1-SNAPSHOT.jar"]
````
#### 1. FROM java:8 = Dando partida num Container Linux que tem o Java também instalado.
#### 2. VOLUME /tmp = É um temp folder.
#### 3. ADD target/flightservices-0.0.1-SNAPSHOT.jar flightservices-0.0.1-SNAPSHOT.jar
##### = i. Adicionando um jar file do diretório target que tenho para o diretório target que estou construindo.
##### = ii. Ou seja, adicionando flightservices-0.0.1-SNAPSHOT.jar da minha máquina para o Container Docker que eu estou criando como  um arquivo.
#### 4. ENTRYPOINT = Estou copiando arquivos jar e spring boot jar, e estou correndo o arquivo jar dentro do Container.
#### - Tudo que preciso, para a aplicação em questão, está dentro destas quatro simples linhas.
#### - Uma vez criada esta imagem, posso acioná-la em outros números de containers dentro de inúmeras máquinas diferentes ou em máquinas virtuais dentro da mesma máquina.
## Componentes do Docker
### - Docker Hub ou Registry ( imagens pré-criadas ):
#### 1. Existem várias imagens que podem ser exploradas no docker hub:
##### i. java, tomcat, mysql, sql, nodejs e etc...
##### ii. E todas essas imagens vêm com um Sistema Operacional.
### - Docker Host:
#### 1. É a máquina em que temos instalado o Docker Software ou o Docker Desktop ou a Docker virtualização.
##### i. Entenda como host, tanto a máquina, pc ou laptop e até mesmo uma máquina in cloud.
#### 2. Dentro dele fica a Docker Engine:
##### i. É o responsável por acionar os containers, puxar ( pull ) as imagens do Registry ou Docker Hub e reconstruir as minhas imagens criadas localmente.
#### 3. Uma vez que faço um pull de uma imagem, essa fica alojada em meu docker host num registry dentro do Docker Host.
#### 4. É como se as imagens ficassem alojadas num registry dentro do meu próprio host.
#### 5. Containers ficam dentro do Docker Host e podem ser acionados destas imagens usando a virtualização que a plataforma docker provê.
### - Docker Client ( CLI - LINHAS DE COMANDO QUE INTERAGEM COM DOCKER Engine ):
#### 1. É uma linha de comando de grande utilizade que posso executar comandos dentro da Docker Engine.
#### 2. Por exemplo: se eu contruí um docker, ele será construído numa particular imagem em minha máquina.
##### i. Isto é uma imagem que eu criei.
##### ii. Antes de eu correr ou acionar um Container da Imagem, terei que construí a imagem.
##### iii. É possível fazer pull de imagens que estão no Registry:
````
docker pull <imagem>
````
##### iv. No Registry também tem uma porção de imagens prontas se eu não quiser utilizar a minha própria:
````
docker run <imagem>
````
## Passos para Dockerizar o Database:

### Setup - mysql container:
````

docker run -d -p 6666:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=test1234" --env="MYSQL_DATABASE=clinica" mysql
````
````
docker exec -it docker-mysql bash
````
````
mysql -u root -p test1234
````
````
mysql> show databases;
````
````
mysql> use clinica;
````
````
mysql> show tables; 
````
Outro Terminal:
````
docker exec -i docker-mysql mysql -uroot -ptest1234 clinica <clinica.sql
````

Criando o Container e fazendo o testing:
````
docker build -f Dockerfile -t clinica_app .
````
````
docker run -t --link docker-mysql:mysql -p 10555:8080 clinica_app
````
````
http://localhost:10555/clinicaservices/api/pacientes
````
#### O --link command permitirá que um reservation_app container possa utilizar a porta do MySQL

### Setup - sql ( postgresql ) container:
#### - Instalando uma Imagem postgresql:
````
docker run --name dbpostgresql -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres
````
#### 1. Ver imagem:
````
 docker images
 ````
#### 2. Ver container:
````
 docker ps
 ````
#### 3. Entrando no Docker Container ( root ):
````
docker exec -it dbpostgresql bash
````
#### 4. Acessando ao Database:
````
psql -h localhost -p 5432 -U postgres
````
#### 5. Listar Database:
````
\l
````
#### 6. Criar Database:
````
CREATE DATABASE clinica;
````
#### 7. Usando o Database específico:
````
 \c clinica
 ````
#### 8. Colar tabela: Só jogar ou criar a tabela lá clinica=#
#### 9. Verificar tabelas existentes:
````
\dt
````
## Passos para Dockerizar o APP:
### 1 - Configurando o application.properties
#### A. MYSQL:
##### - Uma vez que "containerizarmos" a aplicação e a acionarmos como um Container Docker, para que ela, como um Docker Container se comunique com outro Docker Container, ela deveria ter um nome de Container.
##### - Então, " docker-mysql " (não tem um padrão de nome. Mas assim é bom para diferenciarmos) é o nome que é dado ao mySQL Container:
````
spring.datasource.url=jdbc:mysql://docker-mysql:3306/clinica
spring.datasource.username=root
spring.datasource.password=test
server.servlet.context-path=/clinicaservices
````
#### B. POSTGRESQL:
##### - Fazemos o mesmo com o postgresql.
#### - Então, " dbpostgresql " foi o nome passado na criação da imagem do Database. Se esquecer isso daí , e colocar outro nome. Os containers não se encontrarão mesmo com esta configuração.
````
// postgresql
spring.datasource.url=jdbc:postgresql://dbpostgresql:5432/clinica
spring.datasource.username=postgres
spring.datasource.password=password
server.servlet.context-path=/clinicaservices
````
### 2 - Target
#### i. Apaga a pasta Target
#### ii. Roda o Maven sem os testes:
````
mvn clean install -Dmaven.test.skip=true -Dpmd.skip=true
````
#### iii. Daí aparecerá uma nova pasta Target. Verifique se está lá o app:
````
clinicaapi-0.0.1-SNAPSHOT.jar
````
#### iv. O copie e cole através do refatore. Mas não o refatore. Só copie e o cole no Dockerfile.

### 3 - Criando o Dockerfile 
#### Crie na Raiz do projeto um arquivo chamado Dockerfile (com 'D' maiúsculo mesmo)
````
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/clinicaapi-0.0.1-SNAPSHOT.jar clinicaapi.jar
ENTRYPOINT ["java", "-jar","/clinicaapi.jar"]
````
#### a. "FROM java:8" = Criado o Dockerfile que é o responsável em acionar ou criar a imagem baseada, no nosso caso, numa imagem java 8.
#### b. "VOLUME" = É opcional.
#### c. "ADD target" = Crie o Docker Container com o mesmo nome:
````
clinicaapi-0.0.1-SNAPSHOT.jar
````
#### d. "ENTRYPOINT" = é o Comando Docker ou Comando Docker File que informa ao Docker que os comandos devem correr dentro do Container assim que estiver no ponto de entrada assim que o Container subir e correr.

### 4 — Fazendo o Build da imagem criada e dê um nome: " clinica_app ":
````
docker build -f Dockerfile -t clinica_app .
````
#### - Ele fará o pull do Dockerfile.
### 5 — Verifica se a imagem está criada:
````
docker images
````
### 6 - Correndo o Link:
##### O " --link " permitirá que um reservation_app container possa utilizar a porta do POSTGRESQL
````
docker run -t --link dbpostgresql:postgres -p 8080:8080 clinica_app
````
### 7 — Fazendo o Teste:
````
localhost:8080/clinicaservices/api/pacientes
````
