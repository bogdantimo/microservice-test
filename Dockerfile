FROM maven:3.6.2-jdk-11-slim AS build
WORKDIR /usr/src/app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:11.0.4-jre-slim

# Add a esgenius user to run the application so that it doesn't need to run as root
RUN adduser --gecos '' --disabled-password --shell /bin/sh esgenius
WORKDIR /home/esgenius

COPY --from=build /usr/src/app/target/microservice-test-0.0.1.jar /home/esgenius/microservice-test-0.0.1.jar

RUN chmod +x /home/esgenius/microservice-test-0.0.1.jar

USER esgenius

ENTRYPOINT ["java", "-jar", "microservice-test-0.0.1.jar"]

EXPOSE 8080
