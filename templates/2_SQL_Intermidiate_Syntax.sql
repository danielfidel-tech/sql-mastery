-- UNION SET OPERATIONS
-- Step 1: View the data from the 2 tables
SELECT * 
FROM table1;

SELECT * 
FROM table2;

-- Step 2: Combine the data from the 2 tables
SELECT * 
FROM table1

UNION

SELECT * 
FROM table2
ORDER BY column_name;

-- UNION ALL SET OPERATIONS
-- Step 1: View the data from the 2 tables
SELECT * 
FROM table1;

SELECT * 
FROM table2;

-- Step 2: Combine the data from the 2 tables
SELECT * 
FROM table1

UNION ALL

SELECT * 
FROM table2
ORDER BY column_name;

-- EXCEPT SET OPERATIONS
-- Step 1: View the data from the 2 tables
SELECT * 
FROM table1;

SELECT * 
FROM table2;

-- Step 2: Show the data from table_A that do not appear in table_B
SELECT * 
FROM table1
EXCEPT
SELECT * 
FROM table2;

-- INTERSECT SET OPERATIONS
-- Step 1: View the data from the 2 tables
SELECT * 
FROM table1;

SELECT * 
FROM table2;

-- Step 2: Merge & show the data from the 2 tables
SELECT * 
FROM table1
INTERSECT
SELECT * 
FROM table2;

-- EXCEPT Use Case - Delta Detection
-- Find new data in current_batch that is not in previous_batch
SELECT id
FROM current_batch

EXCEPT

SELECT id
FROM previous_batch;

-- EXCEPT Use Case - Data Completeness Check
-- Check if all data in table_A is present in table_B
SELECT * 
FROM table1
EXCEPT
SELECT * 
FROM table2;

-- INTERSECT Use Case - Data Consistency Check
-- Check if the data in table_A is the same as in table_B
SELECT * 
FROM table1
INTERSECT
SELECT * 
FROM table2;

-- SQL Functions
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the functions to manipulate the data
SELECT 
    column_name,
    function_name(column_name) AS new_column_name
FROM table1;

-- CONCAT Function
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the CONCAT function to concatenate the data
SELECT 
    column_name1,
    column_name2,
    CONCAT(column_name1, column_name2) AS concatenated_column
FROM table1;

-- LOWER Function
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the LOWER function to convert the data to lowercase
SELECT 
    column_name,
    LOWER(column_name) AS lowercase_column
FROM table1;

-- UPPER Function
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the UPPER function to convert the data to uppercase
SELECT 
    column_name,
    UPPER(column_name) AS uppercase_column
FROM table1;

-- TRIM Function
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: View the data from the table with leading and trailing spaces
SELECT 
    column_name
FROM table_name
WHERE column_name <> TRIM(column_name);

-- Step 3: Use the BTRIM function to remove the leading and trailing spaces
SELECT 
    column_name,
    BTRIM(column_name) AS trimmed_column
FROM table_name;

-- Step 4: View the data from the table with leading and trailing spaces
SELECT 
    column_name
FROM table_name
WHERE column_name <> BTRIM(column_name);

-- REPLACE Function
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the REPLACE function to replace the data
SELECT 
    column_name,
    REPLACE(column_name, 'old_value', 'new_value') AS replaced_column
FROM table1;

-- CALCULATION FUNCTIONS
-- LENGTH FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the LENGTH function to calculate the length of the data
SELECT 
    column_name,
    LENGTH(column_name) AS length_column
FROM table1;

-- LEFT FUNCTION        
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the LEFT function to extract the leftmost characters of the data
SELECT 
    column_name,
    LEFT(column_name, 5) AS left_column
FROM table1;

-- RIGHT FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the RIGHT function to extract the rightmost characters of the data
SELECT 
    column_name,
    RIGHT(column_name, 5) AS right_column
FROM table1;

-- SUBSTRING FUNCTION
-- Step 1: View the data from the table 
SELECT * 
FROM table1;

-- Step 2: Use the SUBSTRING function to extract the substring of the data
SELECT 
    column_name,
    SUBSTRING(column_name, 1, 5) AS substring_column
FROM table1;

-- Step 3 Use the SUBSTRING function with the LENGTH function
SELECT 
    column_name,
    SUBSTRING(column_name, 1, LENGTH(column_name)) AS substring_column
FROM table1;

-- NUMERIC FUNCTIONS

1. ROUND FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the ROUND function to round the data
SELECT 
    column_name,
    ROUND(column_name, 2) AS rounded_column
FROM table1;

2. ABS FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the ABS function to return the absolute value of the data
SELECT 
    column_name,
    ABS(column_name) AS absolute_column
FROM table1;

3. CEIL FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the CEIL function to return the smallest integer greater than or equal to the data
SELECT 
    column_name,
    CEIL(column_name) AS ceil_column
FROM table1;

4. FLOOR FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the FLOOR function to return the largest integer less than or equal to the data
SELECT 
    column_name,
    FLOOR(column_name) AS floor_column
FROM table1;

5. SQRT FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the SQRT function to return the square root of the data
SELECT 
    column_name,
    SQRT(column_name) AS sqrt_column
FROM table1;

6. POWER FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the POWER function to return the power of the data
SELECT 
    column_name,
    POWER(column_name, 2) AS power_column
FROM table1;

7. MOD FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the MOD function to return the modulus of the data
SELECT 
    column_name,
    MOD(column_name, 2) AS mod_column
FROM table1;

8. RANDOM FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the RANDOM function to return the random number of the data
SELECT 
    column_name,
    RANDOM() AS random_column
FROM table1;

-- DATE & TIME FUNCTIONS (EXTRACT)

-- DATE FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the DATE function to return the date of the data
SELECT 
    column_name,
    EXTRACT(DATE FROM column_name) AS date_column
FROM table1;

-- TIME FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the TIME function to return the time of the data
SELECT 
    column_name,
    EXTRACT(TIME FROM column_name) AS time_column
FROM table1;

-- YEAR FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the YEAR function to return the year of the data
SELECT 
    column_name,
    EXTRACT(YEAR FROM column_name) AS year_column
FROM table1;

-- MONTH FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the MONTH function to return the month of the data
SELECT 
    column_name,
    EXTRACT(MONTH FROM column_name) AS month_column
FROM table1;

-- DAY FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the DAY function to return the day of the data
SELECT 
    column_name,
    EXTRACT(DAY FROM column_name) AS day_column
FROM table1;

-- WEEK FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the WEEK function to return the week of the data
SELECT 
    column_name,
    EXTRACT(WEEK FROM column_name) AS week_column
FROM table1;

-- DATE_PART FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the DATE_PART function to return the date part of the data
SELECT 
    column_name,
    DATE_PART('year', column_name) AS year_column,
    DATE_PART('month', column_name) AS month_column,
    DATE_PART('day', column_name) AS day_column,
    DATE_PART('week', column_name) AS week_column
FROM table1;

-- DATE_NAME FUNCTION AKA PgSQL TO_CHAR FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the T0_CHAR function to return the month name of the date
SELECT 
    column_name,
    TO_CHAR(column_name, 'FMMonth') AS month_name_column
FROM table1;




-- DATE_TRUNC FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the DATE_TRUNC function to return the date part of the data
SELECT 
    column_name,
    DATE_TRUNC('year', column_name) AS year_column,
    DATE_TRUNC('month', column_name) AS month_column,
    DATE_TRUNC('day', column_name) AS day_column,
    DATE_TRUNC('week', column_name) AS week_column
FROM table1;

-- EOMONTH FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the EOMONTH function to return the end of the month of the data
SELECT 
    column_name,
    EOMONTH(column_name) AS eomonth_column
FROM table1;

-- Postgres EOMONTH FUNCTION USING DATE_TRUNC
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use DATE_TRUNC function to return the date part of the data
SELECT
    column_name,
    (DATE_TRUNC('month', column_name) 
    + INTERVAL '1 month' 
    - INTERVAL '1 day') AS eomonth_column
FROM table1;

FORMAT FUNCTION
-- Step 1: View the data from the table
SELECT * 
FROM table1;

-- Step 2: Use the FORMAT function to return the formatted data
SELECT 
    column_name,
    T0_CHAR(column_name, 'MM/dd/yyyy') AS formatted_column
FROM table1;

-- Build a custom CreationTime string like: "Day Wed Jan Q1 2025 12:34:56 PM"
SELECT
  orderid,
  creationtime,
  'Day ' ||
  to_char(creationtime, 'Dy Mon') || ' ' ||
  'Q' || EXTRACT(quarter FROM creationtime)::int || ' ' ||
  to_char(creationtime, 'YYYY HH12:MI::SS AM') AS customerformat
FROM sales.orders;

-- 1) Column
order_date

-- 2) Hardcoded date
DATE '2025-01-01'
TIMESTAMP '2025-01-01 12:00:00'

-- 3) Current date/time
CURRENT_DATE
CURRENT_TIMESTAMP
NOW()

EXTRACT(YEAR FROM order_date)
EXTRACT(MONTH FROM order_date)
EXTRACT(DAY FROM order_date)
EXTRACT(QUARTER FROM order_date)
EXTRACT(WEEK FROM order_date)

EXTRACT(quarter FROM order_date)::int


DATE_PART('year', order_date)
DATE_PART('month', order_date)
DATE_PART('day', order_date)
DATE_PART('quarter', order_date)
DATE_PART('week', order_date)

-- pgsql eomonth function
(DATE_TRUNC('month', order_date)
 + INTERVAL '1 month'
 - INTERVAL '1 day')::date

-- EOMONTH function
SELECT
  (DATE_TRUNC('month', order_date)
   + INTERVAL '1 month'
   - INTERVAL '1 day')::date AS month_end
FROM orders;

-- TO_CHAR function
TO_CHAR(order_date, 'YYYY-MM-DD')


-- TO_CHAR function for Dashboards:
TO_CHAR(order_date, 'YYYY-MM')


-- TO_CHAR function for Custom labels:
'Q' || EXTRACT(QUARTER FROM order_date)

CAST function
order_date::date
EXTRACT(YEAR FROM order_date)::int
CAST(order_date AS date)

-- CAST function
-- Step 1: View data
SELECT *
FROM table1;

-- Step 2: Convert datatype
SELECT
    column_name,
    CAST(column_name AS DATE) AS converted_date
FROM table1;

-- CAST FUNCTION Short Syntax
SELECT
    column_name,
    column_name::date AS converted_date
FROM table1;

