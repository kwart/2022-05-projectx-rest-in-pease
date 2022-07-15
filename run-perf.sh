#!/bin/bash

JMETER_HOME=${HOME}/tools/apache-jmeter-5.4.3
RIP_HOME=`pwd`

rm -rf results
mkdir results

for i in 20 100 300; do
  $JMETER_HOME/bin/jmeter -n -JnoThreads=$i -t $RIP_HOME/hazelcast-map-get.jmx -l results/results-$i.csv -e -o results/report-$i  
done

