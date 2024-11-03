-- Load the dataset
sales_data = LOAD '../Data/Raw_Data/supermarket_sales - Sheet1.csv' 
USING PigStorage(',')
AS (InvoiceID:chararray, Branch:chararray, City:chararray, CustomerType:chararray, Gender:chararray, ProductLine:chararray, UnitPrice:float, Quantity:int, Tax:float, Total:float, Date:chararray, Time:chararray, Payment:chararray, COGS:float, GrossMarginPercentage:float, GrossIncome:float, Rating:float);

-- Filter the data to remove rows with null InvoiceID or invalid Quantity and Total values
cleaned_sales_data = FILTER sales_data BY InvoiceID IS NOT NULL AND Quantity > 0 AND Total > 0;

-- Process and split the date into Month, Day, and Year fields
split_dates = FOREACH cleaned_sales_data GENERATE 
    InvoiceID, 
    Branch, 
    City, 
    CustomerType, 
    Gender, 
    ProductLine,
    ROUND(UnitPrice * 100.0) / 100.0 AS UnitPrice:float,
    Quantity,
    ROUND(Tax * 100.0) / 100.0 AS Tax:float,
    ROUND(Total * 100.0) / 100.0 AS Total:float,
    Date, 
    Time, 
    Payment,
    ROUND(COGS * 100.0) / 100.0 AS COGS:float,
    GrossMarginPercentage,
    ROUND(GrossIncome * 100.0) / 100.0 AS GrossIncome:float,
    ROUND(Rating * 100.0) / 100.0 AS Rating:float,
    (chararray)STRSPLIT(Date, '/', 3).$0 AS Month,
    (chararray)STRSPLIT(Date, '/', 3).$1 AS Day,
    (chararray)STRSPLIT(Date, '/', 3).$2 AS Year;

-- Store the cleaned and transformed data
STORE split_dates INTO '../Data/Cleaned_Data/cleaned_sales_data' USING PigStorage(',');
