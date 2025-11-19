SQL-- TASK 3: Min and max price per product_type
SELECT
  product_type,
  MIN(price) AS min_price,
  MAX(price) AS max_price
FROM products
GROUP BY product_type;
