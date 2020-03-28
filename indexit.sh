#!/bin/bash

for f in *.json; do
    echo "Indexing: " $f
    curl -XPOST 'localhost:9200/index_1/_doc/'$f'?pretty'  -H 'Content-Type: application/json' -d @$f
done
