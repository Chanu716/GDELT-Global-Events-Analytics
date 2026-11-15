-- GDELT Project - eight analytical queries
-- Source: GDELT.docx

-- Analysis 1 - Events by date/year
SELECT
    Year,
    COUNT(*) AS event_count
FROM gdelt_events
GROUP BY Year
ORDER BY Year;

-- Analysis 2 - Event categories
SELECT
    EventRootCode,
    COUNT(*) AS event_count
FROM gdelt_events
WHERE EventRootCode IS NOT NULL
GROUP BY EventRootCode
ORDER BY event_count DESC;

-- Analysis 3 - Conflict vs cooperation
SELECT
    QuadClass,
    COUNT(*) AS event_count
FROM gdelt_events
WHERE QuadClass IS NOT NULL
GROUP BY QuadClass
ORDER BY QuadClass;

-- Analysis 4 - Global impact / Goldstein score
SELECT
    COUNT(GoldsteinScale) AS events_with_goldstein,
    ROUND(AVG(GoldsteinScale), 3) AS average_goldstein,
    ROUND(MIN(GoldsteinScale), 3) AS minimum_goldstein,
    ROUND(MAX(GoldsteinScale), 3) AS maximum_goldstein
FROM gdelt_events
WHERE GoldsteinScale IS NOT NULL;

-- Analysis 5 - Most active countries
SELECT
    ActionGeo_CountryCode AS country_code,
    COUNT(*) AS event_count
FROM gdelt_events
WHERE ActionGeo_CountryCode IS NOT NULL
  AND TRIM(ActionGeo_CountryCode) <> ''
GROUP BY ActionGeo_CountryCode
ORDER BY event_count DESC
LIMIT 15;

-- Analysis 6 - Most frequently involved actors
SELECT
    Actor1Name AS actor,
    COUNT(*) AS event_count
FROM gdelt_events
WHERE Actor1Name IS NOT NULL
  AND TRIM(Actor1Name) <> ''
GROUP BY Actor1Name
ORDER BY event_count DESC
LIMIT 15;

-- Analysis 7(i) - Geographic distribution
SELECT
    ActionGeo_Fullname AS location,
    COUNT(*) AS event_count
FROM gdelt_events
WHERE ActionGeo_Fullname IS NOT NULL
  AND TRIM(ActionGeo_Fullname) <> ''
GROUP BY ActionGeo_Fullname
ORDER BY event_count DESC
LIMIT 15;

-- Analysis 7(ii) - Geographic coordinates
SELECT
    ActionGeo_Lat AS latitude,
    ActionGeo_Long AS longitude,
    COUNT(*) AS event_count
FROM gdelt_events
WHERE ActionGeo_Lat IS NOT NULL
  AND ActionGeo_Long IS NOT NULL
GROUP BY ActionGeo_Lat, ActionGeo_Long
ORDER BY event_count DESC
LIMIT 20;

-- Analysis 8(i) - Event intensity and media attention
SELECT
    COUNT(*) AS total_events,
    ROUND(AVG(NumMentions), 2) AS avg_mentions,
    ROUND(AVG(NumSources), 2) AS avg_sources,
    ROUND(AVG(NumArticles), 2) AS avg_articles,
    ROUND(AVG(AvgTone), 2) AS avg_tone,
    MAX(NumMentions) AS max_mentions,
    MAX(NumSources) AS max_sources,
    MAX(NumArticles) AS max_articles
FROM gdelt_events;

-- Analysis 8(ii) - Most heavily mentioned events
SELECT
    GlobalEventID,
    Year,
    EventRootCode,
    NumMentions,
    NumSources,
    NumArticles,
    AvgTone,
    GoldsteinScale
FROM gdelt_events
WHERE NumMentions IS NOT NULL
ORDER BY NumMentions DESC
LIMIT 15;
