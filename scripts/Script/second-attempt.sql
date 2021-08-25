select * from app_store_apps

select * from play_store_apps

select name, install_count, price
from play_store_apps
order by install_count desc
limit 10

--alter table app_store_apps alter column review_count type integer using (review_count::integer);

--altered column name to genres
--ALTER TABLE app_store_apps
--RENAME COLUMN primary_genre to genres;

select *
from play_Store_apps join app_store_apps
on play_store_apps.rating = app_store_apps.rating;

select name, rating, review_count, genres
from app_store_apps
where rating > 4
order by review_count desc; 

SELECT name, rating, review_count, genres
from play_store_apps
UNION ALL
Select name, rating, review_count, genres
from app_store_apps 
where rating > 4
order by review_count desc;

select name, review_count, rating, genres
from play_Store_apps
UNION ALL
Select name, review_count, rating, genres
from app_store_apps 
where review_count > 250
 	and rating >= 5.0
group by review_count, name, price, rating, genres
order by review_count desc; 

SELECT distinct name AS app_name, max(review_count) AS rating, price
FROM play_store_apps
union all
Select distinct name as app_name, max(review_count) as rating, price
from app_store_apps 
WHERE rating is not null
	AND review_count >=100000
	AND rating >= 4.5
	AND type not like 'Free'
group by review_count, name, price, rating	
ORDER BY rating desc;

select name, sum(install_count) as install_total, sum(review_count) as reviews, price
from play_store_apps
where price is not null
	and review_count >= 100000
group by review_count, name, price, install_total
order by install_total desc;



