/* GOALS: Find top 10 apps that are:
	in both stores
	lowest initial cost
	longest lifespan (per avg rating).
	recommend based on price, genre, rating or ect.
	*/
--select * from app_store_apps;
--select * from play_store_apps;
--alter table __ alter column __ TYPE INTEGER  USING (__::integer);


--APP_Genre_&_genre_count
/*SELECT
	distinct primary_genre,
	count(primary_genre) AS dist_genre
FROM (
	SELECT name,price,review_count,rating,primary_genre
	FROM app_store_apps
	GROUP BY name,price,review_count,rating,primary_genre
	ORDER BY rating desc, primary_genre asc) AS sub1
GROUP BY primary_genre
ORDER BY dist_genre desc;

--Relevant_app_columns
SELECT name,price,review_count,rating,primary_genre
FROM app_store_apps
GROUP BY name,price,review_count,rating,primary_genre
ORDER BY rating desc, primary_genre asc;

--Working_end_result
ALTER TABLE play_store_apps ALTER COLUMN price TYPE numeric USING (price::numeric);
ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE numeric USING (review_count::numeric);

WITH app AS
(
SELECT
	name AS app_name, 
	price, 
	round(avg(review_count),1) AS avg_a_rev, 
	rating,
	primary_genre
FROM app_store_apps
WHERE rating >= 4.5
GROUP BY
	app_name, 
	price, 
	review_count, 
	rating,
	primary_genre
ORDER BY avg_a_rev desc, rating desc
LIMIT 25
),

play AS
(
SELECT
	name,
	price,
	rating,
	round(avg(review_count),1) as avg_p_rev,
	genres
FROM play_store_apps
WHERE rating >= 4.5
group by
	name, 
	price, 
	rating,
	genres
ORDER BY
	avg_p_rev desc,
	rating desc
LIMIT 25
)*/

with app AS
(SELECT
	primary_genre as genres,
	name,
	rating,
	price,
	round(avg(review_count),1) as avg_a_rev
FROM app_store_apps
WHERE rating >= 4.5 AND review_count >=100000
group by
	genres,
	name,
	rating,
	price
ORDER BY
	avg_a_rev desc,
	rating desc
LIMIT 25
),

play AS
(SELECT
	genres,
	name,
	rating,
	replace(price, '0', '0.00') as price,
	round(avg(review_count),1) as avg_p_rev
FROM play_store_apps
WHERE
 rating >= 4.5
 AND review_count >=100000
group by
	genres,
	name,
	rating,
	price
ORDER BY
	avg_p_rev desc,
	rating desc
LIMIT 25
)

select *
from app
union all
select *
from play
order by name asc;
