FROM bitnami/java:1.8-prod

ARG BULLET_WS_VERSION=1.1.0
ARG BULLET_KAFKA_VERSION=1.2.2
ARG BULLET_HOME=/usr/local/var/bullet

ENV BULLET_SERVICE_HOME=${BULLET_HOME}/service
ENV BULLET_PUBSUB_HOME=${BULLET_HOME}/pubsub
ENV BULLET_KAFKA_VERSION=${BULLET_KAFKA_VERSION}

RUN mkdir -p ${BULLET_SERVICE_HOME} && \
    wget -q https://search.maven.org/remotecontent?filepath=com/yahoo/bullet/bullet-service/${BULLET_WS_VERSION}/bullet-service-${BULLET_WS_VERSION}-embedded.jar -O ${BULLET_SERVICE_HOME}/bullet-service-embedded.jar

RUN mkdir -p ${BULLET_PUBSUB_HOME} && \
    wget -q https://search.maven.org/remotecontent?filepath=com/yahoo/bullet/bullet-kafka/${BULLET_KAFKA_VERSION}/bullet-kafka-${BULLET_KAFKA_VERSION}-fat.jar -O ${BULLET_PUBSUB_HOME}/bullet-kafka-fat.jar

# Other ENVs for runtime configuration
ENV PORT=9999
ENV BULLET_CONFIG_DIR=${BULLET_HOME}/config
ENV PUBSUB_CONFIG_FILE=${BULLET_CONFIG_DIR}/kafka_pubsub_config.yaml
ENV QUERY_CONFIG_FILE=${BULLET_CONFIG_DIR}/query_config.yaml
ENV SCHEMA_FILE=${BULLET_CONFIG_DIR}/schema.json

WORKDIR ${BULLET_SERVICE_HOME}
EXPOSE ${PORT}
CMD [ \
    "java", \
    "-Dloader.path=${BULLET_PUBSUB_HOME}/bullet-kafka-fat.jar", \
    "-jar", \
    "bullet-service-embedded.jar", \
    "--bullet.pubsub.config=${PUBSUB_CONFIG_FILE}", \
    "--bullet.query.config=${QUERY_CONFIG_FILE}", \
    "--bullet.schema.file=${SCHEMA_FILE}", \
    "--server.port=${PORT}" \
    ]
