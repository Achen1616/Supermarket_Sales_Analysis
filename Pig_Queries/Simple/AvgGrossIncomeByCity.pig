-- AvgGrossIncomeByCity.pig
-- Calculate the average gross income by city from the sales data.
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

-- Group the data by City
grp_city = GROUP sales_data BY City;

-- Calculate the average gross income for each city using ROUND_TO
avg_income = FOREACH grp_city GENERATE 
    group AS City, 
    ROUND_TO(AVG(sales_data.GrossIncome), 2) AS Avg_Gross_Income;

-- Store the results
STORE avg_income INTO 'Output/Pig/AvgGrossIncomeByCity' USING PigStorage(',');