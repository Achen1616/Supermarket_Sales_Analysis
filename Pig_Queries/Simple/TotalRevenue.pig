-- TotalRevenue.pig
-- Calculate the total sales revenue by payment method.
sales_data = LOAD 'Data/Cleaned_data/cleaned_sales_data/part-m-00000' USING PigStorage(',') AS (
    InvoiceID: chararray, 
    Branch: chararray, 
    City: chararray, 
    CustomerType: chararray, 
    Gender: chararray, 
    ProductLine: chararray, 
    UnitPrice: float, 
    Quantity: int, 
    Tax: float, 
    Total: float, 
    Date: chararray, 
    Time: chararray, 
    Payment: chararray, 
    COGS: float, 
    GrossMarginPercentage: float, 
    GrossIncome: float, 
    Rating: float,
    Month: chararray,
    Day: chararray,
    Year: chararray
);

-- Group the data by Payment method
grp_payment = GROUP sales_data BY Payment;

-- Calculate the total revenue for each payment method using ROUND_TO for consistency
total_revenue = FOREACH grp_payment GENERATE 
    group AS Payment, 
    ROUND_TO(SUM(sales_data.Total), 2) AS Total_Revenue;

-- Store the results
STORE total_revenue INTO 'Output/Pig/TotalRevenue' USING PigStorage(',');