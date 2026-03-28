FROM maven:3.9-eclipse-temurin-17 AS build

COPY . .

RUN mvn verify

FROM alpine:3.23 AS package

COPY --from=build /target/*.jar maven-app.jar

CMD echo "build finished"
