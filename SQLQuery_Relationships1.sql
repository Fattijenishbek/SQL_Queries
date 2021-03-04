--#1
USE MASTER
GO 
CREATE DATABASE book_info
GO
USE book_info
GO
CREATE TABLE tblPub
(
    pub_id INT NOT NULL,
    CONSTRAINT PK_pub_id PRIMARY KEY(pub_id),
    pub_name NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    states NVARCHAR(5),
    country NVARCHAR(50) NOT NULL,
);

USE book_info
GO
CREATE TABLE tblBooks
(
    title_id NVARCHAR(30) NOT NULL,
    CONSTRAINT PK_title_id PRIMARY KEY (title_id),
    bookTitle NVARCHAR(100) NOT NULL,
    bookType NVARCHAR(30) NOT NULL,
    bookPrice MONEY NOT NULL,
    pubDate DATE NOT NULL,
    pub_id INT FOREIGN KEY REFERENCES tblPub (pub_id)
    --pub_id-_ INT.
    --CONSTRAINT FK FOREIGN KEY (pub_id_) REFERENES tblPub (pub_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE 
    --{CASCADE| NO ACTION| SET NULL| SET DEFAULT} 
);

INSERT INTO tblPub VALUES
(100, 'New Moon Books', 'Boston', 'MA', 'USA'),
(200, 'Bonnet & Hardley', 'Washington', 'DC', 'USA'),
(300, 'Algodata InfoSystems', 'Berkeley', 'CA', 'USA'),
(400, 'Five Lakes Publishsing', 'Chicago', 'IL', 'USA'),
(500, 'Ramona Publishers', 'Dallas', 'TX', 'USA'),
(600, 'GGG&G', 'Munchen', 'NULL','Germany'),
(700, 'Scootney Books', 'New York', 'NY', 'USA'),
(800, 'Lucerne Publishing', 'Paris', 'NULL', 'France');

INSERT INTO tblBooks VALUES
('BU1032', 'The Busy Executives Database Guide', 'business', $19.99, '6/12/1991', 100 ),
('BU1111', 'Cooking with Computers:Surreptitious Balance Sheets', 'business', $11.95, '6/9/1991',200),
('BU2075', 'You Can Combat Computer Stress!', 'business', $2.99, '6/30/1991',100),
('BU7832', 'Straight Talk About Computers', 'business', $19.99, '6/22/1991', 200),
('MC2222', 'Silicon Valley Gastronomic Treats', 'mod_cook', $19.99, '6/9/1991',300),
('MC3021', 'The Gourmet Microwave','mod_cook', $2.99,'6/18/1991',500)

USE book_info
GO
SELECT * FROM tblBooks;
SELECT * FROM tblPub;



--#2
USE book_info
GO
CREATE TABLE tblPublishers
(
    pub_id  INT NOT NULL PRIMARY KEY,
    pub_name NVARCHAR(50) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    states NVARCHAR(5),
    country NVARCHAR(50) NOT NULL,
);

CREATE TABLE tblEmployee
(
    emp_id INT NOT NULL PRIMARY KEY,
    firstName NVARCHAR(50) NOT NULL,
    lastName  NVARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    pub_id INT FOREIGN KEY REFERENCES tblPublishers(pub_id)
);


CREATE TABLE tblPub_info
(
    pub_id INT PRIMARY KEY FOREIGN KEY REFERENCES tblPublishers(pub_id),
    logo NVARCHAR(30) NOT NULL,
    pr_info NVARCHAR(150),
);

--#3
USE book_info
GO
CREATE TABLE tblPublishers
(
    pub_id  INT NOT NULL PRIMARY KEY,
    pub_name NVARCHAR(50) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    states NVARCHAR(5),
    country NVARCHAR(50) NOT NULL,
    logo NVARCHAR(30) NOT NULL,
    pr_info NVARCHAR(150),
);

CREATE TABLE tblEmployee
(
    emp_id INT NOT NULL PRIMARY KEY,
    firstName NVARCHAR(50) NOT NULL,
    lastName  NVARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    pub_id INT FOREIGN KEY REFERENCES tblPublishers(pub_id)
);

--#4

USE book_info
GO 
CREATE TABLE employees
(
    employeeId INT NOT NULL IDENTITY PRIMARY KEY,
    empName NVARCHAR(50) NOT NULL,
);

CREATE TABLE projects
(
    projectId INT NOT NULL IDENTITY PRIMARY KEY,
    prName NVARCHAR(50) NOT NULL,
    prDescription NVARCHAR(50) NOT NULL,
);

CREATE TABLE projectAssignments
(
    employeeId  INT NOT NULL FOREIGN KEY REFERENCES employees(employeeId),
    projectId INT NOT NULL FOREIGN KEY REFERENCES projects(projectId)
    CONSTRAINT PK PRIMARY KEY(employeeId, projectId)
);
-- USE master 
-- GO
-- ALTER DATABASE book_info SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- GO 
-- DROP DATABASE book_info;