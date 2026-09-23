-- ============================
-- View: dim_dates
-- ============================
CREATE VIEW dim_dates AS
SELECT DISTINCT
    CONVERT(INT, FORMAT(order_date, 'yyyyMMdd')) AS date_key,
    order_date AS full_date,
    DAY(order_date) AS day,
    MONTH(order_date) AS month,
    DATENAME(MONTH, order_date) AS month_name,
    DATEPART(QUARTER, order_date) AS quarter,
    YEAR(order_date) AS year,
    DATENAME(WEEKDAY, order_date) AS day_of_week
FROM orders
WHERE order_date IS NOT NULL;


-- ============================
-- View: dim_products
-- ============================
CREATE VIEW dim_products AS
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY product_id) AS product_key,
    product_id,
    category,
    sub_category
FROM orders
WHERE product_id IS NOT NULL;

-- ============================================================
-- DIMENSION VIEWS
-- Sales Data Engineering Pipeline
-- ============================================================

-- ============================================================
-- View: dim_dates
-- ============================================================
CREATE OR ALTER VIEW dim_dates AS
SELECT DISTINCT
    CONVERT(INT, CONVERT(CHAR(8), order_date, 112)) AS date_key,
    order_date AS full_date,
    DAY(order_date) AS day,
    MONTH(order_date) AS month,
    DATENAME(MONTH, order_date) AS month_name,
    DATEPART(QUARTER, order_date) AS quarter,
    YEAR(order_date) AS year,
    DATENAME(WEEKDAY, order_date) AS day_of_week
FROM orders
WHERE order_date IS NOT NULL;


-- ============================================================
-- View: dim_products
-- One row per product_id
-- ============================================================
CREATE OR ALTER VIEW dim_products AS
WITH unique_products AS (
    SELECT
        product_id,
        MAX(category) AS category,
        MAX(sub_category) AS sub_category
    FROM orders
    WHERE product_id IS NOT NULL
    GROUP BY product_id
)
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id) AS product_key,
    product_id,
    category,
    sub_category
FROM unique_products;


-- ============================================================
-- View: dim_locations
-- One row per unique location
-- ============================================================
CREATE OR ALTER VIEW dim_locations AS
WITH unique_locations AS (
    SELECT
        country,
        region,
        state,
        city,
        postal_code
    FROM orders
    GROUP BY
        country,
        region,
        state,
        city,
        postal_code
)
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            country,
            region,
            state,
            city,
            postal_code
    ) AS location_key,
    country,
    region,
    state,
    city,
    postal_code
FROM unique_locations;
