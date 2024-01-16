#
# Build stage
#

FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR usr/src/app

COPY . ./

RUN mvn clean package

#
# Package stage
#

FROM openjdk:17-oracle

ARG JAR_NAME="spring-boot-helloworld"

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/${JAR_NAME}.jar ./app.jar

CMD ["java","-jar", "./app.jar"]