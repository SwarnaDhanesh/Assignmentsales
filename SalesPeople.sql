
CREATE TABLE SalesPeople
(
Snum INT PRIMARY KEY,
Sname VARCHAR (255) UNIQUE,
City VARCHAR (255),
Comm DECIMAL (4,2)
);
INSERT INTO SalesPeople (Snum, Sname, City, Comm)
VALUES 
     (1001,'Peel', 'London',0.12),
     (1002,'Serres', 'San Jose', 0.13),
     (1004,'Motika', 'London', 0.11),
     (1007,'Rifkin','Barcelona', 0.15),
     (1003,'Axelrod', 'New York', 0.10);
SELECT * FROM SalesPeople;
SELECT COUNT(*) AS CountOfSalespeople
FROM SalesPeople
WHERE Sname LIKE 'a%' OR 'A%';
SELECT COUNT(*) AS NumberOfSalespeople
FROM SalesPeople
WHERE City = 'New York';
SELECT
(SELECT COUNT(*) FROM SalesPeople WHERE City = 'London') AS NumberOfSalespeopleInLondon,
(SELECT COUNT(*) FROM SalesPeople WHERE City = 'Paris') AS NumberOfSalespeopleInParis;
CREATE DATABASE Customers;
CREATE TABLE Customers
 (
    Cnum INT PRIMARY KEY,
    Cname VARCHAR(255),
    City VARCHAR(255) NOT NULL,
    Snum INT,
    FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);
INSERT INTO Customers (Cnum, Cname, City, Snum)
VALUES 
 (2001, 'Hoffman', 'London', 1001),
 (2002, 'Giovanni', 'Rome', 1003),
 (2003, 'Liu', 'Sanjose', 1002);
 SELECT * FROM Customers;
 CREATE DATABASE Orders;
 CREATE TABLE Orders (
    Onum INT PRIMARY KEY,
    Amt DECIMAL(10, 2),
    Odate DATE,
    Cnum INT,
    Snum INT,
    FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
    FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);
INSERT INTO Orders (Onum, Amt, Odate, Cnum, Snum)
VALUES
    (3001, 18.69, '1990-03-10', 2008, 1007),
    (3003, 767.19, '1990-03-10', 2001, 1001),
    (3002, 1900.10, '1990-03-10', 2007, 1004),
    (3005, 5160.45, '1990-03-10', 2003, 1002),
    (3006, 1098.16, '1990-03-10', 2008, 1007),
    (3009, 1713.23, '1990-04-10', 2002, 1003),
    (3007, 75.75, '1990-04-10', 2004, 1002),
    (3008, 4273.00, '1990-05-10', 2006, 1001),
    (3010, 1309.95, '1990-06-10', 2004, 1002),
    (3011, 9891.88, '1990-06-10', 2006, 1001);

SELECT SP.Snum, SP.Sname
FROM SalesPeople SP
JOIN Orders O ON SP.Snum = O.Snum
GROUP BY SP.Snum, SP.Sname
HAVING SUM(O.Amt) > 2000;
SELECT SP.Snum, SP.Sname, COUNT(O.Onum) AS NumOrders, GROUP_CONCAT(O.Odate) AS OrderDates
FROM SalesPeople SP
LEFT JOIN Orders O ON SP.Snum = O.Snum
GROUP BY SP.Snum, SP.Sname;









