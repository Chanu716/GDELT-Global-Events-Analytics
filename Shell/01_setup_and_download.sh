#!/bin/bash
# GDELT Project - project folders and dataset download
# Source: GDELT.docx

mkdir -p ~/gdelt_project/data
mkdir -p ~/gdelt_project/results
mkdir -p ~/gdelt_project/r
mkdir -p ~/gdelt_project/screenshots
cd ~/gdelt_project
pwd
ls -lah

cd ~/gdelt_project/data
wget https://data.gdeltproject.org/events/20261103.export.CSV.zip
wget https://data.gdeltproject.org/events/20261104.export.CSV.zip
wget https://data.gdeltproject.org/events/20261105.export.CSV.zip
wget https://data.gdeltproject.org/events/20261106.export.CSV.zip
wget https://data.gdeltproject.org/events/20261107.export.CSV.zip
wget https://data.gdeltproject.org/events/20261108.export.CSV.zip
wget https://data.gdeltproject.org/events/20261109.export.CSV.zip
ls -lh
