FROM ghcr.io/opcal/eclipse-temurin:20-jdk AS builder

ARG ZIPKIN_VERSION

WORKDIR /zipkin

RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s 

FROM ghcr.io/opcal/eclipse-temurin:20-jre

LABEL org.opencontainers.image.authors="opcal@outlook.com"

COPY --from=builder /zipkin /zipkin

EXPOSE 9410 9411

ENTRYPOINT ["java", "-jar", "/zipkin/zipkin.jar"]

