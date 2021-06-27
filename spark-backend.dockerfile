FROM docker.io/bitnami/spark:3

ARG BULLET_EXAMPLES_VERSION=1.0.0
ARG BULLET_KAFKA_VERSION=1.2.2
ARG BULLET_SPARK_VERSION=1.0.4

# bullet-spark-example
RUN mkdir -p /tmp/examples_artifacts && \
    curl --retry 2 -L -s -o /tmp/examples_artifacts.tar.gz https://github.com/bullet-db/bullet-db.github.io/releases/download/v${BULLET_EXAMPLES_VERSION}/examples_artifacts.tar.gz && \
    tar -xzf /tmp/examples_artifacts.tar.gz -C /tmp/examples_artifacts && \
    mv /tmp/examples_artifacts/bullet-examples/backend/spark/bullet-spark-example.jar /opt/bitnami/spark/jars/ && \
    rm -rf /tmp/examples_artifacts*

# bullet-kafka (fat jar)
RUN curl --retry 2 -L -s -o /opt/bitnami/spark/jars/bullet-kafka-${BULLET_KAFKA_VERSION}-fat.jar https://search.maven.org/remotecontent?filepath=com/yahoo/bullet/bullet-kafka/${BULLET_KAFKA_VERSION}/bullet-kafka-${BULLET_KAFKA_VERSION}-fat.jar

# bullet-spark (standalone)
RUN curl --retry 2 -L -s -o /opt/bitnami/spark/jars/bullet-spark-${BULLET_SPARK_VERSION}-standalone.jar https://search.maven.org/remotecontent?filepath=com/yahoo/bullet/bullet-spark/${BULLET_SPARK_VERSION}/bullet-spark-${BULLET_SPARK_VERSION}-standalone.jar
