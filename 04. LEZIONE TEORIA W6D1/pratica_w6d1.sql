-- Punto 1.1
USE AdventureWorksDW;

-- Punto 1.2
SELECT 
	*
FROM 
	dimproduct;
    
-- Punto 1.3
SELECT 
	ProductKey
	, ProductAlternateKey
    , EnglishProductName as NomeProdotto
	, Color
    , StandardCost as Costo
    , FinishedGoodsFlag as Terminato
FROM 
	dimproduct;

-- Punto 1.4
SELECT 
	ProductKey
	, ProductAlternateKey
    , EnglishProductName as NomeProdotto
	, Color
    , StandardCost as Costo
    , FinishedGoodsFlag as Terminato
FROM 
	dimproduct
WHERE 
	FinishedGoodsFlag = 1;

-- Punto 1.5
SELECT 
	ProductKey
	, ModelName
    , EnglishProductName as NomeProdotto
    , StandardCost as Costo
    , ListPrice
FROM 
	dimproduct
WHERE 
	LEFT(ProductAlternateKey, 2) = "FR" OR LEFT(ProductAlternateKey, 2) = "BK";


-- Punto 2.1
SELECT 
	ProductKey
	, ModelName
    , EnglishProductName as NomeProdotto
    , StandardCost as Costo
    , ListPrice
    , (ListPrice - StandardCost) as GuadagnoNetto
FROM 
	dimproduct
WHERE 
	(LEFT(ProductAlternateKey, 2) = "FR" OR LEFT(ProductAlternateKey, 2) = "BK") 
    AND (ListPrice IS NOT NULL AND StandardCost IS NOT NULL);


-- Punto 2.2
SELECT 
	ProductKey
	, ModelName
    , EnglishProductName as NomeProdotto
    , StandardCost as Costo
    , ListPrice
    , (ListPrice - StandardCost) as GuadagnoNetto
FROM 
	dimproduct
WHERE 
	ListPrice BETWEEN 1000 AND 2000
    AND FinishedGoodsFlag = 1;


-- Punto 2.3
SELECT 
	*
FROM
	dimemployee;
    

-- Punto 2.4
SELECT 
	*
FROM 
	dimemployee
WHERE
	SalesPersonFlag = 1;
    

-- Punto 2.5
SELECT 
	SalesOrderNumber
    , OrderDate
    , ResellerKey
    , EmployeeKey
    , SalesTerritoryKey
    , OrderQuantity
    , (SalesAmount - TotalProductCost) AS Profitto
FROM 
	factresellersales
WHERE
	(ProductKey BETWEEN 597 AND 598 OR ProductKey = 477 OR ProductKey = 214)
    AND OrderDate >= MAKEDATE(2020, 1); -- MAKEDATE( year, day )