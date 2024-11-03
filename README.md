# Supermarket-Sales-Analysis

This is a repository for analysing supermarket sales data using Pig and Hive in the Hadoop ecosystem. The project involves data cleaning, processing, and analysis of transaction records to gain meaningful insights about sales patterns and customer behavior.

The steps taken to carry out this analysis are listed briefly below:
* The raw sales data was read into Pig for cleaning and processing
* Basic analysis was performed using Pig queries
* The cleaned data was loaded into Hive for more complex analysis
* Visualisations were created using Jupyter notebooks to interpret the results

[Final Report](CSC1109 - Assignment 1.pdf)

The contents of this repo are as follows:
* [Data](./Data) - Contains both raw and cleaned datasets
  * [Raw_Data](./Data/Raw_Data) - The original supermarket sales dataset
  * [Cleaned_Data](./Data/Cleaned_Data) - Processed and cleaned data ready for analysis
* [Pig_Queries](./Pig_Queries) - Contains all Pig scripts used in the project
  * [DataCleaningProcessing.pig](./Pig_Queries/DataCleaningProcessing.pig) - Main script for data cleaning
  * [Simple](./Pig_Queries/Simple) - Basic analysis queries
* [Hive_Queries](./Hive_Queries) - Contains all Hive scripts
  * [Create_Table.sql](./Hive_Queries/Create_Table.sql) - Table creation scripts
  * [Simple](./Hive_Queries/Simple) - Basic analysis queries
  * [Complex](./Hive_Queries/Complex) - Advanced analysis queries
* [Output](./Output) - Contains all data output from Pig and Hive
  * [Pig](./Output/Pig) - Results from Pig queries
  * [Hive](./Output/Hive) - Results from Hive queries
* [Output_Analysis](./Output_Analysis) - Jupyter notebooks for analysis visualization
  * [AvgGrossIncomeByCity.ipynb](./Output_Analysis/AvgGrossIncomeByCity.ipynb)
  * [MonthlyProductRev.ipynb](./Output_Analysis/MonthlyProductRev.ipynb)
  * [SampledCustomerPaymentAnalysis.ipynb](./Output_Analysis/SampledCustomerPaymentAnalysis.ipynb)
  * [TopCityProductSales.ipynb](./Output_Analysis/TopCityProductSales.ipynb)
  * [TotalRevenue.ipynb](./Output_Analysis/TotalRevenue.ipynb)
* [FileType_Conversion.ipynb](./FileType_Conversion.ipynb) - Jupyter notebook used for data format conversions
