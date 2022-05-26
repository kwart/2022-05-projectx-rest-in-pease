#!/bin/bash

JAVA_OPTS="$JAVA_OPTS -Dhazelcast.config=hazelcast-nosecurity.xml -Dmapserver.notls=true" ./start.sh

