-- PUNTO 1.1
CREATE VIEW Product AS
	SELECT
		p.ProductKey
        ,p.EnglishProductName AS NomeProdotto
        ,s.EnglishProductSubcategoryName AS Sottocategoria
        ,c.EnglishProductCategoryName AS Categoria
	FROM 
		dimproduct AS p
	JOIN
		dimproductsubcategory AS s
	ON
		s.ProductSubcategoryKey = p.ProductSubcategoryKey
	JOIN
		dimproductcategory AS c
	ON
		s.ProductCategoryKey = c.ProductCategoryKey;
        
-- PUNTO 1.2
CREATE VIEW Reseller AS      
	SELECT 
		r.ResellerKey
		,r.ResellerName	AS NomeReseller
        ,g.City	AS Citta
        ,g.EnglishCountryRegionName AS Regione
    FROM
		dimreseller AS r
	JOIN
		dimgeography AS g
	ON
		r.GeographyKey = g.GeographyKey;
        
	
-- PUNTO 1.3
CREATE VIEW Sales AS      
	SELECT 
		f.ResellerKey
        ,f.ProductKey
		,f.OrderDate	AS 'Data'
        ,f.SalesOrderNumber	AS Ordine
        ,f.SalesOrderLineNumber AS DocOrdine
        ,f.OrderQuantity AS Quantita
        ,f.UnitPrice AS Importo
        ,(f.SalesAmount - f.TotalProductCost) AS Profitto
    FROM
		factresellersales AS f
	WHERE
		(f.SalesAmount - f.TotalProductCost) IS NOT NULL;








        