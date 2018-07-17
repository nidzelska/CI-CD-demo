FROM openjdk:8-jre-alpine
COPY app.jar /opt/app/
WORKDIR /opt/app/
EXPOSE 8080
CMD [ "java", "-jar", "/opt/app/app.jar" ]
