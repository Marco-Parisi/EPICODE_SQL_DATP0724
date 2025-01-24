USE vendicose;

SET @QuantitySold = 25; 
SET @ProductID = 7; -- Da 1 a 10
SET @StoreID = 1; -- Da 1 a 4

-- Query per visualizzare i magazzini associati allo @StoreID al @ProductID
-- con le quantità di prodotto e il livello di restock
SELECT 
	st.StoreName AS Negozio
	, s.StockName AS Magazzino
    , p.ProductName AS Prodotto
    , sp.Quantity AS Quantità
    , sp.RestockThreshold AS Soglia
FROM 
	StockProduct AS sp
JOIN 
	Product AS p
ON 
	p.ProductID = @ProductID AND sp.ProductID = @ProductID
JOIN 
	Stock as s
ON 
	s.StockID = sp.StockID
JOIN 
	Store as st
ON 
	st.StoreID = @StoreID
WHERE sp.StockID IN (SELECT StockID FROM StockStore WHERE StoreID = @StoreID)
ORDER BY sp.Quantity ASC;