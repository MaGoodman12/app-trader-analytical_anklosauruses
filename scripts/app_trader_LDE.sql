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

SELECT *
FROM play_store_apps JOIN app_store_apps
ON play_store_apps.rating = app_store_apps.rating;

ALTER TABLE play_store_apps DROP COLUMN category;

SELECT * 
FROM play_store_apps;

ALTER TABLE play_store_apps DROP COLUMN install_count;

SELECT *
FROM play_store_apps JOIN app_store_apps
ON play_store_apps.rating = app_store_apps.rating;

SELECT rating
FROM play_store_apps
UNION ALL 
SELECT rating
FROM app_store_apps;

SELECT COUNT(*)
FROM play_store_apps JOIN app_store_apps
ON play_store_apps.rating = app_store_apps.rating;

ALTER TABLE app_store_apps DROP COLUMN currency;


SELECT *
FROM play_store_apps JOIN app_store_apps
ON play_store_apps.rating = app_store_apps.rating;

ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE INTEGER  USING (review_count::integer);

SELECT name, rating, review_count
FROM play_store_apps 
UNION ALL 
SELECT name,rating, review_count
FROM app_store_apps;

ALTER TABLE app_store_apps
RENAME COLUMN primary_genre TO genres;

SELECT name, rating, review_count,genres
FROM play_store_apps 
UNION ALL 
SELECT name,rating, review_count,genres
FROM app_store_apps;

SELECT name,rating, review_count, genres
FROM play_store_apps;
UNION ALL
SELECT name,rating, review_count, genres
FROM app_store_apps
WHERE rating > 4;

SELECT name,rating, review_count, genres
FROM app_store_apps
WHERE rating > 1
ORDER BY review_count DESC;

SELECT name,rating,review_count,genres
FROM play_store_apps
UNION ALL
SELECT name,rating,review_count,genres
FROM app_store_apps
WHERE rating = 5
ORDER BY review_count DESC;

SELECT name, rating, review_count, genres
FROM app_store_apps
WHERE rating >4 
ORDER BY review_count DESC
LIMIT 20;

SELECT SUM(review_count)
FROM play_store_apps;

SELECT name, rating, review_count, genres
FROM play_store_apps
WHERE rating >4 
ORDER BY review_count DESC
LIMIT 20;

SELECT name, rating, review_count, genres
FROM play_store_apps;


SELECT name, rating, review_count, genres
FROM app_store_apps
WHERE rating >4.5 
ORDER BY review_count DESC
LIMIT 20;

SELECT DISTINCT name, rating, review_count, genres
FROM play_store_apps
WHERE rating > 4
ORDER BY review_count DESC
LIMIT 20;

SELECT DISTINCT name, rating
FROM play_store_apps
WHERE rating > 4
ORDER BY rating DESC;

SELECT name, rating, genres, price
FROM play_store_apps
UNION ALL 
SELECT name, rating, genres, price
FROM app_store_apps
WHERE rating > 4
ORDER BY rating DESC;

ALTER TABLE play_store_apps ALTER COLUMN price TYPE numeric(5,2)  USING (price::numeric (5,2));

SELECT * 
FROM play_store_apps;

SELECT 
FROM play_store_apps
REPLACE(price, '$', '');

SELECT name, genres, rating
FROM play_store_apps
UNION ALL 
SELECT name, genres, rating
FROM app_store_apps
WHERE rating > 4.5
ORDER BY rating DESC
LIMIT 10;


--SELECT distinct name AS app_name, max(rating) AS rating, review_count, price, type
--FROM play_store_apps
--WHERE rating is not null
--	AND review_count >=100000
--	AND rating >= 4.5
--	AND type not like 'Free'
--GROUP BY review_count, app_name, price, type
--ORDER BY rating desc;

SELECT name, rating, review_count
FROM play_store_apps
UNION ALL
SELECT name, rating, review_count
FROM app_store_apps
	WHERE rating >= 4.5
ORDER BY review_count DESC;

-- replace(price, '$', '') for $ replace with nothing or add 
-- Free apps or 1.99, => $1 
-- top 2 apps

