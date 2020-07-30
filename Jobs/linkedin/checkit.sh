#!/bin/bash


OLD_PATH=/home/barb/Add/Data/Jobs/linkedin

for f in *_; do

    FULL_FILE=${OLD_PATH}/${f}
    if [ -e ${FULL_FILE} ]; then 
         echo "Exists: " ${FULL_FILE}
         cat ${FULL_FILE} | grep Url | grep -v Seed | grep -v keywords
    fi
done
    
