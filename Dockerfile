# 1단계: 빌드
FROM eclipse-temurin:21-jdk AS build

RUN apt-get update && apt-get install -y curl unzip
WORKDIR /app

COPY . .
RUN chmod +x ./gradlew

# 명확히 bootJar 실행
RUN ./gradlew bootJar --no-daemon

# 2단계: 실행
FROM eclipse-temurin:21-jre
WORKDIR /app

# 정확한 JAR 이름 지정
COPY --from=build /app/build/libs/app.jar app.jar

CMD ["java", "-jar", "app.jar"]
