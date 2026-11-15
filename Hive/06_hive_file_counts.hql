-- GDELT Project - count contributed by each HDFS file
-- Source: GDELT.docx

SELECT
    INPUT__FILE__NAME AS source_file,
    COUNT(*) AS event_count
FROM gdelt_events
GROUP BY INPUT__FILE__NAME
ORDER BY source_file;
