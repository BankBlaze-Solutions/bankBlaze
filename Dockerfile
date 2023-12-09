FROM amazoncorretto:21.0.1-alpine3.18

EXPOSE 8080

WORKDIR /opt

COPY target/bankBlaze-0.0.1-SNAPSHOT.jar /opt/bankBlaze-0.0.1-SNAPSHOT.jar

ENTRYPOINT [ "sh", "-c", "java -jar bankBlaze-0.0.1-SNAPSHOT.jar" ]
