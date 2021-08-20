select company, sum(review_count) as total_reviews, avg(star_rating) as avg_rating
 from data_analyst_jobs 
 group by company
 having sum(review_count)>5000


--where title = '%Data Analyst%'

--AVERAGE(star_rating) BY STATE

--1.there are 1793 rows
--2.Exon MObil is the 10 company
--limit 10;
--where location = 'TN'
--3aTHERE ARE 21 JOBS IN tn
--where location = 'KY' OR  LOCATION ='TN'
--3b.There are 27 jobs in KY and TNs with 4 star_ratiing
--and 
--4.THere are 3 companies in TN  with ratings higher than 4
--where review_count between  500 and 1000
--5.there 151 business with reviews between 500 & 1000
--6. Nebraska shows the highest rating
--7. there are 1793 data analyst jobs
--SELECT count(title) FROM data_analyst_jobs
