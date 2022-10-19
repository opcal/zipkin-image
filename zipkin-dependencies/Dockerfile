FROM registry.gitlab.com/opcal-project/containers/eclipse-temurin:17-jdk as builder

WORKDIR /zipkin

RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s io.zipkin.dependencies:zipkin-dependencies:LATEST zipkin-dependencies.jar

FROM eclipse-temurin:8-jre

RUN apt-get update && apt-get -y install cron \
    && apt-get clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /zipkin /zipkin

COPY ${GITHUB_WORKSPACE}/zipkin-dependencies/start-zipkin-dependencies /usr/local/bin/
COPY ${GITHUB_WORKSPACE}/zipkin-dependencies/zipkin-dependencies-today /etc/cron.hourly/
COPY ${GITHUB_WORKSPACE}/zipkin-dependencies/zipkin-dependencies-yesterday /etc/cron.daily/

WORKDIR /zipkin

ENTRYPOINT ["start-zipkin-dependencies"]

