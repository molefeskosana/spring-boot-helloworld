#
# Build stage
#

FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR usr/src/app

COPY . ./

RUN mvn clean package -DskipTests=true

#
# Package stage
#

FROM openjdk:17-oracle

ARG JAR_NAME="spring-boot-helloworld-0.0.1-SNAPSHOT"

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/${JAR_NAME}.jar ./app.jar

CMD ["java","-jar", "./app.jar"]