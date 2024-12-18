USE AdventureWorksDW;

SELECT
	ProductKey
    , EnglishProductName
    , LOWER(EnglishProductName)
    , UPPER(EnglishProductName)
    , RPAD(EnglishProductName, 10, '?') AS NomeModificato
    , ListPrice
    , DealerPrice
-- Operazioni fra due campi numerici
    , ListPrice + DealerPrice 
FROM
	dimproduct;
    

SELECT DISTINCT
	Color
    , EnglishProductName
FROM
	dimproduct
ORDER BY
	EnglishProductName;
    
    
SELECT
	EnglishProductName
FROM
	dimproduct
LIMIT 10;


SELECT
	EnglishProductName
    , ListPrice
FROM
	dimproduct
ORDER BY
	ListPrice DESC, EnglishProductName ASC;
    


SELECT
	EnglishProductName
    , ListPrice
    , StandardCost
    , ListPrice - StandardCost AS GuadagnoNetto
FROM
	dimproduct
ORDER BY
	GuadagnoNetto DESC;
    

SELECT
	EnglishProductName
    , Color
    , ListPrice
    , StandardCost
    , ListPrice - StandardCost AS GuadagnoNetto
FROM
	dimproduct
WHERE
	Color <> 'Red' 
    AND EnglishProductName IS NOT NULL 
ORDER BY
	GuadagnoNetto DESC;
    
SELECT
	EnglishProductName
    , Color
    , ListPrice
    , StandardCost
FROM
	dimproduct
WHERE
	(Color != 'Red' -- Oppure <> 'Red'
    OR
    StandardCost > 100) -- Viene valutata prima la condizione tra parentesi
    AND 
    ListPrice - StandardCost < 150
ORDER BY
	Color DESC;
    
SELECT
	EnglishProductName
    , Color
    , ListPrice
    , StandardCost
FROM
	dimproduct
WHERE
	Color IN ('Red', 'Black')
    AND
    EnglishProductName LIKE '%Road%'
ORDER BY
	Color DESC;