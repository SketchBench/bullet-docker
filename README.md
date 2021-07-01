# Docker images for Bullet

Bullet is a "real-time query engine for very large data streams". More info in the [official docs](https://bullet-db.github.io/).  
This repository contains the containerized versions of various components in [Bullet's architecture](https://bullet-db.github.io/#architecture).

## Containerized Components

- [Spark Backend](https://github.com/SketchBench/bullet-docker/tree/main/components/spark)
- [Web Service](https://github.com/SketchBench/bullet-docker/tree/main/components/service)
- [UI](https://github.com/SketchBench/bullet-docker/tree/main/components/ui)

_Yet to get containerized: [Storm Backend](https://github.com/bullet-db/bullet-storm)._

## Bullet Quick Start

This repo also contains a [`docker-compose.yaml`](https://github.com/SketchBench/bullet-docker/blob/main/docker-compose.yaml) to start the [Bullet Quick Start application on Apache Spark Streaming](https://bullet-db.github.io/quick-start/spark/).

Besides the Bullet components, the [`docker-compose.yaml`](https://github.com/SketchBench/bullet-docker/blob/main/docker-compose.yaml) also starts:

- `kafka` as [Bullet PubSub](https://bullet-db.github.io/pubsub/kafka/) ([`docker.io/bitnami/kafka`](https://hub.docker.com/r/bitnami/kafka))
- `zookeeper` for Kafka ([`docker.io/bitnami/zookeeper`](https://hub.docker.com/r/bitnami/zookeeper))
- `kafdrop` for Kafka monitoring/debugging ([`obsidiandynamics/kafdrop`](https://hub.docker.com/r/obsidiandynamics/kafdrop))
- `spark` with 1 master and 3 worker nodes as the streaming platform to run Bullet's Backend ([`docker.io/bitnami/spark`](https://hub.docker.com/r/bitnami/spark))
- `hadoop` to provide `hdfs` for the checkpointing of Bullet's Spark Backend ([`big-data-europe/docker-hadoop`](https://github.com/big-data-europe/docker-hadoop/blob/master/docker-compose.yml))

_Please note: The Bullet Spark Backend container is based on `docker.io/bitnami/spark` and also used to bring up the Apache Spark cluster itself to ensure all necessary jars are present._

### Start All Containers

```plain
docker-compose up
```

Optionally, append `--detach` to run containers in the background.

_Some containers might restart until the infrastructure containers (Spark, Kafka, Zookeeper, Hadoop) are fully running._

## Stop All Containers

```plain
docker-compose down
```

Optionally, include cleanup parameters `--rmi all --volumes --remove-orphans`.
