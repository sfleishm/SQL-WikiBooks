## Exercise 1 For WikiBooks SQL 

```SQL

```

* Builds a table schema.
```SQL
CREATE TABLE Manufacturers(
	Code INTEGER,
	Name TEXT,
	PRIMARY KEY (Code)
);

CREATE TABLE Products(
	Code INTEGER,
	Name TEXT,
	Price REAL,
	Manufacturer INTEGER,
	PRIMARY KEY (Code),
	FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
);
```
* Exercise 1, select names from products
```SQL
SELECT Name FROM Products;
```
* Ex 2, select name and price from products
```SQL
SELECT Name, Price FROM Products;
```
* Ex 3, select name of products with price less than or equal to $200
