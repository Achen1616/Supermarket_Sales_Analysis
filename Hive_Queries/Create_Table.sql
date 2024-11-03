CREATE TABLE IF NOT EXISTS supermarket_sales (
    invoice_id STRING,
    branch STRING,
    city STRING,
    customer_type STRING,
    gender STRING,
    product_line STRING,
    unit_price FLOAT,
    quantity INT,
    tax_5_percent FLOAT,
    total FLOAT,
    Tdate DATE,
    Ttime STRING,
    payment STRING,
    cogs FLOAT,
    gross_margin_percentage FLOAT,
    gross_income FLOAT,
    rating FLOAT,
    month STRING,
    day STRING,
    year STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'Data/Cleaned_Data/cleaned_sales_data/part-m-00000' INTO TABLE supermarket_sales;
