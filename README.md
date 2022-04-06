# Clínica App Backend Api Restful Dockerizada
### US = User Stories = Se quiser, der uma olhada no repositório de mesmo nome mas sem o " Dockerizada " no final.
# DOCKER
## IMAGES
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
## Configurando Docker

### Setup the mysql container:

docker run -d -p 6666:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=test1234" --env="MYSQL_DATABASE=clinicals" mysql

docker exec -it docker-mysql bash

# mysql -uroot -p 
test1234

mysql> show databases;

mysql> use clinicals;

mysql> show tables; 


Another Terminal:

docker exec -i docker-mysql mysql -uroot -ptest1234 clinicals <clinicals.sql


Application Container and testing:

docker build -f Dockerfile -t clinicals_app .

docker run -t --link docker-mysql:mysql -p 10555:8080 clinicals_app

http://localhost:10555/clinicalservices/api/patients

The --link command will allow the reservation_app container to use the port of MySQL



### Setup the sql container:
#### - Instalando uma Imagem postgresql:
````
docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres
````
#### 1. Ver imagem:
````
 docker images
 ````
#### 2. Ver container:
````
 docker ps
 ````
#### 3. Entrando no Docker Container:
````
docker exec -it some-postgres bash
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
#### 8. Colar tabela: Só jogar ou criar a tabela lá
#### 9. Verificar tabelas existentes:
````
\dt
````
