# 1단계: Build with Gradle 8.5 (기본 설치된 버전 사용)
FROM eclipse-temurin:21-jdk AS build

# 필요한 패키지 설치 (curl, unzip)
RUN apt-get update && apt-get install -y curl unzip

WORKDIR /app

COPY . .

# gradle 버전 확인 (8.5인지 확인용)
RUN gradle --version

# 프로젝트 빌드
RUN gradle build --no-daemon

# 2단계: Run 단계
FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]