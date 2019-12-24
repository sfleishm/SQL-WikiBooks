CREATE TABLE Departments(
	Code INTEGER,
	Name TEXT, 
	Budget REAL, 
	
	PRIMARY KEY (Code)
);

CREATE TABLE Employees(
	SSN INTEGER,
	Name TEXT, 
	LastName TEXT,
	Department INTEGER,
	
	PRIMARY KEY (SSN),
	FOREIGN KEY (Department) REFERENCES Departments (Code)
);

DROP TABLE Departments;
DROP TABLE Employees;