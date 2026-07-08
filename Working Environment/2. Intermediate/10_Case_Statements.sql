-- Generate a report showing the total sales for each category
-- High is over 50, Medium id between 20 and 50, Lowuf the sales is equal or lower than 20
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
ORDER BY total_sales DESC;

