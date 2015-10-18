#!/usr/bin/env bash

# cat + awk approach
time max_temperature_modified.sh

# cat + python script approach
time cat noaa.all | max_temperature_map.py | sort | max_temperature_reduce.py

# Hadoop Streaming with combiner + python
time hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar -input noaa.all -output output -mapper max_temperature_map.py -combiner max_temperature_reduce.py -reducer max_temperature_reduce.py

# cat + ruby script
time cat noaa.all | max_temperature_map.rb | sort | max_temperature_reduce.rb

# Hadoop Streaming with combiner + ruby
time hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar -input noaa.all -output output -mapper max_temperature_map.rb -combiner max_temperature_reduce.rb -reducer max_temperature_reduce.rb

# Hadoop Streaming + python
time hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar -input noaa.all -output output -mapper max_temperature_map.py -reducer max_temperature_reduce.py

# Hadoop Streaming + ruby
time hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar -input noaa.all -output output -mapper max_temperature_map.rb -reducer max_temperature_reduce.rb

# Hadoop with combiner function
time hadoop MaxTemperatureWithCombiner noaa.all output

# Hadoop
time hadoop MaxTemperature noaa.all output







