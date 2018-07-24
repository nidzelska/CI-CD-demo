FROM openjdk:8-jre-alpine
COPY demo-0.0.1-SNAPSHOT.jar /home
WORKDIR /home
EXPOSE 8080
CMD ["java", "-jar", "/opt/demo/demo-0.0.1-SNAPSHOT.jar"]