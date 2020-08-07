# Big Data Challenge


### Level 1

Loaded the following data sets

	https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Gift_Card_v1_00.tsv.gz

	https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Lawn_and_Garden_v1_00.tsv.gz

Attemtped to use s3a connector but could not get it working.  Uploaded the files to google drive and mounted a drive in colab to read the files.

Created a postgres database on AWS and loaded the data sets into the database.

Updated the provided schema as some customer ids were included in both datasets and caused a primary key violation.  Added a category column to the cutomers and review_id_table to help differentiate which dataset was the source of the review.

### Level 2

Executed queries to review the data and determine if the Vine reviews were biased.

The first query was to determine the categories that were included in the Vine program.  Gift Cards were not included in the Vine program and were excluded from the research.

The second query compared the average review provided by a Vine customer vs. the average review from all other customers.  The average review for a Vine customer was 4.1413 compared to 4.0929 for other customers.

The third query was to compare the percentage of review scores for each value by customer type.  This identified the breakdown of scores from 1 to 5 for the Vine customers and for all other customers.  These results showed that Vine customers did not typically give low reviews as only 7% of the reviewers gave a 1 or 2.  For non-Vine customers 11% gave a score of 1.  Over 60% of non-Vine customers gave the highest rating of 5 compared to just over 45% of Vine customers.

The fourth query provided data for all of the reviews that Vine customers submitted, not just the reviews when they were participating in the Vine program.  The average review when these customers were not participating in the program was 4.2693 compared to 4.1413 while they were in the program.

The final query provided data for any product that was part of the Vine program.  The reviews of both the Vine customer and non-Vine customers for these products were compared.  Again, the Vine customer average rating was 4.1413 and the non-Vine customer average rating for these products was 3.8252.

### Conclusions

These queries provided a lot interesting information but made it difficult to determine if there was bias in the reviews.

Results that indicate a possible bias include:

	Average Vine review was higher than non-Vine reviews

	Percentage of low reviews (1/2) was less for the Vine reviewers

	Products reviewed by Vine participants received higher ratings by the Vine participants than when reviewed by other customers

Results that do not indicate a bias include:

	Non-Vine customers gave more top reviews of 5 than the Vine customers

	Vine reviewers gave higher reviews when reviewing products outside of the Vine program  


There is not enough evidence to not trust the reviews but the lack of low ratings may indicate a reluctance of the Vine participants to give low ratings.  The finding of Vine participants providing higher ratings for the same products as non-Vine customers is also an indicator of bias.