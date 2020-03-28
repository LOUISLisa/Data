#!/bin/bash

JAR=/home/barb/Working/Git/Crawler4J/target/bbt-crawler4j-1.0.0-SNAPSHOT.jar
CRAWL_CONFIG=/home/barb/Working/Git/Scripts/config_JobBoards.txt
LOGGING_CONFIG=-Djava.util.logging.config.file=/home/barb/Working/Git/Scripts/logger.txt

java -jar $LOGGING_CONFIG $JAR $CRAWL_CONFIG  "https://www.crypto-careers.com/jobs/search?utf8=%E2%9C%93&q=Blockchain&cat=&l=&lat=&long=&d=" 
