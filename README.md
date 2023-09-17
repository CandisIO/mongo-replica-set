# MongoDB Replica Set

A Replica Set of MongoDB running in a Docker container

To run the container, execute the following command:

```shell
docker run -d -p 27017:27017 -p 27018:27018 -p 27019:27019 candis/mongo-replica-set
```

If you prefer, use Docker Compose instead:

```shell
docker-compose up -d
```

```yaml
version: "3.8"

services:
  mongors:
    image: elitale/mongo-cluster
    ports:
      - 27017:27017
      - 27018:27018
      - 27019:27019
    restart: always
```

Wait for 30 to 35 seconds in order to properly start all database instances and replica-set initialization.

## Configuration

Additionally, you can pass an env variable called `HOST` when running the container to configure the replica's hostname in docker. By default, it uses `localhost`.

Once ready, the replica-set can be accessed using the following connection string:

```shell
mongodb://localhost:27017,localhost:27018,localhost:27019/?replicaSet=rs0&readPreference=primary&ssl=false
```

If you're connecting from your host machine, you might need to set a new alias within `/etc/hosts`:

```
# /etc/hosts
127.0.0.1 HOST # where HOST is the value passed as env variable to the container
```
