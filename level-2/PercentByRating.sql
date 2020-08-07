drop table t1;
drop table t2;

select vine,star_rating,count(*) as vine_star_count  into temp table t1
from vine_table
where vine is not NULL
and review_id in (select review_id from review_id_table where category = 'LawnGarden')
group by star_rating,vine;

select vine,count(*) as vine_count into temp table t2
from vine_table
where vine is not NULL
and review_id in (select review_id from review_id_table where category = 'LawnGarden')
group by vine;

select t1.vine, t1.star_rating,vine_star_count,vine_count,vine_star_count*1.0/vine_count*100.0 as pct_reviews
from t1 inner join t2 on t1.vine=t2.vine
order by t1.vine, star_rating;


Results

"N"	1	280707	2543833	11.034804564607818202000
"N"	2	134315	2543833	5.280024278323301883000
"N"	3	192758	2543833	7.577462828731288571000
"N"	4	396166	2543833	15.573585215696156155000
"N"	5	1539887	2543833	60.534123112641435189000
"Y"	1	343	13454	2.549427679500520291000
"Y"	2	620	13454	4.608294930875576037000
"Y"	3	1835	13454	13.639066448639809722000
"Y"	4	4650	13454	34.562211981566820276000
"Y"	5	6006	13454	44.640998959417273673000

Shows the total number of reviews by rating and reviewer type.  Calculates a percentage for each rating and reviewer type.
