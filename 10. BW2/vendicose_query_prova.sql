USE vendicose;

START TRANSACTION;

SET @QuantitySold = 5; 
SET @ProductID = 9; -- Da 1 a 10
SET @StoreID = 3; -- Da 1 a 4

INSERT INTO SalesOrder (OrderDate, StoreID, ProductID, Quantity) VALUES
(
	NOW()
	, @StoreID
	, @ProductID
	, @QuantitySold
);

-- CTE che restituisce il magazzino che possiede
-- la quantità maggiore di prodotto acquistato
WITH MaxStock AS
(
	SELECT ss.StockID 
    FROM StockStore AS ss 
    JOIN StockProduct AS sp 
    ON sp.StockID = ss.StockID AND sp.ProductID = @ProductID 
	WHERE ss.StoreID = @StoreID
	ORDER BY sp.Quantity DESC
	LIMIT 1
)
-- Update della tabella StockProduct che tiene traccia delle quantità di prodotto e del restock
UPDATE StockProduct
SET Quantity = Quantity - @QuantitySold
WHERE StockID = (SELECT * FROM MaxStock) AND ProductID = @ProductID;

-- Query per visualizzare i magazzini associati allo @StoreID al @ProductID
-- con le quantità di prodotto e il livello di restock
SELECT s.StockName, s.StockID, p.ProductID, p.ProductName, sp.Quantity, sp.RestockThreshold
FROM StockProduct AS sp
JOIN Product AS p
ON p.ProductID = @ProductID AND sp.ProductID = @ProductID
JOIN Stock as s
ON s.StockID = sp.StockID
WHERE sp.StockID IN (
    SELECT StockID
    FROM StockStore
    WHERE StoreID = @StoreID
);

COMMIT; -- Se la transazione è andata a buon fine
ROLLBACK; -- In caso contrario


-- Query per verificare le soglie di restock per ogni magazzino
SELECT  s.StockName, p.ProductID, p.ProductName, Quantity, RestockThreshold
FROM StockProduct AS sp
JOIN Product AS p
ON p.ProductID = @ProductID AND sp.ProductID = @ProductID
JOIN Stock as s
ON s.StockID = sp.StockID;
-- WHERE Quantity <= RestockThreshold;