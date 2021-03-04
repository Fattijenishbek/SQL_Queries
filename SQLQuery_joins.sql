-- USE MASTER
-- GO 
-- ALTER DATABASE Accounting SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- GO 
-- DROP DATABASE Accounting;
-- GO


-- USE MASTER 
-- GO 
-- CREATE DATABASE  Accounting
-- GO 
-- USE Accounting
-- GO 

USE MASTER
GO 
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'Accounting')
BEGIN
RAISERROR('Dropping existing Accounting database ...', 0,1)
DROP DATABASE Accounting
END
GO

CREATE DATABASE Accounting
GO
USE Accounting
GO
CREATE TABLE tblStudents

(
    stdID INT,
    firstName NVARCHAR(50),
    lastNAMe NVARCHAR(50),
    city NVARCHAR(40),
    country NVARCHAR(40),
    birthdate DATE,
    CONSTRAINT PK_tblStudents PRIMARY KEY(stdID)
);

USE Accounting
GO 
CREATE TABLE tblPayments
(
    paymentID INT,
    amount MONEY,
    reason NVARCHAR(100),
    [date] DATE NOT NULL DEFAULT GETDATE(),
    _stdID INT,
    CONSTRAINT PK_tblPayments PRIMARY KEY(paymentID),
    CONSTRAINT FK FOREIGN KEY (_stdID) REFERENCES  tblStudents (stdID)
);


INSERT INTO tblStudents VALUES
(1, 'Benjamin','Pahsa','Sarajevo','Bosnia and Herzegovina', '09-10-2000'),
(2,'Yasin', 'Canpolat', 'Istanbul','Turkey', '09-11-2001'),
(3,'Dastan', 'Ulubeg', 'Bishkek','Kyrgyzstan', '08-01-2001'),
(4,'John', 'Winston', 'Santa Fe','US', '01-01-1999');

INSERT INTO tblPayments VALUES
(1,4000,'School fee','08-01-2015',1),
(2,4000, 'School fee','08-01-2015' ,2),
(3,4000, 'School fee','08-02-2015' ,3),
(4,300, 'Lunch fee','08-02-2015' ,2),
(5,200, 'School bus','08-02-2015' ,2),
(6,200, 'School fee','08-02-2015' ,3),
(7,200, 'School bus','08-02-2015' ,NULL),
(8,200, 'School bus','08-02-2015' ,NULL);

GO
-- #1
SELECT firstNAme, lastName, [date], amount, reason
FROM tblStudents
INNER JOIN tblPayments
ON tblPayments._stdID = tblStudents.stdID
ORDER BY tblStudents.firstNAme;

-- #2
SELECT firstNAme, lastName, [date], amount, reason
FROM tblStudents
LEFT JOIN tblPayments
ON tblPayments._stdID = tblStudents.stdID;

-- #3
SELECT firstNAme, lastName, [date], amount, reason
FROM tblStudents
RIGHT JOIN tblPayments
ON tblPayments._stdID = tblStudents.stdID;

-- #4
SELECT firstNAme, lastName, [date], amount, reason
FROM tblStudents
FULL JOIN tblPayments
ON tblPayments._stdID = tblStudents.stdID;


