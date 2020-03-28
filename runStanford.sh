#!/bin/bash

# This sets up the class paths
source ~/.bashrc_custom

DOMAIN=$1

PWD=`pwd`
GIT=/home/barb/Working/Git
SCRIPTS=/home/barb/Working/Scripts
DATA_BASE=/home/barb/Working/Data
INDEX_DIR=${DATA_BASE}/Index
CRAWLED_DATA=${DATA_BASE}/Crawled
POST_PROCESS_JAR=$GIT/PostProcess/target/bbt-post-process-1.0.0-SNAPSHOT.jar

TYPE=JobBoards
JOB_BOARDS_OUTPUT=${CRAWLED_DATA}/${TYPE}

SPECIFIC_OUTPUT=${JOB_BOARDS_OUTPUT}/$DOMAIN

echo "Generating Input Files..."
# First: run across the crawled data and produce files that are in 
# format to make things a little easier for Stanford
# This will produce files with the _stanford_input appendage
for f in $SPECIFIC_OUTPUT/*_;  do

    java -jar $POST_PROCESS_JAR GenStanfordInput $f 

done

echo "Done with Input Files..."
# Second: run across the stanford_input files and execute the core NLP 
cd $SPECIFIC_OUTPUT
for f in *_stanford_input; do

      stanford=$f"stanford_nlp"

      # Skip files that have already been processed
      if [ -f $stanford ]; then 
         echo " $stanford already exists" 
      else 

         java -mx3g edu.stanford.nlp.pipeline.StanfordCoreNLP -outputFormat json -file $f

         # Stanford is going to default to an output named *.json.
         # Move that into a file named "stanford_nlp"
         rename 's/stanford_input.json/stanford_nlp/' $f.json

         # Slow it down to avoid burning up the CPU.  Litterally.
         sleep 60s
 
      fi
done

# Third: process over the *stanfor_nlp files to generate "extra fields" for the index 
cd $SCRIPTS
for f in $SPECIFIC_OUTPUT/*_stanford_nlp; do

    # Output will be *_stanford_extra_fields
    java -jar $POST_PROCESS_JAR ParseStanford $f 

done

# Fourth: Update the _index file with the extra fields
for f in $SPECIFIC_OUTPUT/*_; do

  if [ -f $f"stanford_extra_fields" ]; then

    # Output will be *_stanford_extra_fields
    java -jar $POST_PROCESS_JAR UpdateIndex $f"index" $f"stanford_extra_fields" 

  fi

done

# Fifth: Compute Statistics
java -jar $GIT/PostProcess/target/bbt-post-process-1.0.0-SNAPSHOT.jar ComputeStats $SPECIFIC_OUTPUT

