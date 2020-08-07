select vine, avg(star_rating)
from vine_table
where review_id in (select review_id from review_id_table
where customer_id in (
select customer_id
from review_id_table
where review_id in (select review_id from vine_table
				   where vine='Y')
group by customer_id)
and category = 'LawnGarden'
)
group by vine;


Results

"Y"	4.1413705961052475
"N"	4.2693276135409867

Shows the average rating that customers gave when participating as a vine reviewer and as non-vine reviewer.