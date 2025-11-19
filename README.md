
### Task Overview

| Task | Goal | Key Trick |
|------|------|-----------|
| 1 | Count missing `year_added` | `COUNT(*) WHERE year_added IS NULL` |
| 2 | Clean the entire table | `weight` is text → `REGEXP_REPLACE` + `CAST` |
| 3 | Min/max price per product_type | Simple `GROUP BY` |
| 4 | Filter Meat & Dairy with >10 units sold | Simple `WHERE` |

### Run Order
1. task1_missing_year.sql
2. task2_clean_data.sql
3. task3_min_max_price.sql
4. task4_meat_dairy_high_sales.sql

### Sense Checks
- Always check column types: `SELECT pg_typeof(col) FROM table LIMIT 1;`
- `ROUND(real, 2)` fails → use `ROUND(CAST(col AS numeric), 2)`
- `weight` often has " grams" or junk → `REGEXP_REPLACE(weight, '[^0-9.]', '', 'g')`
- Use `PERCENTILE_DISC(0.5)` for median (some exams prefer DISC over CONT)

