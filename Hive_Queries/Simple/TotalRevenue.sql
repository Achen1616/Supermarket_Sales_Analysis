INSERT OVERWRITE LOCAL DIRECTORY 'Output/Hive/Simple_Queries/TotalRevenue'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT Payment, 
       ROUND(SUM(Total), 2) AS TotalRevenue
FROM supermarket_sales
GROUP BY Payment;
