#!/usr/bin/env bash
 
# NCDC Weather file to load into hadoop
target="/home/user/Projects/Hadoop/data/ftp.ncdc.noaa.gov/pub/data/noaa";
 
# Un-gzip each station file and concat into one file
echo "reporter:status:Un-gzipping $target" >&2
for file in $target/2005/*
do
  gunzip -c $file >> $target.all
  echo "reporter:status:Processed $file" >&2
done

