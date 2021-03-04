USE MASTER
GO 
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'Shopping')
BEGIN
RAISERROR('Dropping existing Shopping database ...', 0,1)
DROP DATABASE Shopping
END
GO

CREATE DATABASE Shopping
GO
USE Shopping
GO

--Category table
CREATE TABLE tblCategory
(
    categoryID SMALLINT PRIMARY KEY,
    categoryName VARCHAR(50) NOT NULL,
)

--Product table
CREATE TABLE tblProduct
(
    productID INT PRIMARY KEY,
    productName VARCHAR(50) NOT NULL,
    price MONEY NOT NULL, 
    categoryID SMALLINT NOT NULL FOREIGN KEY REFERENCES tblCategory(categoryID)
)

--Customer table
CREATE TABLE tblCustomer
(
    customerID INT PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
)

--Sales table
CREATE TABLE tblSales
(
    salesID INT NOT NULL IDENTITY PRIMARY KEY,
    productID INT NOT NULL FOREIGN KEY REFERENCES tblProduct(productID),
    customerID INT NOT NULL FOREIGN KEY REFERENCES tblCustomer(customerID),
    saleDate DATETIME NOT NULL,
    quantitySold INT NOT NULL,
    salesAmount MONEY NOT NULL,
    deliveryDate DATETIME NOT NULL,
)
GO

--Inserting data

INSERT INTO tblCategory VALUES
(101, 'Stationary'),
(102, 'Detergents'),
(103, 'Personal Care'),
(104, 'Food and Bevarages'),
(105, 'Furniture'),
(106, 'Mobile Phones'),
(107, 'Home & Kitchen'),
(108, 'Computers'),
(109, 'Vitamins'),
(110, 'Electronics'),
(111, 'Cloths'),
(112, 'Toys'),
(113, 'Sports'),
(114, 'Books'),
(115, 'Pet food'),
(116, 'Grocery'),
(118, 'Laptops');
GO

INSERT INTO tblProduct VALUES
(1, 'Pen', 5, 101),
(2, 'Pencil', 5, 101),
(3, 'Marker', 5, 101),
(4, 'Tide', 11, 102),
(5, 'Bingo', 11, 102),
(6, 'Purex', 11, 102),
(7, 'Hair Brush', 7, 103),
(8, 'Hair Treatment Oil', 15, 103),
(9, 'Tail Comb', 12, 103),
(10, 'Vacuum food bags', 9, 104),
(11, 'Vacuum food sealers', 12, 104),
(12, 'Naan Bread', 1, 104),
(13, 'Fax', 6, 102),
(14, 'Garden Scissors', 15, 107),
(15, 'Chairs', 111, 105),
(16, 'Potting table', 125, 107),
(17, 'Scissors Set', 35, 107),
(18, 'Delux', 9, 102),
(19, 'Ice Cream', 3, 104),
(20, 'Marmalade', 9, 104),
(21, 'White Bread', 0.5, 104),
(22, 'Orange jam', 10, 104),
(23, 'Nut cream', 15, 104),
(24,'Ruler', 4, 101),
(25, 'Toshiba', 200, 108),
(26, 'B-Vitamins', 15, 109),
(27, 'Multi-Vitamins', 15, 109),
(28, 'Vitamin C', 13, 109),
(29, 'VitaFusion', 25, 109),
(30, 'Airborne', 20, 109),
(31, 'B-Complex', 16, 109),
(32, 'Nike', 120, 113),
(33, 'Adidas', 200, 113),
(34, 'Kinetix', 90, 113),
(35, 'Reebok', 85, 113),
(36, 'Puma', 80, 113),
(37, 'Skechers', 210, 113),
(38, 'Converse', 120, 113),
(39, 'Dell', 780, 108),
(40, 'Samsung', 380, 106),
(41, 'Apple', 1100, 106),
(42, 'Asus', 650, 108),
(43, 'LG', 860, 108),
(44, 'HP', 580, 108),
(45, 'Lenovo', 760, 108),
(46, 'Acer', 500, 108),
(47, 'Sony', 400, 108),
(48, 'Gateway', 330, 108),
(49, 'LG', 470, 106),
(50, 'Huawei', 400, 106);
GO

insert into tblCustomer values (1, 'Hasan Tas', 'Istanbul')
insert into tblCustomer values (2, 'Igor Kuluyev', 'Moscow')
insert into tblCustomer values (3, 'Resul Tilekev', 'Bishkek')
insert into tblCustomer values (4, 'Pasew Khalil', 'Hyderabad')
insert into tblCustomer values (5, 'John Brown', 'Dallas')
insert into tblCustomer values (6, 'Vimala Rony', 'Baltimore')
insert into tblCustomer values (7, 'Mehmet Er', 'Antalya')
insert into tblCustomer values (8, 'Fehmi Koparan', 'Istanbul')
insert into tblCustomer values (9, 'Rasim Sanli', 'Antalya')
insert into tblCustomer values (10, 'Ruslan Kamilov', 'Kazan')
insert into tblCustomer values (11, 'Tom Chans', 'Dallas')
insert into tblCustomer values (12, 'Kamil Kandayev', 'Bishkek')

GO

INSERT INTO tblSales VALUES 
(1,1, '2012/07/03',245,245*5,'2012/07/10'),
(2,2, '2012/07/05',349,349*5,'2012/07/14'),
(8,1, '2012/08/01',9873,9873*5,'2012/08/08'),
(13,5, '2013/01/02',566,566*11,'2013/01/07'),
(14,7, '2013/01/04',120,120*30,'2013/01/07'),

(12,4, '2013/03/13',55,55*1,'2013/03/15'),
(11,9, '2013/04/12',120,120*55,'2013/04/15'),
(4,10, '2013/04/20',200,200*40,'2013/04/26'),
(5,7, '2013/05/13',77,77*30,'2013/05/22'),
(8,1, '2013/03/13',100,100*5,'2013/03/15'),
(9,5, '2013/04/12',150,150*55,'2013/04/15'),
(15,12, '2013/04/20',160,160*40,'2013/04/26'),
(14,9, '2013/05/13',450,450*30,'2013/05/22'),
(11,10, '2013/03/13',175,175*12,'2013/03/15'),
(3,12, '2013/04/12',540,540*55,'2013/04/15'),
(1,10, '2013/04/20',330,330*40,'2013/04/26'),
(12,5, '2013/05/13',668,668*11,'2013/05/22'),

(2,3, '2014/03/13',230,230*5,'2014/03/15'),
(2,9, '2014/04/12',490,490*55,'2014/04/15'),
(3,5, '2014/04/20',110,110*40,'2014/04/26'),
(4,12, '2014/05/13',239,239*30,'2014/05/22'),

(14,6, '2015/03/13',100,100*12,'2015/03/15'),
(7,8, '2015/04/12',120,120*55,'2015/04/15'),
(10,4, '2015/04/20',500,500*11,'2015/04/26'),

(4,5, '2016/03/13',175,175*11,'2016/03/15'),
(10,12, '2016/04/12',540,540*55,'2016/04/15'),
(9,8, '2016/04/20',330,330*40,'2016/04/26');
GO

SELECT customerID, customerName
FROM tblCustomer
WHERE customerID IN
(SELECT customerID
FROM tblSales);

--------------############ LAB 8 #######-----------------
--#1
SELECT DISTINCT tblCustomer.customerID, tblCustomer.customerName
FROM tblCustomer INNER JOIN tblSales
ON (tblCustomer.customerID=tblSales.customerID)
-- WHERE customerID IN
-- (SELECT customerID
-- FROM tblSales);

SELECT P1.customerID, P1.customerName
FROM tblCustomer P1 JOIN tblCustomer P2
ON (P1.customerID=P2.customerID)
WHERE P1.customerID IN
(SELECT customerID
FROM tblSales);

--------------#2--------------
SELECT c.categoryName, AVG(s.salesAmount) AS AVERAGE, MAX(s.salesAmount) AS MAXIMUM, MIN(s.salesAmount) AS MINIMUM
FROM tblCategory c
INNER JOIN tblProduct p ON p.categoryID=c.categoryID
INNER JOIN tblSales s ON s.productID=p.productID
WHERE categoryName='Stationary'
GROUP BY
c.categoryName;


---------------from mentor---------------
select categoryName, avg(salesAmount) as AverageSalesAmount, max(salesAmount) as MaxSalesAmount, min(salesAmount) as  MinSalesAmount 
from tblCategory 
 inner join tblProduct on tblProduct.categoryID = tblCategory.categoryID 
 inner join tblSales on tblSales.productID =tblProduct.productID
 where categoryName = 'Stationary'
 group by categoryName

--#3
SELECT
[productName],[price],P1.[categoryID],[categoryName]
FROM
[tblProduct] P1 JOIN [tblCategory] C
ON P1.categoryID = C.categoryID
WHERE
[price] >= ANY (
SELECT
AVG (p2.[price])
FROM
[tblProduct] P2
WHERE
P1.[categoryID] = P2.[categoryID]
GROUP BY
p2.[categoryID]
)
ORDER BY
[categoryID],[productName];

-----------######### JUST PRACTICE#######-----------------
SELECT
[productName],[price],[categoryID]
FROM
[tblProduct] p1
WHERE
[price] >= ANY (
SELECT
AVG (p2.[price])
FROM
[tblProduct] p2
WHERE
p2.[categoryID] = p1.[categoryID]
GROUP BY
p2.[categoryID]
)
ORDER BY
[categoryID],[productName];

GO
SELECT AVG ([price]) AS Category_AVG_Price, [categoryID]
FROM [tblProduct]
GROUP BY [categoryID]
;



-------------------- LAB #9 -------------------
---# Hint-----
SELECT [productName]
FROM [tblProduct] p
INNER JOIN [tblSales] s ON p.productID = s.productID
INNER JOIN [tblCategory] c ON p.categoryID=c.categoryID
WHERE EXISTS
(SELECT
[salesID]
FROM
[tblProduct] p
INNER JOIN [tblSales] s ON p.productID = s.productID
INNER JOIN [tblCategory] c ON p.categoryID=c.categoryID
WHERE [categoryName]= 'Stationary')
GROUP BY
[categoryName],[productName]
HAVING
c.[categoryName]= 'Stationary';

----# Solution -----------
SELECT p.customerName
FROM tblCustomer p
INNER JOIN [tblSales] s ON p.customerID = s.customerID
WHERE s.productID IN
(SELECT
p.productID
FROM
[tblProduct] p
INNER JOIN [tblSales] s ON p.productID = s.productID
INNER JOIN [tblCategory] c ON p.categoryID=c.categoryID
WHERE [categoryName]= 'Stationary');