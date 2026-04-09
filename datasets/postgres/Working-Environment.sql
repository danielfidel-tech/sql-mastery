SET search_path TO public;

-- Show all tables
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;

-- What is in each schema
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema IN ('public','sales')
ORDER BY table_schema, table_name;

-- 1) Which database am I in?
SELECT current_database();

-- 2) What schemas is this tab searching (in order)?
SHOW search_path;

-- 3) Do these exact tables exist in this database?
SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname = 'public' AND tablename IN ('customers','orders');

-- A. What tables are in *this* database's public schema?
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- B. What tables are in sales (side-by-side check)?
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'sales'
ORDER BY table_name;

SET search_path TO public;
SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM public.customers;
SELECT * FROM public.orders;

-- Show name, country and scode
SELECT 
	first_name, 
	country, 
	score
FROM customers;

-- Customers with scores above 500
SELECT *
FROM customers
WHERE score>500
ORDER BY score DESC;

-- Customer with scores other than 0
SELECT *
FROM customers
WHERE score != 0

-- Customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Sales.customers tables
SELECT *
FROM Sales.Customers;


-- Union Example
SELECT
	firstname,
	lastname
FROM sales.customers

UNION

SELECT
	firstname,
	lastname
FROM sales.customers;

-- Union Example
SELECT
	column_name1.
	column_name2
FROM tablename;

UNION

SELECT
	column_name1.
	column_name2
FROM tablename;

-- Rule 5 column aliases
SELECT
	customerid AS id,
	lastname
FROM sales.customers

UNION

SELECT
	employeeid,
	lastname
FROM sales.employees;

-- Rule 6 getting an incorrect result
SELECT
	firstname,
	lastname
FROM sales.customers

UNION

SELECT 
	firstname,
	lastname
FROM sales.employees

ORDER BY firstname ASC;

-- Rule 6 getting an incorrect result swapped
SELECT
	firstname,
	lastname
FROM sales.customers

UNION

SELECT 
	lastname,
	firstname
FROM sales.employees;

-- Combine data from employees & Customers into 1 table
SELECT 
	firstname,
	lastname
FROM sales.customers
UNION
SELECT 
	firstname,
	lastname
FROM sales.employees
ORDER BY firstname;

-- Combine data from employees & Customers into 1 table
SELECT 
	firstname,
	lastname
FROM sales.customers
UNION ALL
SELECT 
	firstname,
	lastname
FROM sales.employees
ORDER BY firstname;

-- Find the employees who are not customers
SELECT
	firstname,
	lastname
FROM sales.employees

EXCEPT

SELECT 
	firstname,
	lastname
FROM sales.customers
ORDER BY firstname;

-- Find employees who are also customers (INTERSECT Set Operator)
SELECT
	firstname,
	lastname
FROM sales.employees

INTERSECT

SELECT 
	firstname,
	lastname
FROM sales.customers
ORDER BY firstname;

-- Show both tables
SELECT *
FROM sales.orders;

SELECT *
FROM sales.ordersarchive;


-- Select all the relevant columns 
SELECT 
    orderid,
    productid,
    customerid,
    salespersonid,
    orderdate,
    shipdate,
    orderstatus,
    shipaddress,
    billaddress,
    quantity,
    sales,
    creationtime
FROM sales.orders;

SELECT
    orderid,
    productid,
    customerid,
    salespersonid,
    orderdate,
    shipdate,
    orderstatus,
    shipaddress,
    billaddress,
    quantity,
    sales,
    creationtime
FROM	sales.ordersarchive;

	
-- Combine all orders into 1 report without duplicates (Remove dupes)
SELECT 
    orderid,
    productid,
    customerid,
    salespersonid,
    orderdate,
    shipdate,
    orderstatus,
    shipaddress,
    billaddress,
    quantity,
    sales,
    creationtime
FROM sales.orders
UNION
SELECT
    orderid,
    productid,
    customerid,
    salespersonid,
    orderdate,
    shipdate,
    orderstatus,
    shipaddress,
    billaddress,
    quantity,
    sales,
    creationtime
FROM	sales.ordersarchive
ORDER BY orderid;

-- CONCAT Function

-- List of Customers first names and country
SELECT
  first_name,
  country,
concat(first_name, '-', country) AS name_country
FROM customers;

-- Clean firt_name column
-- Step 1: Identify what's dirty
SELECT id, first_name, country
FROM customers
WHERE first_name <> BTRIM(first_name)
   OR country <> BTRIM(country);

-- Step 2: Fix the exsisting data
UPDATE customers
SET
  first_name = BTRIM(first_name),
  country    = BTRIM(country)
WHERE first_name <> BTRIM(first_name)
   OR country <> BTRIM(country);

-- Step 3: Confirm that the fix worked
SELECT 
  id, first_name, country
FROM customers
WHERE first_name <> BTRIM(first_name)
   OR country <> BTRIM(country);
   
-- UPPER & LOWER Function
-- Transform customer first name to lowercase
SELECT
  first_name,
  country,
  CONCAT(first_name, '-', country) AS name_country,
  LOWER(first_name) AS low_name,
  UPPER(first_name) AS up_name
FROM customers;

-- Customers whose name contains leading or trailing spaces
SELECT
  first_name
FROM customers
WHERE first_name != TRIM(first_name);

-- Replace Function
-- Remove dashes (-) From a phone number
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-','/') AS clean_phone;

SELECT
'report.txt',
REPLACE('report.txt','.txt','.csv') AS new_filename;

-- STRING FUNCTIONS Data Manipulation Questions (CONCAT, UPPER, LOWER, TRIM, REPLACE)
-- Section 1: Direct Application (Warm-up)
-- Step 1: View table
SELECT *
FROM customers;

-- Step 2: Create 'full_identity' Column
SELECT
  id,
  first_name,
  country,
  score,
FROM customers;

SELECT
  id,
  first_name,
  country,
  score,
  CONCAT(id, '_', first_name, '-', country, '/', score) AS full_identity
FROM customers;

-- Create column 'employee_label'
-- Step 1: See table
SELECT*
FROM sales.employees;

-- Step 2: Create 'employee_label' Column
SELECT
  employees.employeeid,
  employees.lastname,
  CONCAT(employeeid, '_', lastname) AS employee_label
FROM sales.employees;

-- UPPER LOWER
-- Covert country to Upper case

-- Step 1: View table
SELECT *
FROM customers;

-- Step 2: Conver country to upper
SELECT
  first_name,
  country,
  UPPER(country) AS upper_country
FROM customers;

-- Covert lastname to lower 
-- Step 1: View table
SELECT *
FROM sales.employees;

-- Stpe 2: Convert lastname to lower
SELECT
  lastname,
  LOWER(lastname) AS lower_lastname
FROM sales.employees;

-- TRIM
-- Clean first name from customers

--Step 1: View table
SELECT *
FROM customers;

-- Step 2: Trim first_name
SELECT
  first_name,
  TRIM(first_name) AS clean_first_name
FROM customers;

-- Find values that need trimming
SELECT
  first_name
FROM customers
WHERE first_name <> TRIM(first_name);

-- REPLACE
-- Replace blanks with underscores (_)

-- Step 1: View table
SELECT *
FROM customers;

-- Step 2: Replace blanks with underscores
SELECT
  country,
  REPLACE(country, ' ', '_') AS country_cleaned
FROM customers;

-- remove hyphens using REPLACE
-- Step 1: View employees table
SELECT *
FROM sales.employees;

-- Replace hyphenated last names with blanks
SELECT
  lastname,
  REPLACE(lastname, '-', '') AS unhyphenated_lastname
FROM sales.employees;

-- MIXED FUNCTIONS AKA Nested Functions

-- Normalize names
-- Step 1: view tables
SELECT*
FROM customers;

-- Step 2: create clean name
SELECT 
  first_name,
  TRIM(LOWER(first_name)) AS trim_lower_first_name
FROM customers;

-- Create customer_key column
-- Step 1: View customer table
SELECT *
FROM customers;

-- Step 2: View frist_name & country 
SELECT
  first_name,
  country
FROM customers;

-- Step 3: View lower first name and upper country
SELECT
  first_name,
  country,
  TRIM(LOWER(first_name)) AS lower_first_name,
  UPPER(country) AS upper_country
FROM customers;

-- Step 4: Nested customer key
SELECT
  first_name,
  country,
  CONCAT((TRIM(LOWER(first_name))), '_', UPPER(country)) AS customer_key
FROM customers;


-- CALCULATION FUNCTIONS

-- LENGTH

-- Length of each customers first name
-- Step 1: View table
SELECT *
FROM customers;

-- Step 2: length of each customer's first name
SELECT
  first_name,
  LENGTH(first_name)
FROM customers;

-- STRING EXTRACTION

-- LEFT

-- First 2 characters of each customer's first name
-- Step 1: View table
SELECT *
FROM  customers;

-- Step 2: first 2 letters extraction
SELECT
  first_name,
  LEFT(first_name, 2) AS  first_2_char
FROM customers;

-- RIGHT
-- Step 1: View table
SELECT *
FROM  customers;

-- Step 2: first and last 2 characters extraction
SELECT
  first_name,
  LEFT(first_name, 2) AS  first_2_char,
  RIGHT(first_name, 2) AS last_2_char
FROM customers;

-- SUBSTRING

-- Retrieve a list of customer first names after removing the first character

-- Step 1: View table
SELECT *
FROM customers;

-- Step 2: View first name after 2nd character
SELECT
  first_name,
  SUBSTRING(first_name,2,LENGTH(first_name)) AS first_name_alt
FROM customers;

-- NUMERIC FUNCTIONS

-- ROUND
SELECT 
3.516,
ROUND(3.516,2) AS round_2,
ROUND(3.516,1) AS round_1,
ROUND(3.516,0) AS round_0

-- ABS
SELECT
-10,
ABS(-10),
ABS(10)

-- DATE TIME FUNCTIONS

-- EXTRACT Pgsl Year, Month, Day
SELECT 
  orderid,
  creationtime,
  EXTRACT(YEAR FROM creationtime) AS year,
  EXTRACT(MONTH FROM creationtime) AS month,
  EXTRACT(DAY FROM creationtime) AS day,
  EXTRACT(QUARTER FROM creationtime) AS QUARTER,
FROM sales.orders;

-- YEAR
SELECT 
  orderid,
  creationtime,
  YEAR(creationtime) AS YEAR
 FROM sales.orders;

-- DATEPART
SELECT
  orderid,
  creationtime,
  DATE_PART('year', creationtime) AS year_dp,
  DATE_PART('month', creationtime) AS month_dp,
  DATE_PART('quarter', creationtime) AS quarter_dp,
  DATE_PART('year', creationtime) AS year_dp
FROM  sales.orders;

-- DATE_TRUNC
SELECT
  orderid,
  creationtime,
  DATE_TRUNC('day', creationtime) AS day_dt
FROM  sales.orders;

SELECT
  DATE_TRUNC('month', creationtime) AS Creation,
  COUNT(*)
FROM sales.orders
GROUP BY DATE_TRUNC('month', creationtime)
ORDER BY Creation ASC;

-- EOMONTH Function - Non PgSQL use DATE_TRUNC instead
SELECT
  orderid,
  creationtime,
  EOMONTH(creationtime) AS end_of_month,
FROM  sales.orders;


-- DATE_TRUNC for EOMONTH
SELECT
  orderid,
  creationtime,
  (date_trunc('month', creationtime)
  + INTERVAL '1 month'
  - INTERVAL '1 day') AS end_of_month
FROM sales.orders;

-- Practice Questions Used in notion

-- Date_Part using EXTRACT
SELECT
  order_id,
  order_date,
  date_part('year', order_date) AS Years_dp,
  EXTRACT(YEAR FROM order_date) AS Years,
  EXTRACT(MONTH FROM order_date) AS Month,
  EXTRACT(DAY FROM order_date) AS Day,
  EXTRACT(QUARTER FROM order_date) AS Quarter,
  EXTRACT(MONTH FROM order_date) AS Month  
FROM orders;

-- Month number from date
SELECT
  order_id,
  order_date,
  extract(MONTH FROM order_date) AS Month
FROM orders;

-- DATE_TRUNC Practice questions

-- DATE_Trunc time
SELECT
  order_id,
  order_date,
  date_trunc(HOUR)
FROM orders;



-- PART EXTRACTION USE CASE DATA AGGREGATIONS 5:56:47

-- How many orders were placed each year
SELECT 
  EXTRACT(YEAR FROM orderdate),
  COUNT(*) AS NumOfOrders
FROM sales.orders
GROUP BY EXTRACT(YEAR FROM orderdate);

-- How many orders were placed each month
SELECT 
  EXTRACT(MONTH FROM orderdate),
  COUNT(*) AS orders_per_month
FROM sales.orders
GROUP BY EXTRACT(MONTH FROM orderdate)
ORDER BY EXTRACT(MONTH FROM orderdate);

-- Orders per month as Text
SELECT
  TO_CHAR(orderdate, 'Month') AS month_name,
  COUNT(*) AS orders_per_month
FROM sales.orders
GROUP BY TO_CHAR(orderdate, 'Month')
ORDER BY TO_CHAR(orderdate, 'Month');


SELECT
  TO_CHAR(orderdate, 'FMMonth') AS month_name,
  COUNT(*) AS orders_per_month
FROM sales.orders
GROUP BY TO_CHAR(orderdate, 'FMMonth')
ORDER BY TO_CHAR(orderdate, 'FMMonth');

SELECT
  TO_CHAR(orderdate, 'FMMonth') AS month_name,
  COUNT(*) AS orders_per_month
FROM sales.orders
GROUP BY
  TO_CHAR(orderdate, 'FMMonth'),
  EXTRACT(MONTH FROM orderdate)
ORDER BY EXTRACT(MONTH FROM orderdate);


-- All orders placed in Feb
SELECT *
FROM sales.orders
WHERE extract(MONTH FROM orderdate) = 2;

-- Orders in feb
SELECT *
FROM sales.orders
WHERE extract(MONTH FROM orderdate) = 2;


-- Step 2: Use DATE_TRUNC function to return the date part of the data
SELECT
    column_name,
    (DATE_TRUNC('month', column_name) 
    + INTERVAL '1 month' 
    - INTERVAL '1 day') AS eomonth_column
FROM table1;

-- FORMAT & CASTING

-- FORMAT
SELECT
  orderid,
  creationtime,
  to_char(creationtime, 'DD') AS dd,
  to_char(creationtime, 'ddd') AS ddd,
  to_char(creationtime, 'dddd') AS dddd
FROM sales.orders;

-- Cast Practice Question

-- Show CreationTime using different formats

-- Day Wed Jan Q! 2025 12:34:56 PM
-- Build a custom CreationTime string like: "Day Wed Jan Q1 2025 12:34:56 PM"
SELECT
  orderid,
  creationtime,
  'Day ' ||
  to_char(creationtime, 'Dy Mon') || ' ' ||
  'Q' || extract(quarter FROM creationtime)::int || ' ' ||
  to_char(creationtime, 'YYYY HH12:MI:SS AM') AS customerformat
FROM sales.orders;


-- Build a custom CreationTime string like: "Day Wed Jan Q1 2025 12:34:56 PM"
SELECT
  orderid,
  creationtime,
  'Day ' ||
  to_char(creationtime, 'Dy Mon') || ' ' ||
  'Q' || EXTRACT(quarter FROM creationtime)::int || ' ' ||
  to_char(creationtime, 'YYYY HH12:MI::SS AM') AS customerformat
FROM sales.orders;

-- Sales per month
SELECT 
  orderdate,
  to_char(orderdate, 'MM yy') AS daily_orders,
  count(*)
FROM sales.orders
ORDER BY to_char(orderdate, 'MM yy');

-- Sales per month
Select 
  to_char(orderdate, 'Mon yy') AS date,
  COUNT(*) AS daily_orders
FROM sales.orders
GROUP BY to_char(orderdate, 'Mon yy')
ORDER BY daily_orders DESC;

-- Sales per month
SELECT 
  to_char(orderdate, 'Mon YY') AS date,
  COUNT(*) AS daily_orders
FROM sales.orders
GROUP BY to_char(orderdate, 'Mon YY')
ORDER BY daily_orders DESC;

-- Formatting Use Case - Data Standardization

-- Convert pgsql CAST
SELECT
  CAST('123' AS INT) AS "String to Int CONVERT",
  CAST('2025-08-20' AS DATE) AS "String to Date CONVERT"
FROM sales.orders;

SELECT
  '123'::int AS "String to Int CONVERT",
  '2025-08-20'::date AS "String to Date CONVERT",
  creationtime,
  creationtime::date AS "Datetime to Date CONVERT"
FROM sales.orders;



SELECT creationtime
FROM sales.orders;

-- Shortform
SELECT
'123'::int AS "String to Int CONVERT",
'2025-08-20'::date AS "String to Date CONVERT";
