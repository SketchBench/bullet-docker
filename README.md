# bullet-docker

## Start All Containers

```plain
docker-compose up --build
```

> _(Builds images before starting containers.)_

Optionally, append `--detach` to run containers in the background.

## Stop All Containers

```plain
docker-compose down
```

Optionally, include cleanup:

```plain
docker-compose down --rmi all --volumes --remove-orphans
```

## Start Bullet Spark Backend

_Execute the following commands in a separate terminal window if the containers are not running in the background._

### Create HDFS Directory For Checkpointing

```plain
docker exec namenode hadoop fs -mkdir -p /spark/checkpoints
```

### Submit Spark Application (Bullet Backend)

#### Unix

```plain
docker exec bullet-docker_spark_1 /opt/bitnami/spark/bin/spark-submit \
    --master spark://spark:7077 \
    --deploy-mode cluster \
    --class com.yahoo.bullet.spark.BulletSparkStreamingMain \
    --jars /opt/bitnami/spark/jars/bullet-kafka-1.2.2-fat.jar,/opt/bitnami/spark/jars/bullet-spark-example.jar \
    /opt/bitnami/spark/jars/bullet-spark-1.0.4-standalone.jar \
    --bullet-spark-conf /opt/bitnami/spark/conf/bullet_spark_kafka_settings.yaml
```

#### Windows

```plain
docker exec spark /opt/bitnami/spark/bin/spark-submit `
    --master spark://spark:7077 `
    --deploy-mode cluster `
    --class com.yahoo.bullet.spark.BulletSparkStreamingMain `
    --jars /opt/bitnami/spark/jars/bullet-kafka-1.2.2-fat.jar,/opt/bitnami/spark/jars/bullet-spark-example.jar `
    /opt/bitnami/spark/jars/bullet-spark-1.0.4-standalone.jar `
    --bullet-spark-conf /opt/bitnami/spark/conf/bullet_spark_kafka_settings.yaml
```
