-- COALESCE
/* 1. Our favourite manager wants a detailed long list of products, but is afraid of tables! 
We tell them, no problem! We can produce a list with all of the appropriate details. 

Using the following syntax you create our super cool and not at all needy manager a list:

SELECT 
product_name || ', ' || product_size|| ' (' || product_qty_type || ')'
FROM product

But wait! The product table has some bad data (a few NULL values). 
Find the NULLs and then using COALESCE, replace the NULL with a 
blank for the first problem, and 'unit' for the second problem. 

HINT: keep the syntax the same, but edited the correct components with the string. 
The `||` values concatenate the columns into strings. 
Edit the appropriate columns -- you're making two edits -- and the NULL rows will be fixed. 
All the other rows will remain the same.) */


SELECT 
product_name || ', ' || coalesce(product_size," ")|| ' (' || coalesce(product_qty_type, "unit") || ')'
FROM product;




--Windowed Functions
/* 1. Write a query that selects from the customer_purchases table and numbers each customer’s  
visits to the farmer’s market (labeling each market date with a different number). 
Each customer’s first visit is labeled 1, second visit is labeled 2, etc. 

You can either display all rows in the customer_purchases table, with the counter changing on
each new market date for each customer, or select only the unique market dates per customer 
(without purchase details) and number those visits. 
HINT: One of these approaches uses ROW_NUMBER() and one uses DENSE_RANK(). */
SELECT 
customer_id, market_date, product_id,
dense_rank() OVER  (PARTITION BY customer_id ORDER BY  market_date) AS dense_visits
FROM customer_purchases;

/* 2. Reverse the numbering of the query from a part so each customer’s most recent visit is labeled 1, 
then write another query that uses this one as a subquery (or temp table) and filters the results to 
only the customer’s most recent visit. */

DROP TABLE IF EXISTS most_recent_visit;

CREATE TEMP TABLE most_recent_visit AS

SELECT 
customer_id, market_date, product_id,
dense_rank() OVER  (PARTITION BY customer_id ORDER BY  market_date desc) AS dense_visits
FROM customer_purchases ;

SELECT  DISTINCT customer_id, market_date

FROM most_recent_visit

WHERE dense_visits ==1;

/* 3. Using a COUNT() window function, include a value along with each row of the 
customer_purchases table that indicates how many different times that customer has purchased that product_id. */

<<<<<<< HEAD
SELECT customer_id, product_id,
COUNT( product_id) -- number of times the product_id was purchased

FROM customer_purchases
GROUP BY customer_id, product_id;

=======



-- String manipulations
>>>>>>> d18596d9dfb0a96dc49a6710a3b0b37340768ad5
/* 1. Some product names in the product table have descriptions like "Jar" or "Organic". 
These are separated from the product name with a hyphen. 
Create a column using SUBSTR (and a couple of other commands) that captures these, but is otherwise NULL. 
Remove any trailing or leading whitespaces. Don't just use a case statement for each product! 

| product_name               | description |
|----------------------------|-------------|
| Habanero Peppers - Organic | Organic     |

Hint: you might need to use INSTR(product_name,'-') to find the hyphens. INSTR will help split the column. */

<<<<<<< HEAD
SELECT DISTINCT

product_name,  
CASE WHEN INSTR(product_name,'-')+1 > 1 THEN rtrim(ltrim(substr(product_name, INSTR(product_name,'-')+1)))
ELSE NULL END as description
FROM product;

/* 2. Filter the query to show any product_size value that contain a number with REGEXP. */

SELECT DISTINCT product_size,  
CASE WHEN INSTR(product_name,'-')+1 > 1 THEN rtrim(ltrim(substr(product_name, INSTR(product_name,'-')+1)))
ELSE NULL END as description
FROM product

WHERE product_size REGEXP '[[:digit:]]' ;

=======


/* 2. Filter the query to show any product_size value that contain a number with REGEXP. */



-- UNION
>>>>>>> d18596d9dfb0a96dc49a6710a3b0b37340768ad5
/* 1. Using a UNION, write a query that displays the market dates with the highest and lowest total sales.

HINT: There are a possibly a few ways to do this query, but if you're struggling, try the following: 
1) Create a CTE/Temp Table to find sales values grouped dates; 
2) Create another CTE/Temp table with a rank windowed function on the previous query to create 
"best day" and "worst day"; 
3) Query the second temp table twice, once for the best day, once for the worst day, 
with a UNION binding them. */
<<<<<<< HEAD
 
 

DROP TABLE IF EXISTS sales_by_date;

CREATE TEMP TABLE sales_by_date AS

SELECT 
market_date,
SUM(quantity * cost_to_customer_per_qty) AS total_sales

FROM customer_purchases 
GROUP BY market_date;


DROP TABLE IF EXISTS sales_stats;

CREATE TEMP TABLE sales_stats AS

SELECT 

market_date, total_sales,
rank() OVER  (ORDER BY  total_sales desc) AS sales_rank 


FROM sales_by_date;

SELECT *

FROM sales_stats

WHERE sales_rank == 1

UNION
 
SELECT *

FROM sales_stats

WHERE sales_rank == 142;
=======


>>>>>>> d18596d9dfb0a96dc49a6710a3b0b37340768ad5


