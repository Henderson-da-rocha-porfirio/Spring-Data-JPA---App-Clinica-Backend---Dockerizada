FROM java:8
VOLUME /tmp
ADD target/clinicaapi-0.0.1-SNAPSHOT.jar clinicaapi-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","clinicaapi-0.0.1-SNAPSHOT.jar"]