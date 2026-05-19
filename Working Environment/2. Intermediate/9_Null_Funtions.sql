-- Find the average scores of the customer (Data validatoins with null values)

-- Step 1: View data
SELECT
    customerid,
    score
FROM sales.customers;

-- Step 2: Calculate average
SELECT
    customerid,
    score,
    ROUND(AVG(score) OVER ():: NUMERIC, 0) AS avg_scores
FROM sales.customers;

-- Step 3: Calculate averages with Null function (COALESCE)
SELECT
    customerid,
    score,
    ROUND(AVG(score) OVER ():: NUMERIC, 0) AS avg_scores,
    ROUND(AVG(COALESCE(score, 0)) OVER ():: NUMERIC, 0) AS avg_scores2
FROM sales.customers;

-- Alt/ Step 3: Calculate averages with Null function (COALESCE) but COALESCE NUlls
SELECT
    customerid,
    score,
    COALESCE(score, 0) AS score2,
    ROUND(AVG(score) OVER ():: NUMERIC, 0) AS avg_scores,
    ROUND(AVG(COALESCE(score, 0)) OVER ():: NUMERIC, 0) AS avg_scores2
FROM sales.customers;

-- SQL Task: Full name in single field, merge first Last name + add 10 points to each customers points

-- Step1. View table
SELECT *
FROM sales.customers;

-- Step 2. Select relevant fields
SELECT
    customerid,
    firstname,
    lastname,
    score
FROM sales.customers

-- Step 3 Merge Name (Coalesce)
SELECT
    customerid,
    firstname,
    lastname,
    firstname || ' ' || COALESCE(lastname, ' ') AS fullname,
    score
FROM sales.customers;

-- Step 4 Add 10 points to each score
SELECT
    customerid,
    firstname,
    lastname,
    firstname || ' ' || COALESCE(lastname, ' ') AS fullname,
    score,
    score + 10 AS bonus_score
FROM sales.customers;

-- Step 4 Add 10 points to each score
SELECT
    customerid,
    firstname,
    lastname,
    firstname || ' ' || COALESCE(lastname, ' ') AS fullname,
    score,
    COALESCE(score, 0) + 10 AS bonus_score
FROM sales.customers;

-- Data Aggregation

SELECT *
FROM sales.customers;

SELECT *
FROM sales.orders;

SELECT
    c.customerid, 
    c.firstname, 
    c.country, 
    c.score
FROM sales.customers c
JOIN sales.orders o
ON 
    c.customerid = o.customerid;
    
-- FROM > WHAT > HOW

-- Step 1: Join without handling NULLS
SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    c.score,
    o.shipaddress
FROM sales.customers c
LEFT JOIN Sales.orders o 
ON c.customerid = o.customerid
AND COALESCE(c.lastname, '') = COALESCE(o.shipaddress, '');

-- All customers with their orders, keeping all customers even with NULLs
SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    c.score,
    o.shipaddress
FROM sales.customers c
LEFT JOIN sales.orders o
ON c.customerid = o.customerid;

-- Data Manipulation

-- Task - Sort customers from lowest ot highest scores with nulls appearing last

-- Step 1 - View table
SELECT *
FROM sales.customers;

-- Step 2 - order by min to max
SELECT 
    customerid,
    firstname,
    lastname,
    country,
    score
FROM sales.customers
ORDER BY score ASC;

-- Step 3 - Handle the Null
SELECT
    customerid,
    score
FROM sales.customers
ORDER BY score DESC NULLS LAST;