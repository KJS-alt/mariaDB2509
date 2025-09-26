SHOW DATABASES;
USE exdb;

SHOW TABLES;

SELECT * FROM products;
SELECT * FROM orderdetails;

SELECT ProductName
FROM Products
WHERE ProductID = 3;

SELECT ProductName
FROM Products
WHERE ProductID = ANY
(SELECT ProductID
FROM orderdetails
WHERE Quantity = 10);

SELECT ProductID
FROM OrderDetails
WHERE Quantity = 10;

SELECT ProductID
FROM OrderDetails
WHERE Quantity > 99;

SELECT ProductName
FROM Products
WHERE ProductID = 35;

SELECT ProductName
FROM Products
WHERE ProductID = ANY
	(SELECT ProductID
	FROM orderdetails
	WHERE Quantity > 99);
	
SELECT ProductName
FROM Products
WHERE ProductID = ANY
	(SELECT ProductID
	FROM OrderDetails
	WHERE Quantity > 1000);
	
SELECT *
FROM products
WHERE TRUE;

SELECT ALL ProductName
FROM products
WHERE TRUE;

SELECT ALL ProductName
FROM products
WHERE ProductID = ALL
	(SELECT ProductID
	FROM OrderDetails
	WHERE Quantity = 10);
	
-- 고객- 91명 + 29 => 120명
SELECT * FROM customers;
-- 공급업체- 29개
SELECT * FROM suppliers;

INSERT INTO customers(CustomerName, City, Country)
SELECT supplierName, City, Country FROM suppliers;

-- 문법틀림 --
-- SELECT * FROM customers
-- WHERE Customerid = 'null';

-- 문법맞음 --
SELECT * FROM customers
WHERE CustomerID IS NULL;

INSERT INTO customers
	(CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT
	SupplierName, ContactName, Address, City, PostalCode, Country
FROM Suppliers;

-- 고객 - 91명 + 29 ==> 120명 + 29 ==> 149명

-- 공급업체 - 29개
SELECT * FROM suppliers;

INSERT INTO customers (CustomerName, City, Country)
SELECT SupplierName, City, Country
FROM suppliers
WHERE Country='Germany';

-- 고객 - 91명 + 29 ==> 120명 + 20 ==> 149명 + 3명 ==> 152명
SELECT * FROM customers;
-- 공급업체 - 29개
SELECT * FROM suppliers;

-- 공급상제- 2,155개
SELECT * FROM orderdetails;

SELECT OrderID, Quantity,
CASE
 WHEN Quantity > 30 THEN '30보다 큰 값'
 WHEN Quantity = 30 THEN '수량 30과 같다'
 ELSE '> 30'
END AS 수량표현
FROM orderdetails;


SELECT CustomerName, City, Country
FROM customers
ORDER BY
(case
	when city IS NULL then country
	ELSE city
	END);
	
SELECT * FROM products;
DESC products;

SELECT * FROM customers;

--IFNULL
SELECT customerid, IFNULL(contactName, '널이야~') 'contactName'
FROM customers;

--COALESCE
SELECT customerid, COALESCE(address, '주소는 널') 'address'
FROM customers;

--테이블생성------ create table
--테이블삭제------ drop table
--테이블변경------ alter table

--레코드추가------ insert into
--레코드삭제------ delete
--레코드(필드)---- update

CREATE TABLE Persons (
	PersonID INT,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255)
	);
SELECT * FROM Persons;

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

CREATE TABLE TestTable2 AS
SELECT customername, contactname
FROM customers;

SELECT * FROM TestTable;
SELECT * FROM TestTable2;

--테이블삭제돼서 없음
DROP TABLE TestTable;
SELECT * FROM TestTable;

--레코드삭제(테이블은 남음):테이블초기화
TRUNCATE TABLE TestTable2;
SELECT * FROM TestTable2;

--
SELECT * FROM Persons;
DESC Persons;
SELECT * FROM customers;
DESC customers;

ALTER TABLE customers
ADD Email VARCHAR(255);
DESC customers;

ALTER TABLE customers
DROP COLUMN Email;
DESC customers;

--
SELECT * FROM Persons;
DESC Persons;

ALTER TABLE Persons
ADD DateOfBirth DATE;
DESC Persons;


ALTER TABLE Persons
MODIFY COLUMN DateOfBirth YEAR;
DESC Persons;

ALTER TABLE Persons
DROP COLUMN DateOfBirth;
DESC Persons;