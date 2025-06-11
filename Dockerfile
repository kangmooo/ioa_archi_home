# 1단계: Build stage (JDK 24 사용)
FROM gradle:8.7.0-jdk24 AS builder
WORKDIR /app
COPY . .
RUN gradle bootJar --no-daemon

# 2단계: Runtime stage (JDK 24 사용)
FROM eclipse-temurin:24-jdk-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar

# Render 환경 변수 포트 설정
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
