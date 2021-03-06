#!/bin/bash
docker network create --driver bridge dist_default
docker run -t -i -p 9864:9864 -d --network=dist_default --name=slave1 effeerre/hadoop
docker run -t -i -p 9863:9864 -d --network=dist_default --name=slave2 effeerre/hadoop
docker run -t -i -p 9862:9864 -d --network=dist_default --name=slave3 effeerre/hadoop
docker run -t -i -p 9870:9870 -p 54310:54310 --network=dist_default --name=master -v $PWD/data/hdfs:/data effeerre/hadoop
