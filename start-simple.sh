#!/bin/bash

JAVA_OPTS="$JAVA_OPTS -Dhazelcast.config=hazelcast-simple.xml -Dmapserver.notls=true" ./start.sh

