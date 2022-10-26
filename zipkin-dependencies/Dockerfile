FROM ghcr.io/opcal/eclipse-temurin:17-jdk as builder

WORKDIR /zipkin

RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s io.zipkin.dependencies:zipkin-dependencies:LATEST zipkin-dependencies.jar

FROM eclipse-temurin:8-jre

RUN apt-get update && apt-get -y install cron \
    && apt-get clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /zipkin /zipkin

COPY ${PROJECT_DIR}/zipkin-dependencies/start-zipkin-dependencies /usr/local/bin/
COPY ${PROJECT_DIR}/zipkin-dependencies/zipkin-dependencies-today /etc/cron.hourly/
COPY ${PROJECT_DIR}/zipkin-dependencies/zipkin-dependencies-yesterday /etc/cron.daily/

WORKDIR /zipkin

ENTRYPOINT ["start-zipkin-dependencies"]

