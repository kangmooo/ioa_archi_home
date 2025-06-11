# 1단계: Gradle을 사용해 빌드 (Build Stage)
FROM gradle:8.5-jdk17 AS build

WORKDIR /app
COPY . .

# 캐시를 활용하기 위해 dependencies 먼저 분리
RUN gradle build --no-daemon

# 2단계: 빌드된 JAR을 실행 (Runtime Stage)
FROM eclipse-temurin:17-jdk

WORKDIR /app

# build/libs 아래 생성된 JAR 파일 복사
COPY --from=build /app/build/libs/*.jar app.jar

# Render가 자동으로 PORT 환경변수를 설정하므로 이를 사용
EXPOSE 8080
ENV PORT=8080
ENTRYPOINT ["java", "-jar", "app.jar"]
