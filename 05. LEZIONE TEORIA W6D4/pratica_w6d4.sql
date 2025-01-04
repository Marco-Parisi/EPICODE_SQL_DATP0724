-- Punto 1.1
SELECT
	prod.EnglishProductName AS ProductName
    , sub.EnglishProductSubcategoryName AS Subcategory
    , prod.StandardCost
    , prod.ListPrice
    , prod.DealerPrice
FROM 
	dimproduct AS prod
INNER JOIN 
	dimproductsubcategory AS sub
ON
	prod.ProductSubcategoryKey = sub.ProductSubcategoryKey
ORDER BY 
	sub.EnglishProductSubcategoryName, ProductName;




-- Punto 1.2
SELECT
	prod.EnglishProductName AS ProductName
    , cat.EnglishProductCategoryName AS Category
    , sub.EnglishProductSubcategoryName AS Subcategory
    , prod.StandardCost
    , prod.ListPrice
    , prod.DealerPrice
FROM 
	dimproduct AS prod
INNER JOIN 
	dimproductsubcategory AS sub
ON
	prod.ProductSubcategoryKey = sub.ProductSubcategoryKey
INNER JOIN 
	dimproductcategory AS cat
ON
	sub.ProductCategoryKey = cat.ProductCategoryKey
ORDER BY 
	cat.EnglishProductCategoryName, 
    sub.EnglishProductSubcategoryName,
    ProductName;

    
        

-- Punto 1.3
SELECT 
	prod.EnglishProductName AS ProductName
    , prod.ProductKey
FROM 
	dimproduct AS prod
INNER JOIN 
	factresellersales AS fact
ON
	prod.ProductKey = fact.ProductKey
GROUP BY 
	prod.ProductKey;

    
        
    
-- Punto 1.4
SELECT 
	prod.EnglishProductName AS ProductName
    , prod.ProductKey
FROM 
	dimproduct AS prod
LEFT JOIN 
	factresellersales AS fact
ON
	prod.ProductKey = fact.ProductKey
WHERE 
	fact.ProductKey IS NULL 
AND 
	prod.FinishedGoodsFlag = 1
GROUP BY 
	prod.ProductKey;

    
        
 
-- Punto 1.4 (subquery)
SELECT 
    prod.EnglishProductName AS ProductName,
    prod.ProductKey
FROM 
    dimproduct AS prod
WHERE 
    prod.FinishedGoodsFlag = 1
AND 
    prod.ProductKey NOT IN (
        SELECT DISTINCT ProductKey
        FROM factresellersales
    )
GROUP BY 
    prod.ProductKey;

    
        
 
-- Punto 1.5
SELECT 
	prod.EnglishProductName AS ProductName
    , prod.ProductKey
    , SUM(fact.OrderQuantity) AS TotQuantity
    , SUM(fact.SalesAmount) AS TotSales
FROM 
	dimproduct AS prod
INNER JOIN 
	factresellersales AS fact
ON
	prod.ProductKey = fact.ProductKey
GROUP BY 
	prod.ProductKey;
    
    
    

-- Punto 2.1
SELECT 
	prod.EnglishProductName AS ProductName
	, cat.EnglishProductCategoryName AS Category
    , SUM(fact.OrderQuantity) AS TotQuantity
    , SUM(fact.SalesAmount) AS TotSales
FROM 
	dimproduct AS prod
INNER JOIN 
	dimproductsubcategory AS sub
ON
	prod.ProductSubcategoryKey = sub.ProductSubcategoryKey
INNER JOIN 
	dimproductcategory AS cat
ON
	sub.ProductCategoryKey = cat.ProductCategoryKey
INNER JOIN 
	factresellersales AS fact
ON
	prod.ProductKey = fact.ProductKey
GROUP BY 
	ProductName
ORDER BY
	Category
	, ProductName;
    
-- Punto 2.1 (subquery)
SELECT 
	prod.EnglishProductName AS ProductName
	, 	(SELECT c.EnglishProductCategoryName 
		 FROM dimproductsubcategory AS s
		 INNER JOIN dimproductcategory AS c
		 ON s.ProductCategoryKey = c.ProductCategoryKey
		 WHERE s.ProductSubcategoryKey = prod.ProductSubcategoryKey) AS Category
    , SUM(fact.OrderQuantity) AS TotQuantity
    , SUM(fact.SalesAmount) AS TotSales
FROM 
	dimproduct AS prod
INNER JOIN 
	factresellersales AS fact
ON
	prod.ProductKey = fact.ProductKey
GROUP BY 
	ProductName
ORDER BY
	Category
	, ProductName;
    
    
-- Punto 2.2
SELECT 
	*
FROM
	dimreseller; 
    

 -- Punto 2.3
SELECT 
	ResellerName AS Reseller
    , geo.EnglishCountryRegionName AS Country
FROM
	dimreseller AS res
INNER JOIN
	dimgeography AS geo
ON
	geo.GeographyKey = res.GeographyKey
ORDER BY
	Country
    , Reseller;
       
    
    
 -- Punto 2.4
SELECT 
	ResellerName AS Reseller
    , geo.EnglishCountryRegionName AS Country
FROM
	dimreseller AS res
INNER JOIN
	dimgeography AS geo
ON
	geo.GeographyKey = res.GeographyKey
ORDER BY
	Country
    , Reseller;


SELECT 
    fact.OrderDate AS OrderDate
	, fact.SalesOrderNumber AS OrderNumber
    , fact.SalesOrderLineNumber AS OrderLine
    , fact.UnitPrice AS UnitPrice
    , fact.OrderDate AS Quantity
    , fact.TotalProductCost AS TotProductCost
	, prod.EnglishProductName AS ProductName
	,	(SELECT c.EnglishProductCategoryName 
		FROM dimproductsubcategory AS s
		INNER JOIN dimproductcategory AS c
		ON s.ProductCategoryKey = c.ProductCategoryKey
		WHERE s.ProductSubcategoryKey = prod.ProductSubcategoryKey) AS Category
	, res.ResellerName AS ResellerName
    , geo.EnglishCountryRegionName AS Country
FROM 
	dimproduct AS prod
INNER JOIN 
	factresellersales AS fact
ON
	prod.ProductKey = fact.ProductKey
INNER JOIN
	dimreseller AS res
ON
	fact.ResellerKey = res.ResellerKey
INNER JOIN
	dimgeography AS geo
ON
	geo.GeographyKey = res.GeographyKey
ORDER BY
	OrderDate DESC
	, Category;



