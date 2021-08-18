select count(*)
from app_store_apps;

select count(*)
from play_store_apps;

select *
from app_store_apps;

select *
from play_store_apps;

select max(rating) AS rating, name AS app_name, review_count
FROM play_store_apps
where rating is not null
	AND review_count >1000
group by review_count, app_name
order by rating desc;