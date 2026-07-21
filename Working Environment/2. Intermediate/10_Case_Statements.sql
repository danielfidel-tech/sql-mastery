-- Generate a report showing the total sales for each category
-- High is over 50, Medium is between 20 and 50, Low if the sales is less than or equal to 20
-- Sort from Highest to Lowest

SELECT
category,
SUM(sales) AS total_sales
FROM(
    SELECT
    orderid,
    sales,
    CASE
        WHEN sales > 50 THEN 'High'
        WHEN sales > 20 THEN 'Medium'
        ELSE 'Low'
    END category
    FROM sales.orders
)t
GROUP BY category 
ORDER BY total_sales DESC
;

-- SQL Task 2: Retrieve employee details with gender as full text
SELECT 
    employeeid,
    firstname,
    lastname,
    department,
    birthdate,
    salary,
    managerid,
    gender,
    CASE gender
        WHEN 'M' THEN 'Male'
        WHEN 'F' THEN 'Female'
        ELSE 'Not Available'
    END AS gender_full_Text
FROM sales.employees;

-- SQL Task 3: Customer Details with abbreviated countries
SELECT 
    customerid,
    firstname,
    lastname,
    country,
    score,
    CASE country
        WHEN 'Germany' THEN 'GER'
        WHEN 'USA' THEN 'US'
        ELSE 'N/A'
    END AS country_short
FROM sales.customers;

SELECT DISTINCT country
FROM sales.customers;

-- SQL Task 4: Find average scores of customers treat Nulls as 0 show customerid & lastname
SELECT 
    customerid,
    lastname,
    score,
    CASE
        WHEN score IS NULL THEN 0
        ELSE  score
    END score_clean,

AVG(CASE
        WHEN score IS NULL THEN 0
        ELSE  score
    END) OVER()  avgcustomer_clean,

AVG(score) OVER() avgcustomer
FROM sales.customers;

-- SQL Task 5: Count how many times each customer has made an order with sales greater than 30
-- Step 1: View Tables
SELECT *
FROM sales.orders;

-- Step 2: Aggregate and case Statements
SELECT
    customerid,
    COUNT(CASE WHEN sales >30 THEN quantity END) AS high_sales,
    COUNT(CASE WHEN sales <30 THEN quantity END) AS low_sales
FROM sales.orders
GROUP BY customerid
ORDER BY customerid ASC;