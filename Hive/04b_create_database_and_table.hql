-- GDELT Project - Hive database and external table
-- Run inside Beeline after the files are in HDFS (Shell/04_hdfs_setup_and_upload.sh):
-- beeline -u 'jdbc:hive2://localhost:10000/'
--
-- The table is EXTERNAL: Hive stores only the schema and the HDFS location.
-- Dropping the table does not delete the files in /gdelt/raw/2026-11.
-- The 58 columns and their types match the DESCRIBE gdelt_events output
-- (Output/10_Verify The Schema.png).

SET hive.execution.engine=tez;

CREATE DATABASE IF NOT EXISTS gdelt_db;
USE gdelt_db;

CREATE EXTERNAL TABLE IF NOT EXISTS gdelt_events (
    GlobalEventID          BIGINT,
    SQLDATE                INT,
    MonthYear              INT,
    Year                   INT,
    FractionDate           DOUBLE,

    Actor1Code             STRING,
    Actor1Name             STRING,
    Actor1CountryCode      STRING,
    Actor1KnownGroupCode   STRING,
    Actor1EthnicCode       STRING,
    Actor1Religion1Code    STRING,
    Actor1Religion2Code    STRING,
    Actor1Type1Code        STRING,
    Actor1Type2Code        STRING,
    Actor1Type3Code        STRING,

    Actor2Code             STRING,
    Actor2Name             STRING,
    Actor2CountryCode      STRING,
    Actor2KnownGroupCode   STRING,
    Actor2EthnicCode       STRING,
    Actor2Religion1Code    STRING,
    Actor2Religion2Code    STRING,
    Actor2Type1Code        STRING,
    Actor2Type2Code        STRING,
    Actor2Type3Code        STRING,

    IsRootEvent            INT,
    EventCode              STRING,
    EventBaseCode          STRING,
    EventRootCode          STRING,
    QuadClass              INT,
    GoldsteinScale         DOUBLE,
    NumMentions            INT,
    NumSources             INT,
    NumArticles            INT,
    AvgTone                DOUBLE,

    Actor1Geo_Type         INT,
    Actor1Geo_FullName     STRING,
    Actor1Geo_CountryCode  STRING,
    Actor1Geo_ADM1Code     STRING,
    Actor1Geo_Lat          DOUBLE,
    Actor1Geo_Long         DOUBLE,
    Actor1Geo_FeatureID    STRING,

    Actor2Geo_Type         INT,
    Actor2Geo_FullName     STRING,
    Actor2Geo_CountryCode  STRING,
    Actor2Geo_ADM1Code     STRING,
    Actor2Geo_Lat          DOUBLE,
    Actor2Geo_Long         DOUBLE,
    Actor2Geo_FeatureID    STRING,

    ActionGeo_Type         INT,
    ActionGeo_FullName     STRING,
    ActionGeo_CountryCode  STRING,
    ActionGeo_ADM1Code     STRING,
    ActionGeo_Lat          DOUBLE,
    ActionGeo_Long         DOUBLE,
    ActionGeo_FeatureID    STRING,

    DATEADDED              STRING,
    SOURCEURL              STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '/gdelt/raw/2026-11';

-- Table statistics (numFiles = 7, numRows = 706,643, rawDataSize)
ANALYZE TABLE gdelt_events COMPUTE STATISTICS;
DESCRIBE FORMATTED gdelt_events;
