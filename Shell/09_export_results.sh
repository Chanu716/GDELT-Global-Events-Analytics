#!/bin/bash
# GDELT Project - export Hive results to CSV for R/RStudio
# Run after Hive/04b_create_database_and_table.hql, with HiveServer2 running.
# Writes the CSV files that Visualization/08_r_visualizations.R reads.
# Graphs 1 and 8 need no file: the R script types those numbers in directly.

B="beeline -u jdbc:hive2://localhost:10000/gdelt_db --silent=true --showHeader=true --outputformat=csv2"
R=~/gdelt_project/results
mkdir -p "$R"

# Graph 2 - event categories
$B -e "SELECT EventRootCode AS eventrootcode, COUNT(*) AS event_count
       FROM gdelt_events
       WHERE EventRootCode IS NOT NULL
       GROUP BY EventRootCode
       ORDER BY event_count DESC" > "$R/event_categories.csv"

# Graph 3 - cooperation vs conflict
$B -e "SELECT CASE QuadClass
                WHEN 1 THEN 'Verbal Cooperation'
                WHEN 2 THEN 'Material Cooperation'
                WHEN 3 THEN 'Verbal Conflict'
                WHEN 4 THEN 'Material Conflict'
              END AS category,
              COUNT(*) AS event_count
       FROM gdelt_events
       WHERE QuadClass IS NOT NULL
       GROUP BY QuadClass
       ORDER BY QuadClass" > "$R/quadclass.csv"
# R reads this column as "Category"; Hive writes column names in lower case
sed -i '1s/category/Category/' "$R/quadclass.csv"

# Graph 4 - full Goldstein Scale distribution
$B -e "SELECT GoldsteinScale AS goldstein_scale, COUNT(*) AS event_count
       FROM gdelt_events
       WHERE GoldsteinScale IS NOT NULL
       GROUP BY GoldsteinScale
       ORDER BY goldstein_scale" > "$R/goldstein_distribution.csv"

# Graph 5 - top 15 countries
$B -e "SELECT ActionGeo_CountryCode AS country_code, COUNT(*) AS event_count
       FROM gdelt_events
       WHERE ActionGeo_CountryCode IS NOT NULL AND TRIM(ActionGeo_CountryCode) <> ''
       GROUP BY ActionGeo_CountryCode
       ORDER BY event_count DESC
       LIMIT 15" > "$R/top_countries.csv"

# Graph 6 - top 15 actors
$B -e "SELECT Actor1Name AS actor, COUNT(*) AS event_count
       FROM gdelt_events
       WHERE Actor1Name IS NOT NULL AND TRIM(Actor1Name) <> ''
       GROUP BY Actor1Name
       ORDER BY event_count DESC
       LIMIT 15" > "$R/top_actors.csv"

# Graph 7 - top 15 locations
$B -e "SELECT ActionGeo_Fullname AS location, COUNT(*) AS event_count
       FROM gdelt_events
       WHERE ActionGeo_Fullname IS NOT NULL AND TRIM(ActionGeo_Fullname) <> ''
       GROUP BY ActionGeo_Fullname
       ORDER BY event_count DESC
       LIMIT 15" > "$R/top_locations.csv"

ls -lh "$R"

# Copy to the Windows drive that RStudio reads from (D:/gdelt_project/results)
mkdir -p /mnt/d/gdelt_project/results
cp "$R"/*.csv /mnt/d/gdelt_project/results/
