FROM openjdk:8-jre-alpine
COPY target/demo-0.0.1-SNAPSHOT.jar /opt/demo/
WORKDIR /opt/demo/
EXPOSE 8080
CMD ["java", "-jar", "/opt/demo/demo-0.0.1-SNAPSHOT.jar"]
