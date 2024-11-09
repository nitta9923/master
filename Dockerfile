# ベースイメージ
FROM openjdk:latest

# 作業ディレクトリを指定
WORKDIR /app

# Gradleのインストール
COPY gradle /app/gradle
COPY build.gradle settings.gradle gradlew /app/
RUN ./gradlew build || return 0

# ソースコードをコピーし、ビルド
COPY . /app
RUN ./gradlew build

# アプリケーションを起動
ENTRYPOINT ["java", "-jar", "build/libs/product-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
