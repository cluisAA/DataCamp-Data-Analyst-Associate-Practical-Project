-- TASK 2: Clean the products table according to exam rules
-- Important: weight and price are TEXT (even if CSV shows numbers)
-- We must clean text, handle 'unlisted' / junk, round to 2 decimals, fill medians

SELECT
  product_id,

  -- product_type & brand: replace empty or '-' with 'Unknown'
  COALESCE(NULLIF(TRIM(product_type), ''), 'Unknown') AS product_type,
  CASE 
    WHEN TRIM(brand) = '' OR TRIM(brand) = '-' THEN 'Unknown'
    ELSE TRIM(brand)
  END AS brand,

  -- weight: remove any non-numeric characters (e.g. " grams", "unlisted")
  ROUND(
    CAST(REGEXP_REPLACE(weight, '[^0-9.]', '', 'g') AS numeric), 2
  ) AS weight,

  -- price: real → cast to numeric to avoid "round(real, integer)" error
  ROUND(CAST(price AS numeric), 2) AS price,

  -- average_units_sold: NULL → 0
  COALESCE(average_units_sold, 0) AS average_units_sold,

  -- year_added: NULL → 2022
  COALESCE(year_added, 2022) AS year_added,

  -- stock_location: only A,B,C,D valid → else 'Unknown', uppercase
  CASE 
    WHEN UPPER(TRIM(stock_location)) IN ('A', 'B', 'C', 'D') THEN UPPER(TRIM(stock_location))
    ELSE 'Unknown'
  END AS stock_location
FROM products;
