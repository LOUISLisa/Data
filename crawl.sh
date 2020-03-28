#!/bin/bash

PWD=`pwd`
GIT=/home/barb/Working/Git
DATA_BASE=/home/barb/Working/Data
INDEX_DIR=${DATA_BASE}/Index
CRAWLED_DATA=${DATA_BASE}/Crawled

DOMAIN_TO_CRAWL=$1

cat ./Specific/$dir"_config.txt" config_base.txt > config.txt
echo " " 
echo "Running with this config: "
cat config.txt
echo " " 
 
./Specific/run_$dir.sh

