-- @block Bookmarked query
-- @group SQL Scripts
-- @name View Table Pg

-- Show table names
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- Show table names
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sales';