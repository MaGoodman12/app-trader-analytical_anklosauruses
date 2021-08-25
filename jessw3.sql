SELECT name, price, rating, review_count, genres, install_count
FROM play_store_apps
WHERE review_count > 10000
--where name = '%Panda%'
--and rating not 'null'
AND rating>=4.9

Order by review_count desc
limit 25