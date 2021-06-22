FROM bitnami/java:1.8-prod

ARG BULLET_WS_VERSION=1.1.0
ARG BULLET_KAFKA_VERSION=1.2.2
ARG BULLET_HOME=/usr/local/var/bullet
ENV BULLET_SERVICE_HOME=${BULLET_HOME}/service
ENV BULLET_PUBSUB_HOME=${BULLET_HOME}/pubsub
ENV BULLET_HOME=${BULLET_HOME}
ENV BULLET_KAFKA_VERSION=${BULLET_KAFKA_VERSION}
ENV PORT=9999

RUN mkdir -p ${BULLET_SERVICE_HOME}
RUN wget -q https://search.maven.org/remotecontent?filepath=com/yahoo/bullet/bullet-service/${BULLET_WS_VERSION}/bullet-service-${BULLET_WS_VERSION}-embedded.jar -O $BULLET_SERVICE_HOME/bullet-service.jar

RUN mkdir -p ${BULLET_PUBSUB_HOME}
RUN wget -q https://search.maven.org/remotecontent?filepath=com/yahoo/bullet/bullet-kafka/${BULLET_KAFKA_VERSION}/bullet-kafka-${BULLET_KAFKA_VERSION}-fat.jar -O ${BULLET_PUBSUB_HOME}/bullet-kafka-${BULLET_KAFKA_VERSION}-fat.jar

COPY configs/web-service/ ${BULLET_SERVICE_HOME}/

WORKDIR ${BULLET_SERVICE_HOME}
EXPOSE ${PORT}
CMD [ \
    "java", \
    "-Dloader.path=${BULLET_PUBSUB_HOME}/bullet-kafka-${BULLET_KAFKA_VERSION}-fat.jar", \
    "-jar", \
    "bullet-service.jar", \
    "--bullet.pubsub.config=./kafka_pubsub_config.yaml", \
    "--bullet.query.config=./query_config.yaml", \
    "--bullet.schema.file=./schema.json", \
    "--server.port=${PORT}", \
    "--logging.path=.", \
    "--logging.file=log.txt &> ./log.txt" \
    ]
