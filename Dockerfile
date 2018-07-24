FROM openjdk:8-jre-alpine
COPY /target/demo-0.0.1-SNAPSHOT.jar /home
WORKDIR /home
EXPOSE 8080
CMD ["java", "-jar", "/home/demo-0.0.1-SNAPSHOT.jar"]
