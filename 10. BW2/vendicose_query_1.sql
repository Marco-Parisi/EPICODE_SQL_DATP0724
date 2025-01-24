USE vendicose;

SET @QuantitySold = 25; 
SET @ProductID = 7; -- Da 1 a 10
SET @StoreID = 1; -- Da 1 a 4

-- La CTE CheckDisp controlla le quantità di prodotto disponibili nei magazzini
-- che riforniscono lo store @StoreID. Se la quantità disponibile è minore
-- a quella venduta, la transazione non avviene.
WITH CheckDisp AS
(
	SELECT sp.Quantity
	FROM StockStore AS ss 
	JOIN StockProduct AS sp 
	ON sp.StockID = ss.StockID AND sp.ProductID = @ProductID
	WHERE ss.StoreID = @StoreID AND sp.Quantity >= @QuantitySold
)
SELECT
	CASE 
		WHEN EXISTS (SELECT * FROM CheckDisp LIMIT 1)
        THEN "avvenuta con successo"
        ELSE "prodotto non in magazzino" 
	END AS RisultatoTransazione;


-- La CTE MaxStock restituisce il magazzino che possiede la quantità maggiore di 
-- prodotto acquistato. La query esegue l'update della tabella StockProduct 
-- sottraendo la quantità venduta alla quantità disponibile dal quel magazzino.
WITH MaxStock AS
(
	SELECT ss.StockID 
    FROM StockStore AS ss 
    JOIN StockProduct AS sp 
    ON sp.StockID = ss.StockID AND sp.ProductID = @ProductID 
	WHERE ss.StoreID = @StoreID AND sp.Quantity >= @QuantitySold
	ORDER BY sp.Quantity DESC LIMIT 1
)
UPDATE StockProduct
SET Quantity = Quantity - @QuantitySold
WHERE StockID = (SELECT * FROM MaxStock) AND ProductID = @ProductID;


-- Inserisce la transazione sulla tabella SalesOrder con i valori
-- Data attuale, @StoreID, @ProductID , @QuantitySold.
INSERT INTO SalesOrder (OrderDate, StoreID, ProductID, Quantity)
SELECT 
	NOW()
    , @StoreID
    , @ProductID
    , @QuantitySold
FROM StockStore AS ss
JOIN StockProduct AS sp 
ON sp.StockID = ss.StockID AND sp.ProductID = @ProductID
WHERE ss.StoreID = @StoreID AND sp.Quantity >= @QuantitySold LIMIT 1;
    