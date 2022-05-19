#!/bin/bash

echo "Starting replica set initialize"
until mongo --host $SERVER_IP:8001 --eval "print(\"waited for connection\")"
do
    sleep 2
done
until mongo --host $SERVER_IP:8002 --eval "print(\"waited for connection\")"
do
    sleep 2
done
until mongo --host $SERVER_IP:8003 --eval "print(\"waited for connection\")"
do
    sleep 2
done
echo "Connection finished"
echo "Creating replica set"
mongo --host mongo-1 <<EOF
    use admin;
    db.auth("$MONGO_INITDB_ROOT_USERNAME", "$MONGO_INITDB_ROOT_PASSWORD");
    rs.initiate(
        {
            _id: "rs0",
            version: 1,
            members: [
                { _id: 0, host : "$SERVER_IP:8001" },
                { _id: 1, host : "$SERVER_IP:8002" },
                { _id: 2, host : "$SERVER_IP:8003" }
            ]
        }
    );
EOF
echo "Replica set created"