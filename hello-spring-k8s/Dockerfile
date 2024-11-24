FROM maven:3.8.5-openjdk-17-slim AS MAVEN_BUILD
WORKDIR /app
COPY . .
RUN mvn -B clean install -DskipTests

FROM maven:3.8.5-openjdk-17-slim 
ENV TZ=Asia/Almaty
WORKDIR /app
EXPOSE 8080

RUN adduser --disabled-password -u 1001 admin-user && chown -R admin-user /app/
COPY --from=MAVEN_BUILD /app/target/*.jar /app/app.jar
USER admin-user
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar"]
