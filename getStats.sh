#!/bin/bash

curl -XGET "http://localhost:9200/index_1/_stats"/?pretty=true | more
