-- ===========================================
-- ========= TASK 2 Implementazione ==========
-- ===========================================

DROP SCHEMA IF EXISTS toysgroup;

CREATE SCHEMA toysgroup;

USE toysgroup;

-- Creazione tabella: Category
CREATE TABLE Category(
CategoryID INT PRIMARY KEY
, Name VARCHAR(25)
);

-- Creazione tabella: Product
CREATE TABLE Product(
ProductID INT PRIMARY KEY
, CategoryID INT
, Name VARCHAR(40)
, Price DECIMAL(6,2)
, CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
);

-- Creazione tabella: Region
CREATE TABLE Region(
RegionID INT PRIMARY KEY
, Name VARCHAR(25)
);

-- Creazione tabella: State
CREATE TABLE State(
StateID INT PRIMARY KEY
, RegionID INT
, Name VARCHAR(25)
, CONSTRAINT FK_STATEREGION FOREIGN KEY (RegionID) REFERENCES Region (RegionID)
);

-- Creazione tabella: Sales
CREATE TABLE Sales(
SalesID INT PRIMARY KEY AUTO_INCREMENT
, ProductID INT
, StateID INT
, OrderDate DATETIME
, Quantity INT
, OrderNum VARCHAR(10)
, CONSTRAINT FK_REGION_SALES FOREIGN KEY (StateID) REFERENCES State (StateID)
, CONSTRAINT FK_PRODUCT_SALES FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

-- =======================================
-- ========= TASK 3 Popolamento ==========
-- =======================================

-- Popolamento della tabella Category
INSERT INTO Category (CategoryID, Name) VALUES
(1, 'Action Figures'),
(2, 'Dolls'),
(3, 'Board Games'),
(4, 'Puzzle'),
(5, 'Toy Cars'),
(6, 'Educational Toys');

-- Popolamento della tabella Product
INSERT INTO Product (ProductID, CategoryID, Name, Price) VALUES
(1, 1, 'Superman Action Figure', 19.99),
(2, 1, 'Batman Action Figure', 22.99),
(3, 2, 'Barbie Doll', 14.99),
(4, 2, 'Ken Doll', 12.99),
(5, 3, 'Monopoly', 24.99),
(6, 3, 'Scrabble', 19.99),
(7, 4, '500-piece Puzzle', 9.99),
(8, 4, '1000-piece Puzzle', 14.99),
(9, 5, 'Hot Wheels Car', 5.99),
(10, 5, 'Matchbox Car', 6.49),
(11, 6, 'Learning ABC Blocks', 12.99),
(12, 6, 'Shape Sorter Toy', 10.99),
(13, 1, 'Iron Man Action Figure', 21.99),
(14, 1, 'Spider-Man Action Figure', 19.49),
(15, 3, 'Clue', 17.99),
(16, 3, 'Risk', 23.99),
(17, 5, 'RC Sports Car', 29.99),
(18, 5, 'Diecast Car Set', 34.99),
(19, 1, 'Wonder Woman Action Figure', 24.99),
(20, 1, 'Captain America Action Figure', 22.49),
(21, 3, 'The Game of Life', 18.49),
(22, 3, 'Battleship', 16.99),
(23, 5, 'Classic Toy Car', 8.99),
(24, 5, 'Race Car Set', 14.49),
(25, 5, 'Vintage Toy Car', 11.99),
(26, 5, 'Toy Car Garage', 19.99),
(27, 5, 'Pull-Back Toy Car', 7.49),
(28, 5, 'Convertible Toy Car', 15.99),
(29, 5, 'Off-Road Toy Car', 18.99),
(30, 5, 'Police Car Toy', 12.99);

-- Popolamento della tabella Region
INSERT INTO Region (RegionID, Name) VALUES
(1, 'Europe'),
(2, 'North America'),
(3, 'South America'),
(4, 'Oceania'),
(5, 'Asia'),
(6, 'Africa');

-- Popolamento della tabella State
INSERT INTO State (StateID, RegionID, Name) VALUES
(1, 1, 'Italy'),
(2, 1, 'France'),
(3, 1, 'Germany'),
(4, 1, 'Spain'),
(5, 2, 'United States'),
(6, 2, 'Canada'),
(7, 3, 'Brazil'),
(8, 3, 'Argentina'),
(9, 4, 'Australia'),
(10, 4, 'New Zealand'),
(11, 1, 'United Kingdom'),
(12, 1, 'Norway'),
(13, 1, 'Sweden'),
(14, 1, 'Denmark'),
(15, 5, 'Japan'),
(16, 5, 'China'),
(17, 5, 'India'),
(18, 6, 'South Africa'),
(19, 6, 'Nigeria'),
(20, 6, 'Egypt'),
(21, 2, 'Mexico'),
(22, 3, 'Colombia'),
(23, 3, 'Chile'),
(24, 2, 'Cuba'),
(25, 2, 'Jamaica'),
(26, 4, 'Fiji'),
(27, 4, 'Papua New Guinea'),
(28, 1, 'Netherlands'),
(29, 1, 'Belgium'),
(30, 1, 'Austria');


-- Popolamento della tabella Sales
INSERT INTO Sales (SalesID, ProductID, StateID, OrderDate, Quantity, OrderNum) VALUES
(1, 11, 19, '2023-02-24 10:00:00', 150, '12O3456'),
(2, 12, 22, '2023-02-25 11:30:00', 180, '34P5678'),
(3, 13, 4, '2023-02-26 12:45:00', 110, '56Q7890'),
(4, 14, 6, '2023-02-27 14:00:00', 160, '78R1234'),
(5, 5, 17, '2023-02-28 15:30:00', 120, '90S2345'),
(6, 6, 13, '2023-03-01 09:15:00', 140, '12T3456'),
(7, 17, 7, '2023-03-02 16:30:00', 150, '34U5678'),
(8, 18, 12, '2023-03-03 17:00:00', 110, '56V7890'),
(9, 19, 24, '2023-03-04 18:15:00', 160, '78W1234'),
(10, 3, 23, '2022-12-10 19:45:00', 120, '45N9347'),
(11, 11, 8, '2022-12-11 10:00:00', 150, '84O2376'),
(12, 12, 12, '2022-12-12 11:30:00', 140, '29P5634'),
(13, 3, 4, '2022-12-13 12:45:00', 160, '51Q4728'),
(14, 4, 25, '2022-12-14 14:00:00', 130, '68R9543'),
(15, 5, 1, '2022-12-15 15:30:00', 170, '12S8734'),
(16, 6, 27, '2022-12-16 09:15:00', 150, '74T9328'),
(17, 17, 3, '2022-12-17 16:30:00', 120, '38U2941'),
(18, 18, 22, '2022-12-18 17:00:00', 180, '57V8432'),
(19, 9, 6, '2022-12-19 18:15:00', 130, '91W7346'),
(20, 10, 19, '2022-12-20 19:45:00', 150, '25X9631'),
(21, 12, 8, '2023-01-18 14:00:00', 120, '78D9012'),
(22, 25, 30, '2023-01-19 15:30:00', 80, '90E1234'),
(23, 7, 22, '2023-01-20 09:15:00', 110, '12F3556'),
(24, 15, 17, '2023-01-21 16:30:00', 90, '34G5678'),
(25, 20, 3, '2023-02-22 10:45:00', 130, '56H7890'),
(26, 10, 26, '2023-03-10 12:15:00', 70, '78I9012'),
(27, 18, 12, '2023-04-15 14:30:00', 140, '90J1234'),
(28, 13, 5, '2023-05-20 16:00:00', 180, '12K2356'),
(29, 18, 29, '2023-06-05 09:30:00', 160, '34L5678'),
(30, 19, 4, '2023-07-10 11:00:00', 140, '56M7890'),
(31, 24, 11, '2023-08-25 14:30:00', 100, '78N9012'),
(32, 5, 19, '2023-09-30 15:00:00', 190, '90O1234'),
(33, 14, 7, '2023-10-10 09:15:00', 110, '12P3426'),
(34, 30, 21, '2023-11-05 12:45:00', 180, '34Q5678'),
(35, 6, 2, '2023-12-01 15:30:00', 160, '56R7190'),
(36, 11, 18, '2024-01-10 14:00:00', 130, '78S9012'),
(37, 13, 16, '2024-02-15 10:00:00', 140, '90T1234'),
(38, 29, 25, '2024-03-20 11:30:00', 150, '12U3456'),
(39, 18, 6, '2024-04-25 13:15:00', 170, '34V5678'),
(40, 12, 13, '2024-05-30 15:45:00', 160, '56W7890'),
(41, 22, 28, '2024-06-20 16:30:00', 200, '78X9012'),
(42, 11, 15, '2024-07-15 10:30:00', 110, '90Y1234'),
(43, 14, 27, '2024-08-05 13:00:00', 140, '12Z3456'),
(44, 26, 20, '2024-09-01 15:00:00', 120, '34A5678'),
(45, 19, 30, '2024-10-10 11:45:00', 150, '56B7891'),
(46, 17, 8, '2024-11-20 13:30:00', 90, '78C9012'),
(47, 21, 9, '2024-12-05 16:00:00', 130, '90D1234'),
(48, 6, 14, '2024-12-10 09:00:00', 140, '12E5678'),
(49, 23, 11, '2024-12-15 13:30:00', 120, '34F7890'),
(50, 27, 2, '2024-12-20 15:45:00', 290, '56G9012'),
(51, 21, 11, '2024-12-25 10:00:00', 150, '78H2345'),
(52, 22, 13, '2024-12-26 12:15:00', 160, '34I5678'),
(53, 13, 18, '2024-12-27 14:30:00', 140, '56J8912'),
(54, 24, 19, '2024-12-28 16:45:00', 170, '78K2346'),
(55, 5, 22, '2024-12-29 09:00:00', 130, '90L3457'),
(56, 18, 26, '2024-12-30 11:15:00', 120, '12M4568'),
(57, 17, 9, '2024-12-31 13:30:00', 180, '34N5679'),
(58, 18, 23, '2025-01-01 15:45:00', 150, '56O6780'),
(59, 2, 5, '2025-01-02 17:00:00', 130, '78P7891'),
(60, 18, 12, '2025-01-03 19:30:00', 160, '90Q8902');


-- ====================================
-- =========== TASK 4 Query ===========
-- ====================================
USE toysgroup;

-- 1) verifica dei valri univoci per le PRK di ogni tabella,
--    se la query non restituisce valori la PK è univoca.

-- Tabella Category
SELECT 
	CategoryID
    , COUNT(*)
FROM 
	Category
GROUP BY 
	CategoryID
HAVING 
	COUNT(*) > 1;

-- Tabella Product
SELECT 
	ProductID
	, COUNT(*)
FROM 
	Product
GROUP BY 
	ProductID
HAVING 
	COUNT(*) > 1;

-- Tabella Region
SELECT 
	RegionID
	, COUNT(*)
FROM 
	Region
GROUP BY 
	RegionID
HAVING 
	COUNT(*) > 1;

-- Tabella State
SELECT 
	StateID
	, COUNT(*)
FROM 
	State
GROUP BY 
	StateID
HAVING 
	COUNT(*) > 1;

-- Tabella Sales
SELECT 
	SalesID
    , COUNT(*)
FROM 
	Sales
GROUP BY 
	SalesID
HAVING 
	COUNT(*) > 1;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 2)
SELECT 
	s.OrderNum
    , s.OrderDate
    , p.Name AS ProductName
    , c.Name AS CategoryName
    , st.Name AS StateName
    , r.Name AS RegionName
    , CASE WHEN DATEDIFF(NOW(), s.OrderDate) > 180 THEN 'True' ELSE 'False' END AS 'Is180DaysOlder'
FROM
	Sales AS s
JOIN
	Product AS p
ON
	s.ProductID = p.ProductID
JOIN
	Category AS c
ON
	c.CategoryID = p.CategoryID
JOIN 
	State AS st
ON 
	s.StateID = st.StateID
JOIN 
	Region AS r 
ON 
	r.RegionID = st.RegionID;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 3)
-- Definisco una CTE per la quantità media dei prodotti venduti per l'ultimo anno
WITH AvgQuantityLastYear AS
	(
		WITH LastYear AS
			(
				SELECT s.OrderDate
				FROM Sales AS s 
				ORDER BY s.OrderDate DESC 
                LIMIT 1
			)
		SELECT AVG(s.Quantity)
		FROM Sales AS s 
		WHERE YEAR(s.OrderDate) = YEAR((SELECT * FROM LastYear))
	) 
-- SELECT * FROM AvgQuantityLastYear; -- per debug
SELECT 
	s.ProductID
    , SUM(s.Quantity) AS TotQuantity
FROM 
	Sales AS s
WHERE 
	s.Quantity > (SELECT * FROM AvgQuantityLastYear)
GROUP BY
	s.ProductID
ORDER BY
	TotQuantity DESC;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 4)
SELECT
	p.Name AS ProductName
	, (SUM(s.Quantity) * p.Price) AS FactTot
	, YEAR(s.OrderDate) AS FactYear
FROM
	Sales AS s
JOIN
	Product AS p
ON
	p.ProductID = s.ProductID
GROUP BY 
	YEAR(s.OrderDate)
    , p.ProductID
ORDER BY
    YEAR(s.OrderDate)
	, FactTot DESC;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 5)
SELECT
	st.Name AS StateName
	, (SUM(s.Quantity * p.Price)) AS FactTot
	, YEAR(s.OrderDate) AS FactYear
FROM
	Sales AS s
JOIN
	State AS st
ON
	st.StateID = s.StateID
JOIN
	Product AS p
ON
	p.ProductID = s.ProductID
GROUP BY 
	YEAR(s.OrderDate)
    , st.Name
ORDER BY
	YEAR(s.OrderDate) DESC
    , FactTot DESC;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 6)
SELECT
	c.Name AS CategoryName
	, SUM(s.Quantity) AS TotQuantity
FROM
	Sales AS s
JOIN
	Product AS p
ON
	p.ProductID = s.ProductID
JOIN
	Category AS c
ON
	c.CategoryID = p.CategoryID
GROUP BY
	p.CategoryID
ORDER BY
	TotQuantity DESC;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 7)
-- approccio 1 (subquery)
SELECT
    p.ProductID
    , p.Name AS ProductName
FROM
    Product AS p
WHERE
    p.ProductID NOT IN (SELECT s.ProductID FROM Sales AS s);
    
-- approccio 2 (join)
SELECT
	p.ProductID
	, p.Name AS ProductName
FROM
	Sales AS s
RIGHT JOIN
	Product AS p
ON
	p.ProductID = s.ProductID
WHERE
	s.ProductID IS NULL;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 8)
CREATE VIEW ProductInfo AS
	(
		SELECT
			p.ProductID
			, p.Name AS ProductName
			, c.Name AS CategoryName
		FROM
			Product AS p
		JOIN
			Category AS c
		ON
			c.CategoryID = p.CategoryID
		ORDER BY
			c.Name
            , p.Name
	);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 9)
CREATE VIEW TerritoryInfo AS
	(
		SELECT
			st.StateID
			, st.Name AS StateName
			, r.Name AS RegionName
		FROM
			State AS st
		JOIN
			Region AS r
		ON
			st.RegionID = r.RegionID
		ORDER BY
			r.Name
			, st.Name
	);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
