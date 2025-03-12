# Reseller Sales ETL Project

This project processes **reseller sales data** from the `AdventureWorksDW2022` database using **SQL Server**. The ETL process includes:  
- **Extract**: Loading data from `FactResellerSales` and `DimReseller`  
- **Transform**: Aggregating total sales per reseller per month  
- **Load**: Creating a **view** `ResellerSalesSummary` for analysis  

## Technologies Used
- SQL Server (SSMS)
- AdventureWorksDW2022 Database
- Git & GitHub

## How to Use
1. **Download the AdventureWorksDW2022 Database**  
   You can download the `.bak` file from the official Microsoft repository:  
   👉 [AdventureWorksDW2022.bak](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak)  

2. **Restore the database in SQL Server**  
   - Open **SQL Server Management Studio (SSMS)**  
   - Restore the downloaded `.bak` file  

3. **Run the SQL Scripts**  
   Execute the `.sql` files in this repository to process and analyze the data.  

4. **Query the `ResellerSalesSummary` View**  
   ```sql
   SELECT * FROM ResellerSalesSummary;
