INSERT OVERWRITE LOCAL DIRECTORY 'Output/Hive/Simple_Queries/AvgGrossIncomeByCity'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT city, 
       ROUND(AVG(gross_income), 2) AS average_gross_income
FROM supermarket_sales
GROUP BY city;
