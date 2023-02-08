-- The dataset for this exercise has been derived from the `Indeed Data Scientist/Analyst/Engineer` [dataset](https://www.kaggle.com/elroyggj/indeed-dataset-data-scientistanalystengineer) on kaggle.com. 

-- Before beginning to answer questions, take some time to review the data dictionary and familiarize yourself with the data that is contained in each column.

-- #### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:

-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

--Answer: 1793 rows.

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Answer: XTO Land Data Analyst is the last one listed for row 10.

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT 
	COUNT(location)
	AS count_location
	FROM data_analyst_jobs
	WHERE location = 'TN' OR location = 'KY';

--Answer: a. There are 21 in TN. b. There are 6 in KY. There are 27 Total for the two locations.

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT 
	COUNT(star_rating)
	AS count_star_rating
	FROM data_analyst_jobs
	WHERE location = 'TN'
	AND star_rating > 4;
	
-- Answer: There is a count of 3 with a greater than 4 star rating.

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT
	COUNT(review_count)
	AS count_review_count
	FROM data_analyst_jobs
	WHERE review_count BETWEEN '500' AND '1000';
	
-- Answer: There are 151 postings where the review_count is between 500 and 1000.

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT 
	location
	AS state,
	AVG(star_rating)
	AS avg_rating
	FROM data_analyst_jobs
	GROUP BY state
	ORDER BY avg_rating DESC;
	
-- Answer: The state with the Highest Average star_rating is Nebraska "NE".

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT 
	COUNT(DISTINCT title)
	AS unique_job_titles
	FROM data_analyst_jobs;
	
-- Answer: There are 881 unique job titles listed.

-- 8.	How many unique job titles are there for California companies?

SELECT
	COUNT(DISTINCT title)
	AS unique_job_titles,
	location
	AS state
	FROM data_analyst_jobs
	GROUP BY state
	HAVING location = 'CA';
	
-- Answer: There are 230 Unique job title in the state of California.

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT
	company,
	AVG(star_rating)
	AS avg_stars,
	SUM(review_count)
	AS sum_reviews
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY company;
	

-- Answer: There are 71 companies having over 5000 reviews for all locations.

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT
	company,
	AVG(star_rating)
	AS avg_stars,
	SUM(review_count)
	AS sum_reviews
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY avg_stars DESC;

-- Answer: The company that has the highest average star rating with over 5000 reviews is Google.  It has an average star rating of 4.3000001910000000.

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
