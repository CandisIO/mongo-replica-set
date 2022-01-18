# MongoDB Replica Set

A Replica Set of MongoDB running in a Docker container

## Not For Production

The key motivation for this image is to have a __ready-made__ replica set of MongoDB running inside docker container for __CI tests__.

To run the container, execute the following command:
```shell
docker run -d -p 27017:27017 -p 27018:27018 -p 27019:27019 candis/mongo-replica-set
```

Wait for 30 to 35 seconds in order to properly start all database instances and replica-set initialization.

Once ready, the replica-set can be accessed using the following connection string:
```shell
mongodb://localhost:27017,localhost:27018,localhost:27019/?replicaSet=rs0&readPreference=primary&ssl=false
```
