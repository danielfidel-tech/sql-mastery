-- Creating a new table
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
    ...
);

-- Inserting data into a table
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- Add a new column to a table
ALTER TABLE table_name
ADD COLUMN column_name datatype;

-- Remove a column from a table
ALTER TABLE table_name
DROP COLUMN column_name;

-- Rename a column
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;