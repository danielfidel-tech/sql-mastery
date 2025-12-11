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
FROM	sales.ordersarchive;