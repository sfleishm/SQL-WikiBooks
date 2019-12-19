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

DROP TABLE Manufacturers;
DROP TABLE Products;
