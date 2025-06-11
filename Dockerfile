FROM gradle:8.7.0-jdk21 AS build

WORKDIR /app
COPY . .

RUN gradle build --no-daemon

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]

