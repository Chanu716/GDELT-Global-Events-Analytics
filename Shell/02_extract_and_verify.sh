#!/bin/bash
# GDELT Project - extraction and dataset verification
# Source: GDELT.docx

cd ~/gdelt_project/data

for file in *.zip; do
    unzip -o "$file"
done

ls -lh

for file in *.export.CSV; do
    echo -n "$file : "
    wc -l < "$file"
done

for file in *.export.CSV; do
    echo -n "$file : "
    awk -F'	' 'NR==1 {print NF; exit}' "$file"
done

du -sh ~/gdelt_project/data
