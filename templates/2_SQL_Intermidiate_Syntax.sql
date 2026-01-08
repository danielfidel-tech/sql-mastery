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
