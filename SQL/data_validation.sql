-- ============================================================
-- DATA VALIDATION
-- Sales Data Engineering Pipeline
-- ============================================================


-- ============================================================
-- 1. Source vs Fact Row Count
-- Expected: Same number of rows
-- ============================================================
SELECT
    (SELECT COUNT(*) FROM orders) AS orders_count,
    (SELECT COUNT(*) FROM fact_sales) AS fact_sales_count;


-- ============================================================
-- 2. Fact Grain Validation
-- Expected: No duplicate order_id
-- ============================================================
SELECT
    order_id,
    COUNT(*) AS row_count
FROM fact_sales
GROUP BY order_id
HAVING COUNT(*) > 1;


-- ============================================================
-- 3. Missing Dimension Keys
-- Expected: 0 missing product/location keys
-- ============================================================
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN product_key IS NULL THEN 1 ELSE 0 END)
        AS missing_product_keys,
    SUM(CASE WHEN location_key IS NULL THEN 1 ELSE 0 END)
        AS missing_location_keys
FROM fact_sales;


-- ============================================================
-- 4. Critical NULL Checks
-- ============================================================
SELECT
    COUNT(*) AS total_rows,

    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END)
        AS null_order_id,

    SUM(CASE WHEN product_key IS NULL THEN 1 ELSE 0 END)
        AS null_product_key,

    SUM(CASE WHEN location_key IS NULL THEN 1 ELSE 0 END)
        AS null_location_key,

    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END)
        AS null_quantity,

    SUM(CASE WHEN sale_price IS NULL THEN 1 ELSE 0 END)
        AS null_sale_price,

    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END)
        AS null_profit

FROM fact_sales;


-- ============================================================
-- 5. Business KPI Validation
-- ============================================================
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount), 2) AS average_discount
FROM fact_sales;
