FROM maven:3.9-eclipse-temurin-17 AS build
ARG APP_VERSION=1.0.0
COPY . .
RUN mvn package -Dproject.version=${APP_VERSION}

FROM alpine:3.23 AS package
COPY --from=build /target/*.jar maven-app.jar
CMD echo "build finished"
