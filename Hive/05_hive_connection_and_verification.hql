-- GDELT Project - Hive connection and verification
-- Source: GDELT.docx

-- Start Beeline from the shell:
-- beeline -u 'jdbc:hive2://localhost:10000/'

USE gdelt_db;
SHOW TABLES;

SELECT COUNT(*) FROM gdelt_events;

DESCRIBE gdelt_events;
