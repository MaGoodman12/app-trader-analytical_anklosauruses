/* GOALS: Find top 10 apps that are:
	in both stores
	lowest initial cost
	longest lifespan (per avg rating).
	recommend based on price, genre, rating or ect.
	*/
--select * from app_store_apps;
--select * from play_store_apps;
--alter table __ alter column __ TYPE __  USING (__::__);

--Top_10 Genre by rating and count of review
--APP
SELECT
	distinct primary_genre as APP_dist_genre,
	count(primary_genre) AS genre_count
FROM
(	
	SELECT name,price,review_count,rating,primary_genre
	FROM app_store_apps
	WHERE rating >= 4.5
	and review_count >= 100000
	GROUP BY name,price,review_count,rating,primary_genre
	ORDER BY rating desc, primary_genre asc
	limit 10
	
) AS sub1
GROUP BY APP_dist_genre
ORDER BY genre_count desc;

--PLAY
SELECT
	distinct lower(replace(category,'FAMILY', 'KIDS_GAME')) as play_category,
	count(category) AS cat_count
FROM
(
	SELECT name,price,review_count,rating,category
	FROM play_store_apps
	WHERE rating >= 4.5
	and review_count >= 100000
	GROUP BY name,price,review_count,rating,category
	ORDER BY rating desc, category asc
	limit 10
) AS sub_2
GROUP BY play_category
ORDER BY cat_count desc;


--Top_25 Genre by rating and count of review
--APP
SELECT
	distinct primary_genre as APP_dist_genre,
	count(primary_genre) AS genre_count
FROM
(	
	SELECT name,price,review_count,rating,primary_genre
	FROM app_store_apps
	WHERE rating >= 4.5
	and review_count >= 100000
	GROUP BY name,price,review_count,rating,primary_genre
	ORDER BY rating desc, primary_genre asc
	limit 25
	
) AS sub1
GROUP BY APP_dist_genre
ORDER BY genre_count desc;

--PLAY
SELECT
	distinct lower(replace(category,'FAMILY', 'KIDS_GAME')) as play_category,
	count(category) AS cat_count
FROM
(
	SELECT name,price,review_count,rating,category
	FROM play_store_apps
	WHERE rating >= 4.5
	and review_count >= 100000
	GROUP BY name,price,review_count,rating,category
	ORDER BY rating desc, category asc
	limit 25
) AS sub_2
GROUP BY play_category
ORDER BY cat_count desc;

--Top Genre by rating and count of review
--APP
SELECT
	distinct primary_genre as APP_dist_genre,
	count(primary_genre) AS genre_count
FROM
(	
	SELECT name,price,review_count,rating,primary_genre
	FROM app_store_apps
	WHERE rating >= 4.5
	and review_count >= 100000
	GROUP BY name,price,review_count,rating,primary_genre
	ORDER BY rating desc, primary_genre asc	
) AS sub1
GROUP BY APP_dist_genre
ORDER BY genre_count desc;

--PLAY
SELECT
	distinct lower(replace(category,'FAMILY', 'KIDS_GAME')) as play_category,
	count(category) AS cat_count
FROM
(
	SELECT name,price,review_count,rating,category
	FROM play_store_apps
	WHERE rating >= 4.5
	and review_count >= 100000
	GROUP BY name,price,review_count,rating,category
	ORDER BY rating desc, category asc
) AS sub_2
GROUP BY play_category
ORDER BY cat_count desc;



--Top_10 apps to recommend
--
ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE numeric USING (review_count::numeric);

with app AS
(SELECT
 	distinct name as dist_name,
	primary_genre as genres,
	rating,
	cast(price as text) as price,
	round(avg(review_count),1) as avg_a_rev
FROM app_store_apps
WHERE rating >= 4.5 AND review_count >=100000
group by
	genres,
	dist_name,
	rating,
	price
ORDER BY
	avg_a_rev desc,
	rating desc
),

play AS
(SELECT
 	distinct name as dist_name,
	genres,
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
)

select app.genres,
	app.dist_name,
	app.rating, 
	app.price, 
	round(sum(avg_a_rev + avg_p_rev),1) AS reviews
from app
JOIN play
on app.dist_name = play.dist_name and app.price = play.price 
group by app.genres, app.dist_name, app.rating, app.price
order by reviews desc
limit 10;

--Top_25 apps to recommend
--
ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE numeric USING (review_count::numeric);

with app AS
(SELECT
 	distinct name as dist_name,
	primary_genre as genres,
	rating,
	cast(price as text) as price,
	round(avg(review_count),1) as avg_a_rev
FROM app_store_apps
WHERE rating >= 4.5 AND review_count >=100000
group by
	genres,
	dist_name,
	rating,
	price
ORDER BY
	avg_a_rev desc,
	rating desc
),

play AS
(SELECT
 	distinct name as dist_name,
	genres,
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
)

select app.genres,
	app.dist_name,
	app.rating, 
	app.price, 
	round(sum(avg_a_rev + avg_p_rev),1) AS reviews
from app
JOIN play
on app.dist_name = play.dist_name and app.price = play.price 
group by app.genres, app.dist_name, app.rating, app.price
order by reviews desc
limit 25;

--Total_best_by_criteria apps to recommend
--
ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE numeric USING (review_count::numeric);

with app AS
(SELECT
 	distinct name as dist_name,
	primary_genre as genres,
	rating,
	cast(price as text) as price,
	round(avg(review_count),1) as avg_a_rev
FROM app_store_apps
WHERE rating >= 4.5 AND review_count >=100000
group by
	genres,
	dist_name,
	rating,
	price
ORDER BY
	avg_a_rev desc,
	rating desc
),

play AS
(SELECT
 	distinct name as dist_name,
	genres,
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
)

select app.genres,
	app.dist_name,
	app.rating, 
	app.price, 
	round(sum(avg_a_rev + avg_p_rev),1) AS reviews
from app
JOIN play
on app.dist_name = play.dist_name and app.price = play.price 
group by app.genres, app.dist_name, app.rating, app.price
order by reviews desc;

--testing
--
ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE numeric USING (review_count::numeric);

with app AS
(SELECT
 	distinct name as name,
	primary_genre as genres,
	rating,
	cast(price as text) as price,
	round(avg(review_count),1) as avg_rev
FROM app_store_apps
WHERE rating >= 4.5 AND review_count >=100000
group by
	genres,
	name,
	rating,
	price
ORDER BY
	avg_rev desc,
	rating desc
),

play AS
(SELECT
 	distinct name as name,
	genres,
	rating,
	replace(price, '0', '0.00') as price,
	round(avg(review_count),1) as avg_rev
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
	avg_rev desc,
	rating desc
)

select app.name, app.genres,
	round(sum(app.rating + play.rating),1) AS total_rating,
	round(sum(app.avg_rev + play.avg_rev),1) AS total_reviews,
	app.price
from app
JOIN play
using(name, price)
/*WHERE app.genres ilike '%%'*/
group by app.genres, app.name, app.rating, app.price
order by total_rating desc, total_reviews desc;
