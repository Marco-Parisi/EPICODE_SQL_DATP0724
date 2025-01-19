
SELECT
	*
FROM
	dimcustomer
LIMIT 2;

START TRANSACTION;

UPDATE 
	dimcustomer
SET 
	LastName = "Cena"
WHERE
	CustomerKey = 11000;
    
ROLLBACK; -- su MySQL non funziona su ALTER TABLE https://dev.mysql.com/doc/refman/8.4/en/implicit-commit.html

COMMIT;

-- AUTO_INCREMENT -- Da inserire nelle note