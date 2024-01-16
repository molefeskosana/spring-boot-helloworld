#
# Build stage
#

FROM maven:3.6.3-jdk-17 AS build

WORKDIR usr/src/app

COPY . ./

RUN mvn clean package

#
# Package stage
#

FROM openjdk:17-jre

ARG JAR_NAME="spring-boot-helloworld"

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/${JAR_NAME}.jar ./app.jar

CMD ["java","-jar", "./app.jar"]