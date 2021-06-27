# bullet-docker

## Start All Containers

```plain
docker-compose up --build
```

> _(Builds images before starting containers.)_

Optionally, append `--detach` to run containers in the background.

_Some containers might restart until the infrastructure containers (Spark, Kafka, Zookeeper, Hadoop) are fully running._

## Stop All Containers

```plain
docker-compose down
```

Optionally, include cleanup:

```plain
docker-compose down --rmi all --volumes --remove-orphans
```
