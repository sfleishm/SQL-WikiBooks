SELECT * FROM Products
SELECT * FROM Manufacturers

-- Exercise 1, select names from products
SELECT Name FROM Products;

-- Ex 2, select name and price from products
SELECT Name, Price FROM Products;

-- Ex 3, select name of products with price less than or
-- equal to $200
SELECT Name, Price 
FROM Products 
WHERE Price <= 200;

-- Ex 4, Select all the products with a price between $60 and $120.
SELECT Name, Price 
FROM Products 
WHERE Price >= 60 AND Price <= 120;

-- Ex 5, Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, Price * 100 AS Price_in_cents
FROM Products; 
-- important to add AS to rename it 

-- Ex 6, Compute the average price of all the products
SELECT AVG(Price)
FROM Products;

-- Ex 7, Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price)
FROM Products
WHERE Code = 2
;

-- Ex 8, Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(Products)
FROM Products
WHERE Price >= 180
;

-- Ex 9, Select the name and price of all products with a price larger than or equal to $180, 
-- and sort first by price (in descending order), and then by name (in ascending order).

SELECT Name, Price
FROM Products
WHERE Price >= 180
ORDER BY PRICE DESC, Name
;
-- default for order by is ASC, thats why dont have to add to Name, if i add desc to name
-- monitor and hardware switch 

-- Ex 10, Select all the data from the products, including all the data for each product's manufacturer.
-- SELECT Products.Code, Products.Name, Products.Price, Products.Manufacturer, Manufacturers.name
SELECT p.manufacturer, p.Name, p.Price, p.Manufacturer, m.Name
FROM Products AS p
INNER JOIN Manufacturers AS m ON p.manufacturer = m.Code
;

-- or can do this way 
SELECT * 
FROM Products, Manufacturers
WHERE Products.Manufacturer = Manufacturers.Code
;

-- Ex 11, Select the product name, price, and manufacturer name of all the products.
SELECT p.name, p.price, m.name AS Manufacturer_Name
FROM Products AS p, Manufacturers AS m
WHERE p.Manufacturer = m.code
;

-- Ex 12, Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer
FROM Products AS p
GROUP BY manufacturer
;

-- Ex 13, Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(p.Price), m.name
FROM Products AS p
INNER JOIN Manufacturers AS m ON p.manufacturer = m.Code
GROUP BY m.name
;
-- or
SELECT AVG(p.Price), m.Name
FROM Products AS p, Manufacturers AS m
WHERE p.Manufacturer = m.Code
GROUP BY m.Name;

-- Ex 14, Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(p.Price), m.Name
FROM Products AS p, Manufacturers as m
WHERE p.Manufacturer = m.Code
GROUP BY m.Name
HAVING AVG(p.Price) >= 150
;

-- https://www.w3schools.com/sql/sql_having.asp SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY

-- Ex 15, Select the name and price of the cheapest product.
SELECT Name, Price
FROM Products
WHERE Price = (
	SELECT MIN(Price)
	FROM Products
	)
;
-- can use a nested select statement 

-- Ex 16, Select the name of each manufacturer along with the name and price of its most expensive product
SELECT m.Name, p.Name, p.Price
FROM Products AS p, Manufacturers AS m
WHERE p.Manufacturer = m.Code AND
	p.Price = (
	SELECT MAX(p.Price)
	FROM Products AS p
	WHERE p.Manufacturer = m.Code
	)
;
-- tough nested one, select the columns you want on the first select, then filter your search 
-- in the where statement and the second select -- where you are only selecting max prices

-- Ex 17, Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products(code, name, price, manufacturer)
VALUES (11, 'Loudspeakers', 70, 2)
;
SELECT * FROM Products;
-- https://www.w3schools.com/sql/sql_insert.asp
-- i think if when creating the table schema, i changed code column to an index column 
-- then I wouldnt have to add 11 to the insert, it would automatically know to +1 index

-- Ex 18, Update the name of product 8 to "Laser Printer".
UPDATE Products
SET name = 'Laser Printer'
WHERE code = 8
;
SELECT * FROM Products ORDER BY Code ASC;

-- Ex 19, Apply a 10% discount to all products.
SELECT Price, (Price * .90) AS "10 Percent Discount"
FROM Products
;
-- or, but the bottom will alter all the prices
UPDATE Products   
SET Price = Price - (Price * 0.1);

-- Ex 20, Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products   
SET Price = Price - (Price * 0.1)
WHERE Price >=120
;


