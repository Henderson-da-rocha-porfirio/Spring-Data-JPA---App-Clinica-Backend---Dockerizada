FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/clinicaapi-0.0.1-SNAPSHOT.jar clinicaapi.jar
ENTRYPOINT ["java", "-jar","/clinicaapi.jar"]
