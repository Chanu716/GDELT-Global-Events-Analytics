#!/bin/bash
# GDELT Project - HDFS structure and upload
# Source: GDELT.docx

hdfs dfs -mkdir -p /gdelt/raw/2026-11
hdfs dfs -mkdir -p /gdelt/processed
hdfs dfs -mkdir -p /gdelt/analytics

hdfs dfs -ls -h /gdelt
hdfs dfs -ls -h /gdelt/raw/2026-11

cd ~/gdelt_project/data
hdfs dfs -put -f 20261103.export.CSV /gdelt/raw/2026-11/
hdfs dfs -put -f 20261104.export.CSV /gdelt/raw/2026-11/
hdfs dfs -put -f 20261105.export.CSV /gdelt/raw/2026-11/
hdfs dfs -put -f 20261106.export.CSV /gdelt/raw/2026-11/
hdfs dfs -put -f 20261107.export.CSV /gdelt/raw/2026-11/
hdfs dfs -put -f 20261108.export.CSV /gdelt/raw/2026-11/
hdfs dfs -put -f 20261109.export.CSV /gdelt/raw/2026-11/

hdfs dfs -ls -h /gdelt/raw/2026-11
hdfs dfs -du -h /gdelt/raw/2026-11

# Verify data directly from HDFS
hdfs dfs -cat /gdelt/raw/2026-11/20261103.export.CSV | head -n 2
