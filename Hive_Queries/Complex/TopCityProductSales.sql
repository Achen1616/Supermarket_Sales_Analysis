WITH TopCities AS (
    SELECT 
        city,
        SUM(total) AS total_revenue
    FROM 
        supermarket_sales
    GROUP BY 
        city
    ORDER BY 
        total_revenue DESC
    LIMIT 5
)
INSERT OVERWRITE LOCAL DIRECTORY 'Output/Hive/Complex_Queries/TopCityProductSales'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT 
    s.city,
    s.product_line,
    s.customer_type,
    SUM(s.total) AS product_line_revenue,
    ROUND((SUM(s.total) / cr.total_revenue) * 100, 2) AS revenue_percentage
FROM 
    supermarket_sales s
JOIN 
    TopCities cr ON s.city = cr.city
GROUP BY 
    s.city, s.product_line, s.customer_type, cr.total_revenue
ORDER BY 
    s.city ASC, revenue_percentage DESC;
