SELECT *
FROM play_store_apps;

SELECT *
FROM app_store_apps;

SELECT DISTINCT name 
FROM app_store_apps;

SELECT COUNT(DISTINCT(primary_genre))
FROM app_store_apps;
--23

SELECT COUNT(DISTINCT(genres))
FROM play_store_apps; 
--119

SELECT (review_count)
FROM app_store_apps;

SELECT ROUND(review_count,2)
FROM play_store_apps;

SELECT COUNT(DISTINCT(category))
FROM play_store_apps;

SELECT DISTINCT category
FROM play_store_apps;
