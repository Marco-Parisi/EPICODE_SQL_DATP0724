DROP SCHEMA IF EXISTS vendicose;
CREATE SCHEMA vendicose;
USE vendicose;

-- Creazione tabella Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY
    , CategoryName VARCHAR(50)
);

-- Creazione tabella Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY
    , CategoryID INT
    , ProductName VARCHAR(100)
    , UnitPrice DECIMAL(8, 2)
    , CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Creazione tabella Stock
CREATE TABLE Stock (
    StockID INT PRIMARY KEY
    , StockName VARCHAR(100)
);

-- Creazione tabella StockProduct
CREATE TABLE StockProduct (
    StockID INT
    , ProductID INT
    , Quantity INT
    , RestockThreshold INT
    , CONSTRAINT PK_StockProduct PRIMARY KEY (StockID, ProductID)
    , CONSTRAINT FK_StockProduct_Stock FOREIGN KEY (StockID) REFERENCES Stock(StockID)
    , CONSTRAINT FK_StockProduct_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Creazione tabella Store
CREATE TABLE Store (
    StoreID INT PRIMARY KEY
    , StoreName VARCHAR(100)
    , Address VARCHAR(200)
);

-- Creazione tabella StockStore
CREATE TABLE StockStore (
    StockID INT
    , StoreID INT
    , CONSTRAINT PK_StockStore PRIMARY KEY (StockID, StoreID)
    , CONSTRAINT FK_StockStore_Stock FOREIGN KEY (StockID) REFERENCES Stock(StockID)
    , CONSTRAINT FK_StockStore_Store FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

-- Creazione tabella SalesOrder
CREATE TABLE SalesOrder (
    SalesOrderID INT PRIMARY KEY AUTO_INCREMENT
    , OrderDate DATETIME
    , StoreID INT
    , ProductID INT
    , Quantity INT
    , CONSTRAINT FK_SalesOrder_Store FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
    , CONSTRAINT FK_SalesOrderDetail_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Popolamento tabella Category
INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, 'Alimentari'),
(2, 'Cosmetica'),
(3, 'Elettronica'),
(4, 'Giocattoli'),
(5, 'Abbigliamento');

-- Popolamento tabella Product
INSERT INTO Product (ProductID, CategoryID, ProductName, UnitPrice) VALUES
(1, 1, 'Pasta', 1.50),
(2, 1, 'Olio', 8.00),
(3, 2, 'Rossetto', 10.00),
(4, 2, 'Smalto', 5.00),
(5, 3, 'Smartphone', 300.00),
(6, 3, 'Laptop', 800.00),
(7, 4, 'Lego Set', 50.00),
(8, 4, 'Puzzle', 15.00),
(9, 5, 'Maglietta', 30.00),
(10, 5, 'Pantaloni', 50.00);

-- Popolamento tabella Stock
INSERT INTO Stock (StockID, StockName) VALUES
(1, 'Magazzino Nord'),
(2, 'Magazzino Sud'),
(3, 'Magazzino Est'),
(4, 'Magazzino Ovest');

-- Popolamento tabella StockProduct
INSERT INTO StockProduct (StockID, ProductID, Quantity, RestockThreshold) VALUES
(1, 1, 100, 20), 	-- Magazzino 1 -------
(1, 2, 100, 10), 	-- contiene
(1, 3, 20, 5),		-- Alimentari
(1, 4, 25, 5),		-- e Cosmetica
(2, 5, 30, 15),		-- Magazzino 2 -------
(2, 6, 15, 5),		-- contiene
(2, 7, 25, 15),		-- Elettronica
(2, 8, 20, 5),		-- e Giocattoli
(3, 7, 125, 50),	-- Magazzino 3 -------
(3, 8, 100, 20),	-- contiene Giocattoli
(4, 3, 10, 5),		-- Magazzino 4 -------
(4, 4, 20, 8),		-- contiene
(4, 9, 80, 40),		-- Giocattoli
(4, 10, 90, 30);	-- e Abbigliamento

-- Popolamento tabella Store
INSERT INTO Store (StoreID, StoreName, Address) VALUES
(1, 'Negozio Milano', 'Via Roma, 1, Milano'),
(2, 'Negozio Napoli', 'Via Partenope, 10, Napoli'),
(3, 'Negozio Torino', 'Corso Vittorio, 12, Torino'),
(4, 'Negozio Firenze', 'Piazza Duomo, 5, Firenze');

-- Popolamento tabella StockStore
INSERT INTO StockStore (StockID, StoreID) VALUES
(4, 1),
(2, 1),
(3, 1),
(2, 2),
(4, 2),
(3, 3),	
(4, 3),
(1, 4);
