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

-- Practice questions

-- Show tables
SELECT *
FROM sales.customers;

-- Average scores by country
SELECT
    country,
    ROUND(AVG(COALESCE(score, 0)) :: NUMERIC, 0) AS avg_score
FROM sales.customers
GROUP BY country
ORDER BY avg_score DESC;

-- 1. Total sales per customers (First name & total sales Desc order) Where what how

-- Show sales table
SELECT *
FROM sales.customers;

-- Show orders table
SELECT *
FROM sales.orders;

-- Common row customer id
SELECT
    c.firstname,
    c.customerid,
    SUM(COALESCE(o.sales, 0)) AS total_sales
FROM sales.customers c
LEFT JOIN sales.orders o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname
ORDER BY total_sales DESC;

-- 2. Average Salary by department from Employees table

-- Step 1: View tabl
SELECT *
FROM sales.employees;

-- Step 2: salaries by department
SELECT
    department,
    salary
FROM sales.employees;

-- Step 3: AVG salaries by department
SELECT
    department,
    ROUND(AVG(COALESCE(salary, 0)):: DECIMAL, 0) AS avg_salary
FROM sales.employees
GROUP BY department
ORDER BY avg_salary DESC;

-- Sort customer from lowest to highest scores

-- Step 1: Show tables
SELECT *
FROM sales.customers;

-- Sort by score from highest to lowest
SELECT
    customerid,
    COALESCE(score, 0)
FROM sales.customers
ORDER BY COALESCE(score, 0) ASC;


-- Sort customers by Score with NUlls Appearing last

-- Step 1: View table
SELECT *
FROM sales.customers;

-- Step 2: Sort by score from lowest to highest
SELECT
    customerid,
    COALESCE(score,0)
FROM sales.customers
ORDER BY COALESCE(score,0) DESC;

-- Step 3: Sort by Score from highest ot lowest
SELECT
    customerid,
    COALESCE(score, 0)
FROM sales.customers
ORDER BY COALESCE(score, 0) DESC;

-- Aggregate Data 

-- 1. What is the average score by country

-- Step 1: View Tables
SELECT *
FROM sales.customers;

-- Step 2: Calculate Average score
SELECT 
    country,
    ROUND(AVG(COALESCE(score, 0)):: DECIMAL, 0) AS avg_score
FROM sales.customers
GROUP BY country
ORDER BY avg_score DESC;

-- 2. Total sales per customer. No orders should show zero

-- Step 1 View Tables
SELECT *
FROM sales.orders;

-- Step 2 Sales per customer
SELECT
    customerid,
    ROUND(SUM(COALESCE(sales, 0)) :: DEC, 0) AS total_sales
FROM sales.orders
GROUP BY customerid
ORDER BY total_sales DESC;


-- 3. Average sale per product category, NULLs should show zero, Category and averages sales 

-- Step 1: View able
SELECT *
FROM sales.orders;

-- Step 2: AVG sale by productID
SELECT
    productid,
    ROUND(AVG(COALESCE(sales, 0)):: DEC, 2) AS avg_sales
FROM sales.orders
GROUP BY productid
ORDER BY avg_sales DESC;

-- 1. Average score by country

-- Step 1: Show tables
SELECT  *
FROM sales.customers;

-- Step 2: Average score per country
SELECT
    country,
    ROUND(AVG(score) ::DEC, 2) AS avg_score
FROM sales.customers
GROUP BY country
ORDER BY avg_score DESC;

-- 2. Total Sales per customer, Nulls as 0 (firstname, customerid, sales)

-- Step 1: View Tables

-- Sales.customers
SELECT *
FROM sales.customers;

-- View sales.orders table
SELECT *
FROM sales.orders;

-- Step 2 

-- Phase 1 Join tables
SELECT
    c.customerid,
    c.firstname,
    o.sales
FROM sales.customers c
LEFT JOIN sales.orders o
ON c.customerid = o.customerid;

-- Phase 2 Data aggregation (total sales by customer ID)
SELECT
    c.customerid,
    c.firstname,
    SUM(COALESCE(o.sales, 0)) AS total_sales
FROM sales.customers c
LEFT JOIN sales.orders o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname
ORDER BY total_sales DESC;

-- 3. Average Sales per product Category (sales, Category, avg_sales)

-- Step 1 see tables (category) (Productid Common Key)

-- Products table
SELECT *
FROM sales.products;

-- Orders table
SELECT * 
FROM sales.orders;

-- Step 2 Join Data
SELECT
    p.category,
    p.productid,
    o.sales
FROM sales.products p
LEFT JOIN sales.orders o
ON p.productid = o.productid;

-- Step 3 Data Aggregation avg_sales
SELECT
    p.category,
    ROUND(AVG(COALESCE(o.sales, 0)) :: DEC, 2) AS avg_sales
FROM sales.products p
LEFT JOIN sales.orders o
ON p.productid = o.productid
GROUP BY p.category
ORDER BY avg_sales DESC;


-- NULLIF

-- Practice question Sale price by order

-- Step 1: View tables
SELECT *
FROM sales.orders;

-- Data Aggregation
-- Step 1: View separated table
SELECT
    orderid,
    quantity,
    sales
FROM sales.orders;

-- Step 2: Calculate price
SELECT
    orderid,
    sales,
    quantity,
    sales / NULLIF(quantity, 0) AS price
FROM sales.orders
ORDER BY price DESC NULLS LAST;

-- IS NULL 
SELECT 
    orderid,
    shipaddress
FROM sales.orders
WHERE shipaddress IS NULL;

-- NULL Use case: Filtering data
-- Pratice questions

-- 1. Identify the customers who have no scores

SELECT *
FROM sales.customers
WHERE score IS NULL;

-- 2. Identify the customers who have scores
SELECT *
FROM sales.customers
WHERE score IS NOT NULL;

-- IS NULL Use Case ANTI JOINS P

-- Practice questions

-- 1. List all the details fro customer who have not placed any order

-- Step 1 view tables
SELECT *
FROM sales.customers; # customerid, firstnames, lastname

SELECT *
FROM sales.orders; # customerid, quantity, sales

SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    o.quantity,
    o.sales
FROM sales.customers c
LEFT JOIN sales.orders o
ON c.customerid = o.customerid
WHERE o.sales IS NULL;

SELECT
    c.*,
    o.orderid
FROM sales.customers c
LEFT JOIN sales.orders o
ON c.customerid = o.customerid
WHERE o.customerid IS NULL;