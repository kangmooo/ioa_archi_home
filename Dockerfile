# 1단계: Build with Gradle Wrapper (자동으로 gradle 설치 및 사용)
FROM eclipse-temurin:21-jdk AS build

# 필요한 패키지 설치 (curl, unzip)
RUN apt-get update && apt-get install -y curl unzip

WORKDIR /app

# 프로젝트 파일 복사 (필요 시 .dockerignore 설정 추천)
COPY . .

# 권한 문제 방지를 위해 gradlew 실행권한 부여
RUN chmod +x ./gradlew

# gradlew 버전 확인
RUN ./gradlew --version

# 프로젝트 빌드
RUN ./gradlew build --no-daemon

# 2단계: Run 단계
FROM eclipse-temurin:21-jre
WORKDIR /app

# 빌드된 jar 파일 복사
COPY --from=build /app/build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
