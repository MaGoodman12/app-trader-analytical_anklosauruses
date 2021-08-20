select name, rating, review_count, primary_genre
from app_store_apps
where primary_genre = 'Games'
order by rating desc