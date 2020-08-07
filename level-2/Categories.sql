select vine,category,count(*) 
from vine_table inner join review_id_table on vine_table.review_id = review_id_table.review_id
where vine is not null
group by vine,category;


Results

"N"	"GiftCard"	149086
"N"	"LawnGarden"	2543833
"Y"	"LawnGarden"	13454

Number of reviews by category and vine/non-vine reviewer