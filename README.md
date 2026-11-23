# GDELT Global Events – Efficient Spatiotemporal Event Analytics

Code for the GDELT Big Data analytics project.

## Repository structure

- **Shell/** — Ubuntu/WSL shell scripts for dataset setup, extraction, Hadoop/Hive services, HDFS directories, and upload.
- **Hive/** — Hive/Beeline HQL for verification, file-level counts, and the eight analytical query areas.
- **Visualization/** — R/RStudio and ggplot2 visualization code.
- **Output/** — Output Screenshots.

## Run order

1. `Shell/01_setup_and_download.sh` — project folders and the seven daily downloads
2. `Shell/02_extract_and_verify.sh` — unzip, line counts, 58-field check
3. `Shell/03_start_services.sh` — HDFS, YARN, Hive metastore and HiveServer2 (metastore and HiveServer2 each in their own terminal)
4. `Shell/04_hdfs_setup_and_upload.sh` — HDFS folders and upload to `/gdelt/raw/2026-11`
5. `Hive/04b_create_database_and_table.hql` — `gdelt_db` and the 58-column external table `gdelt_events`
6. `Hive/05_hive_connection_and_verification.hql`, `Hive/06_hive_file_counts.hql` — record and per-file counts
7. `Hive/07_hive_analytics.hql` — the eight analyses
8. `Shell/09_export_results.sh` — export results to CSV for R
9. `Visualization/08_r_visualizations.R` — the eight ggplot2 graphs

## Technology stack

Hadoop 3.5.0 · HDFS · Hive 4.1.0 · Tez 0.10.5 · YARN · R/RStudio · ggplot2

## Dataset

Seven GDELT daily event files from 3 November 2026 through 9 November 2026 were processed, containing **706,643 events** across **58 columns**.

## Important

The repository contains source code and output only. Dataset files, reports, and presentation files are intentionally excluded.
