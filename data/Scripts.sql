select count(*)
from app_store_apps;

select count(*)
from play_store_apps;

select *
from app_store_apps;

select *
from play_store_apps;

SELECT distinct name AS app_name, max(rating) AS rating, review_count, price, type
FROM play_store_apps
WHERE rating is not null
	AND review_count >=100000
	AND rating >= 4.5
	AND type = 'Free'
GROUP BY review_count, app_name, price, type
ORDER BY rating desc;

SELECT *
FROM app_store_apps;

ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE INTEGER  USING (review_count::integer);
ALTER TABLE app_store_apps ALTER COLUMN price TYPE INTEGER  USING (price::integer);

SELECT name, price, review_count, rating, primary_genre
FROM app_store_apps
WHERE review_count >=100000
	AND rating >= 4.0
	AND price <=1
	AND primary_genre = 'Games'
GROUP BY review_count, name, price, rating, primary_genre
ORDER BY rating desc;

