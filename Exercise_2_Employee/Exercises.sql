SELECT * FROM Departments;
SELECT * FROM Employees;

-- Ex 1: Select the last name of all employees.
SELECT LastName 
FROM Employees
;

-- EX 2: Select the last name of all employees, without duplicates.
SELECT DISTINCT LastName
FROM Employees
;

-- Ex 3: Select all the data of employees whose last name is "Smith".
SELECT * 
FROM Employees
WHERE LastName = 'Smith'
;

-- Ex 4: Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * 
FROM Employees
WHERE LastName = 'Smith' OR LastName = 'Doe'
;
-- can use IN ('Smith' , 'Doe'); instead of OR

-- Ex 5: Select all the data of employees that work in department 14.
SELECT * 
FROM Employees
WHERE Department = 14
;

-- Ex 6: Select all the data of employees that work in department 37 or department 77.
SELECT * 
FROM Employees
WHERE Department IN (37, 77)
;
-- using the in method

-- Ex 7: Select all the data of employees whose last name begins with an "S".
SELECT * 
FROM Employees
WHERE LastName LIKE 'S%'
;
-- more reading https://www.w3schools.com/sql/sql_like.asp

-- Ex 8: Select the sum of all the departments' budgets.
SELECT SUM(Budget)
FROM Departments
;

-- Ex 9: Select the number of employees in each department (you only need to show the department code and the number of employees).



