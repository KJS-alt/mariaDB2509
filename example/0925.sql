USE exdb;

SELECT *
FROM customers;
SELECT *
FROM suppliers;

SELECT city
FROM customers
UNION
SELECT city
FROM suppliers
ORDER BY city;

SELECT city, country
FROM customers
WHERE Country = 'Germany'
UNION
SELECT city, country
FROM suppliers
WHERE country = 'Germany'
ORDER BY city;

SELECT 'Customer' AS Type, ContactName, city, country
FROM customers
UNION ALL
SELECT 'Supplier' AS Type, ContactName, city, country
FROM suppliers
ORDER BY ContactName;

SELECT country
FROM customers
GROUP BY country;

SELECT country
FROM customers
GROUP BY country;

SELECT COUNT(CustomerID) AS countryCnt, country
FROM customers
GROUP BY country;

SELECT COUNT(CustomerID) AS countryCnt, country
FROM customers
GROUP BY country
ORDER BY COUNT(CustomerID) DESC;

SELECT *
FROM orders;
SELECT *
FROM shippers;

SELECT s.ShipperName, COUNT(o.OrderID) AS cnt
FROM orders AS o
         LEFT JOIN shippers AS s ON o.ShipperID = s.ShipperID
GROUP BY ShipperName;

SELECT COUNT(customerid), country
FROM customers
GROUP BY Country
HAVING COUNT(customerid) > 5
ORDER BY COUNT(customerid) DESC;

SELECT *
FROM orders;
SELECT *
FROM employees;

SELECT e.LastName, COUNT(o.OrderID) numOrder
FROM orders o
         INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY lastName
HAVING COUNT(o.OrderID) > 100;

SELECT e.LastName, COUNT(o.OrderID) cntOrder
FROM orders o
         INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
WHERE lastName = 'Davolio'
   OR lastName = 'Fuller'
GROUP BY lastName
HAVING COUNT(o.OrderID) > 100;

SELECT *
FROM suppliers;

SELECT *
FROM products;

SELECT SupplierName
FROM suppliers s
WHERE EXISTS(SELECT ProductName
             FROM Products p
             WHERE p.SupplierID = s.SupplierID
               AND price < 20);

SELECT ProductName, price
FROM products
WHERE Price < 20;

SELECT *
FROM suppliers s
WHERE EXISTS(SELECT ProductName
             FROM products p
             WHERE p.SupplierID = s.SupplierID
               AND price = 22)