FROM maven:3.8.5-openjdk-17-slim

WORKDIR /app
EXPOSE 8080

RUN adduser --disabled-password -u 1001 bcc-user && chown -R bcc-user /app/
COPY target/*.jar /app/app.jar
USER admin-user

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar"]
