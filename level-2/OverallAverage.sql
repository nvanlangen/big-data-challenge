select vine,avg(star_rating)
from vine_table
where vine is not null
and review_id in (select review_id from review_id_table where category = 'LawnGarden')
group by vine;


Results

"N"	4.0929219803344009
"Y"	4.1413705961052475

Average rating for vine/non-vine reviewers
