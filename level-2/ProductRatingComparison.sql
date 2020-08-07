select vine, avg(star_rating)
from vine_table
where review_id in (select review_id from review_id_table
where product_id in (
select product_id
from review_id_table
where review_id in (select review_id from vine_table
				   where vine='Y')
group by product_id)
and category = 'LawnGarden'
)
group by vine;


Results

"Y"	4.1413705961052475
"N"	3.8251631330840861

Shows the average rating for prodcuts that were part of vine and by customer that were not a part of vine.
