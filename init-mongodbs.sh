#!/bin/bash

# Data directory
DB1_DATA_DIR="/var/lib/mongo1"
DB2_DATA_DIR="/var/lib/mongo2"
DB3_DATA_DIR="/var/lib/mongo3"

# Log directory
DB1_LOG_DIR="/var/log/mongodb1"
DB2_LOG_DIR="/var/log/mongodb2"
DB3_LOG_DIR="/var/log/mongodb3"

REPLICA_SET="${REPLICA_SET_NAME:-rs0}"


mongod --dbpath ${DB1_DATA_DIR} --logpath ${DB1_LOG_DIR}/mongod.log --fork --port 27017 --bind_ip_all --replSet $REPLICA_SET
mongod --dbpath ${DB2_DATA_DIR} --logpath ${DB2_LOG_DIR}/mongod.log --fork --port 27018 --bind_ip_all --replSet $REPLICA_SET
mongod --dbpath ${DB3_DATA_DIR} --logpath ${DB3_LOG_DIR}/mongod.log --port 27019 --bind_ip_all --replSet $REPLICA_SET
