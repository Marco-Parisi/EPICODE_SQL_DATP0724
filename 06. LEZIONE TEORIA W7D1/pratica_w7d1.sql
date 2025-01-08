-- PUNTO 1.1
SELECT
	KC.COLUMN_NAME
FROM 
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC -- Elenca tutte le constraint nel database 
JOIN 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KC -- Le colonne a cui è assegnata una KEY
ON
	KC.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
WHERE
	KC.TABLE_NAME = "dimproduct" AND TC.TABLE_NAME = "dimproduct" AND TC.CONSTRAINT_TYPE = "PRIMARY KEY";

-- PUNTO 1.1 (ALTERNATIVA)
SELECT 
    COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    TABLE_NAME = 'dimproduct' AND CONSTRAINT_NAME = 'PRIMARY';
    


-- PUNTO 1.2
SELECT 
    COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    TABLE_NAME = 'factresellersales' AND CONSTRAINT_NAME = 'PRIMARY';
    
    

-- PUNTO 1.3
SELECT
	COUNT(SalesOrderLineNumber)
FROM
	factresellersales
WHERE
	OrderDate > DATE("2020-1-1");
    

-- PUNTO 1.4
SELECT
	p.EnglishProductName AS NomeProdotto
	,SUM(f.SalesAmount) AS TotFatt
	,SUM(f.OrderQuantity) AS TotQuant
    ,round(AVG(f.UnitPrice),2) AS PrezzoMedio
FROM
	factresellersales AS f
JOIN
	dimproduct AS p
ON
	p.ProductKey = f.ProductKey
WHERE
	f.OrderDate > DATE("2020-1-1")
GROUP BY
	NomeProdotto
ORDER BY
	NomeProdotto;



-- PUNTO 2.1
SELECT
	-- p.EnglishProductName AS NomeProdotto,
    c.EnglishProductCategoryName AS Categoria
	,SUM(f.SalesAmount) AS TotFatt
	,SUM(f.OrderQuantity) AS TotQuant
    ,round(AVG(f.UnitPrice),2) AS PrezzoMedio
FROM
	factresellersales AS f
JOIN
	dimproduct AS p
ON
	p.ProductKey = f.ProductKey
JOIN
	dimproductsubcategory AS s
ON
	p.ProductSubcategoryKey = s.ProductSubcategoryKey
JOIN
	dimproductcategory AS c
ON
	s.ProductCategoryKey = c.ProductCategoryKey
-- WHERE f.OrderDate > DATE("2020-1-1")
GROUP BY
	Categoria
ORDER BY
	Categoria;



-- PUNTO 2.2
SELECT
	g.City AS Citta
	,SUM(f.SalesAmount) AS TotFatt
FROM
	factresellersales AS f
JOIN
	dimgeography AS g
ON 
	f.SalesTerritoryKey = g.SalesTerritoryKey
WHERE 
	f.OrderDate > DATE("2020-1-1")
GROUP BY
	Citta
HAVING 
	TotFatt > 60000
ORDER BY
	Citta;



