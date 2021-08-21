ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE INTEGER  USING (review_count::integer);


SELECT name, price, review_count, rating, primary_genre
FROM app_store_apps
WHERE review_count > 100000
	AND rating >= 4.0
	AND price >0
	AND primary_genre = 'Games'
GROUP BY review_count, name, price, rating, primary_genre
ORDER BY rating desc;
