CREATE DATABASE lezione2sql;

USE lezione2sql;

CREATE TABLE Product 
( 
	ProductID INT PRIMARY KEY, 
    CategoryID INT,
    ProductName VARCHAR(50), 
    ListPrice DECIMAL(7,2)
);

CREATE TABLE Category 
( 
	CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(25)
);

INSERT INTO 
	Product (ProductID, CategoryID, ProductName, ListPrice) 
VALUES 
	(1, 1, 'Pastascuitta', 3.44);
    
INSERT INTO 
	Product
VALUES 
	(2, 1, 'Caffè', 9.99),
	(3, 1, 'Sapone', 4.00);

SELECT * FROM product;

INSERT INTO 
	Category
VALUES
	(1, 'Alimentari'),
    (2, 'Igiene');
    
SELECT * FROM Category;

ALTER TABLE 
	Product
ADD CONSTRAINT FOREIGN KEY 
	(CategoryID) 
REFERENCES 
	Category (CategoryID);

DROP TABLE Product, Category;

CREATE TABLE Category 
( 
	CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(25)
);

CREATE TABLE Product 
( 
	ProductID INT PRIMARY KEY, 
    CategoryID INT,
    ProductName VARCHAR(50), 
    ListPrice DECIMAL(7,2),
    CONSTRAINT PK_Product PRIMARY KEY (ProductID)
    -- CONSTRAINT FK_Product FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
);

