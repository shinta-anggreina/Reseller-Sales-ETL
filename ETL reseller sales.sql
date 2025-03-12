--Extract
SELECT frs.ResellerKey, dr.ResellerName, dp.EnglishProductName, frs.SalesAmount, frs.OrderDate
FROM FactResellerSales frs
JOIN DimReseller dr ON frs.ResellerKey = dr.ResellerKey
JOIN DimProduct dp ON frs.ProductKey = dp.ProductKey;


--Transform
SELECT frs.ResellerKey, dr.ResellerName, 
       SUM(frs.SalesAmount) AS TotalSales,
       FORMAT(frs.OrderDate, 'yyyy-MM') AS OrderMonth
FROM FactResellerSales frs
JOIN DimReseller dr ON frs.ResellerKey = dr.ResellerKey
GROUP BY frs.ResellerKey, dr.ResellerName, FORMAT(frs.OrderDate, 'yyyy-MM');

--cek missing values
SELECT 
    COUNT(*) AS TotalRows,
    COUNT(SalesAmount) AS FilledSalesAmount,
    COUNT(OrderDate) AS FilledOrderDate
FROM FactResellerSales;

SELECT 
    COUNT(*) AS TotalRows,
    COUNT(ResellerName) AS FilledResellerName,
    COUNT(ResellerKey) AS FilledResellerKey
FROM DimReseller;


--tidak ada missing values disini


--Load (membuat views untuk disimpan)

GO
CREATE VIEW ResellerSalesSummary AS
SELECT 
    frs.ResellerKey, 
    dr.ResellerName, 
    SUM(frs.SalesAmount) AS TotalSales,
    FORMAT(frs.OrderDate, 'yyyy-MM') AS OrderMonth
FROM FactResellerSales frs
JOIN DimReseller dr ON frs.ResellerKey = dr.ResellerKey
GROUP BY frs.ResellerKey, dr.ResellerName, FORMAT(frs.OrderDate, 'yyyy-MM');


--Mengecek views
SELECT * FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'ResellerSalesSummary';

SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'ResellerSalesSummary';

SELECT * FROM ResellerSalesSummary;


--melihat informasi dari views
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'ResellerSalesSummary';

