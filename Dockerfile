FROM openjdk:8-jre-alpine
COPY target/demo-0.0.1-SNAPSHOT.jar /opt/app
WORKDIR /opt/app
EXPOSE 8080
CMD ["java", "-jar", "/opt/app/demo-0.0.1-SNAPSHOT.jar"]
