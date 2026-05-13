/*
asasa

asas

asaas

*/

SELECT * 
FROM `workspace`.`default`.`bright_retail_sales_dataset` 
LIMIT 10;

-- ================================================
-- THE ENRICHED TABLE
-- ================================================
CREATE OR REPLACE VIEW enriched_sales AS

SELECT
    `Transaction ID`,
    `Date`                              AS trans_date,
    YEAR(`Date`)                        AS trans_year,
    MONTH(`Date`)                       AS trans_month,
    MONTHNAME(`Date`)                   AS trans_month_name,
    DAY(`Date`)                         AS trans_day,
    DAYNAME(`Date`)                     AS trans_day_name,
    TO_CHAR(`Date`, 'yyyyMM')           AS month_id,
    `Customer ID`,
    Gender,
    Age,
    `Product Category`,
    Quantity,
    ROUND(`Price per Unit` * 16.41, 2)  AS price_zar,
    ROUND(`Total Amount`   * 16.41, 2)  AS total_zar,

    CASE WHEN DAYOFWEEK(`Date`) IN (1,7) 
         THEN 'Weekend' ELSE 'Weekday' END  AS day_type,

    CASE WHEN Age BETWEEN 18 AND 25 THEN '18-25'
         WHEN Age BETWEEN 26 AND 35 THEN '26-35'
         WHEN Age BETWEEN 36 AND 45 THEN '36-45'
         WHEN Age BETWEEN 46 AND 55 THEN '46-55'
         ELSE '56+' END                     AS age_group,

    CASE WHEN (`Total Amount` * 16.41) < 1641  THEN 'Low'
         WHEN (`Total Amount` * 16.41) <= 8205  THEN 'Medium'
         WHEN (`Total Amount` * 16.41) <= 16410 THEN 'High'
         ELSE 'Premium' END                 AS revenue_tier

FROM  `workspace`.`default`.`bright_retail_sales_dataset` 
WHERE YEAR(`Date`) = 2023;

-- ================================================
-- MONTHLY REVENUE
-- ================================================

---KPIs for Dashboard
SELECT
    SUM(total_zar) AS total_revenue,
    COUNT(*) AS transactions,
    ROUND(AVG(total_zar),2) AS avg_order_value
FROM enriched_sales;

---Monthly Revenue
SELECT
    trans_month_name,
    SUM(total_zar) AS revenue
FROM enriched_sales
GROUP BY trans_month, trans_month_name
ORDER BY trans_month;

---Quartely Revenue
SELECT
    CONCAT('Q', QUARTER(trans_date)) AS quarter,
    SUM(total_zar) AS revenue
FROM enriched_sales
GROUP BY QUARTER(trans_date)
ORDER BY quarter;

---Analysis per Age groups
SELECT
    age_group,
    SUM(total_zar) AS revenue
FROM enriched_sales
GROUP BY age_group;

---Product Categories
SELECT
    `Product Category`,
    SUM(total_zar) AS revenue
FROM enriched_sales
GROUP BY `Product Category`
ORDER BY revenue DESC;
