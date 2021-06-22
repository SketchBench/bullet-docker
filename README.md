# bullet-docker


```bash
docker exec bullet-docker_spark_1 /opt/bitnami/spark/bin/spark-submit \
    --master spark://spark:7077 \
    --deploy-mode cluster \
    --class com.yahoo.bullet.spark.BulletSparkStreamingMain \
    --jars /opt/bitnami/spark/jars/bullet-kafka-1.2.2-fat.jar,/opt/bitnami/spark/jars/bullet-spark-example.jar \
    /opt/bitnami/spark/jars/bullet-spark-1.0.4-standalone.jar \
    --bullet-spark-conf /opt/bitnami/spark/conf/bullet_spark_kafka_settings.yaml
```
