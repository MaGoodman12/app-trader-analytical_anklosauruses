select * 
from app_store_apps;

select distinct name, primary_genre, rating, review_count
from app_store_apps
order by review_count desc;

ALTER TABLE app_store_apps
RENAME COLUMN primary_genre to genres;

-- important columns: name, rating, review_count, content_rating, genres 
-- columns cannot be repeated or you will receive ambiguous error
-- 

SELECT review_count, rating, content_rating, genres
from app_store_apps as app_table
inner join play_store_apps as play_table
on app_table.genres = play_table.genres; 


	
