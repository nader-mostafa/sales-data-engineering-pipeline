-- ============================
-- View: fact_sales
-- ============================
CREATE VIEW fact_sales AS
SELECT
    o.order_id,
    CONVERT(INT, FORMAT(o.order_date, 'yyyyMMdd')) AS date_key,
    dp.product_key,
    dl.location_key,
    o.ship_mode,
    o.segment,
    o.quantity,
    o.discount,
    o.sale_price,
    o.profit
FROM orders o

LEFT JOIN dim_products dp
    ON o.product_id = dp.product_id

LEFT JOIN dim_locations dl
    ON  o.country = dl.country
    AND ISNULL(o.region, '') = ISNULL(dl.region, '')
    AND ISNULL(o.state, '') = ISNULL(dl.state, '')
    AND ISNULL(o.city, '') = ISNULL(dl.city, '')
    AND ISNULL(o.postal_code, '') = ISNULL(dl.postal_code, '');
