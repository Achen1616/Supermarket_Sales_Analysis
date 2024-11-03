INSERT OVERWRITE LOCAL DIRECTORY 'Output/Hive/Complex_Queries/MonthlyProductRev'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT 
    month,
    product_line,
    SUM(total) AS monthly_revenue,
    ROUND(AVG(rating), 2) AS avg_rating
FROM 
    supermarket_sales
GROUP BY 
    month, product_line
ORDER BY 
    month ASC, monthly_revenue DESC;
