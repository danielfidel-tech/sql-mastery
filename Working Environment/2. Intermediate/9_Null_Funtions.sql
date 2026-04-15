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