-- TASK 1: Count how many products have missing year_added
-- The exam says: "return a single column missing_year with the count"
SELECT COUNT(*) AS missing_year
FROM products
WHERE year_added IS NULL;
