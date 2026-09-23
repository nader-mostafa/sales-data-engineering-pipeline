-- ============================================================
-- ANALYTICS LAYER
-- Sales Data Engineering Pipeline
-- ============================================================


-- ============================================================
-- Analytical View
-- ============================================================
CREATE OR ALTER VIEW vw_sales_analysis AS
SELECT
    f.order_id,
    f.date_key,

    f.product_key,
    p.product_id,
    p.category,
    p.sub_category,

    f.location_key,
    l.country,
    l.region,
    l.state,
    l.city,
    l.postal_code,

    f.ship_mode,
    f.segment,
    f.quantity,
    f.discount,
    f.sale_price,
    f.profit

FROM fact_sales f

LEFT JOIN dim_products p
    ON f.product_key = p.product_key

LEFT JOIN dim_locations l
    ON f.location_key = l.location_key;


-- ============================================================
-- Overall KPIs
-- ============================================================
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 /
        NULLIF(SUM(sale_price), 0),
        2
    ) AS profit_margin
FROM vw_sales_analysis;


-- ============================================================
-- Sales by Category
-- ============================================================
SELECT
    category,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity
FROM vw_sales_analysis
GROUP BY category
ORDER BY total_sales DESC;


-- ============================================================
-- Sales by Sub-category
-- ============================================================
SELECT
    category,
    sub_category,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity
FROM vw_sales_analysis
GROUP BY
    category,
    sub_category
ORDER BY total_sales DESC;


-- ============================================================
-- Sales by Region
-- ============================================================
SELECT
    region,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_sales_analysis
GROUP BY region
ORDER BY total_sales DESC;


-- ============================================================
-- Sales by Segment
-- ============================================================
SELECT
    segment,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_sales_analysis
GROUP BY segment
ORDER BY total_sales DESC;


-- ============================================================
-- Monthly Sales
-- ============================================================
SELECT
    LEFT(CAST(date_key AS VARCHAR(8)), 6) AS year_month,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_sales_analysis
GROUP BY LEFT(CAST(date_key AS VARCHAR(8)), 6)
ORDER BY year_month;


-- ============================================================
-- Profit Margin by Sub-category
-- ============================================================
SELECT
    category,
    sub_category,
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 /
        NULLIF(SUM(sale_price), 0),
        2
    ) AS profit_margin
FROM vw_sales_analysis
GROUP BY
    category,
    sub_category
ORDER BY profit_margin DESC;
