#!/bin/bash
# GDELT Project - Hadoop/Hive services
# Source: GDELT.docx

start-dfs.sh
start-yarn.sh
jps
hive --service metastore
# hiveserver2 is started in a separate terminal:
hiveserver2
