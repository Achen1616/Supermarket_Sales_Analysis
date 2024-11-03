-- SampledCustomerPaymentAnalysis.hql

WITH SampledData AS (
    SELECT * FROM supermarket_sales TABLESAMPLE(10 PERCENT)
),
PaymentRevenue AS (
    SELECT 
        product_line,
        customer_type,
        payment,
        SUM(total) AS payment_revenue
    FROM 
        SampledData
    GROUP BY 
        product_line, customer_type, payment
),
TotalProductRevenue AS (
    SELECT 
        product_line,
        SUM(total) AS total_product_revenue
    FROM 
        SampledData
    GROUP BY 
        product_line
)
INSERT OVERWRITE LOCAL DIRECTORY 'Output/Hive/Complex_Queries/SampledCustomerPaymentAnalysis'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT 
    pr.product_line,
    pr.customer_type,
    pr.payment,
    pr.payment_revenue,
    ROUND((pr.payment_revenue / tpr.total_product_revenue) * 100, 2) AS revenue_contribution_percentage,
    ROUND(AVG(s.rating), 2) AS avg_rating
FROM 
    PaymentRevenue pr
JOIN 
    TotalProductRevenue tpr ON pr.product_line = tpr.product_line
JOIN 
    SampledData s ON pr.product_line = s.product_line AND pr.payment = s.payment AND pr.customer_type = s.customer_type
GROUP BY 
    pr.product_line, pr.customer_type, pr.payment, pr.payment_revenue, tpr.total_product_revenue
ORDER BY 
    pr.product_line ASC, revenue_contribution_percentage DESC;
