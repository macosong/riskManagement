#!/bin/bash
chmod 777 /root/jenkins/*
cd /root/jenkins
java -jar riskmanagement-0.0.1-SNAPSHOT.war &
