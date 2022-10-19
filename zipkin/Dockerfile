FROM registry.gitlab.com/opcal-project/containers/eclipse-temurin:17-jdk as builder

WORKDIR /zipkin

RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s 

FROM registry.gitlab.com/opcal-project/containers/eclipse-temurin:17-jre

COPY --from=builder /zipkin /zipkin

WORKDIR /zipkin

EXPOSE 9410 9411

ENTRYPOINT ["java", "-jar", "/zipkin/zipkin.jar"]

