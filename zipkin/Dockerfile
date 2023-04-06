FROM ghcr.io/opcal/eclipse-temurin:20-jdk as builder

WORKDIR /zipkin

RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s 

RUN jar xf zipkin.jar ;\
    rm -f zipkin.jar**

WORKDIR /docker-bin

RUN curl -sSLO https://raw.githubusercontent.com/openzipkin/zipkin/master/docker/start-zipkin ;\
    chmod +x start-zipkin

FROM ghcr.io/opcal/eclipse-temurin:20-jre

LABEL org.opencontainers.image.authors="opcal@outlook.com"

ENV MODULE_OPTS=

COPY --from=builder /docker-bin/* /usr/local/bin/
COPY --from=builder /zipkin /zipkin

WORKDIR /zipkin

EXPOSE 9410 9411

ENTRYPOINT ["start-zipkin"]

