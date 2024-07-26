FROM ghcr.io/opcal/eclipse-temurin:17-jdk AS builder

ARG ZIPKIN_VERSION

WORKDIR /zipkin

RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s io.zipkin.dependencies:zipkin-dependencies:LATEST zipkin-dependencies.jar

FROM eclipse-temurin:8-jre
LABEL org.opencontainers.image.authors="opcal@outlook.com"

WORKDIR /zipkin

ENV STORAGE_TYPE=""

ENV JAVA_OPTS="-Xms512m -Xmx512m -XX:+ExitOnOutOfMemoryError"

RUN apt-get update && apt-get -y install cron \
    && apt-get clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /zipkin /zipkin

COPY zipkin-dependencies/start-zipkin-dependencies /usr/local/bin/
COPY zipkin-dependencies/zipkin-dependencies-today /etc/cron.hourly/
COPY zipkin-dependencies/zipkin-dependencies-yesterday /etc/cron.daily/

ENTRYPOINT ["start-zipkin-dependencies"]

