USE MASTER 
GO
CREATE DATABASE db_school3
GO
USE db_school3
GO

USE MASTER
GO 
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'db_school3')
BEGIN
RAISERROR('Dropping existing db_school3 database ...', 0,1)
DROP DATABASE db_school3
END
GO

CREATE DATABASE db_school3
GO
USE db_school3
GO

CREATE TABLE tblStudents
(
    stdId int NOT NULL, --PRIMARY KEY
    schoolNumber int NOT NULL, --UNIQUE
    firstName NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    birthDate DATE NOT NULL,
    CONSTRAINT PK_tblStudents PRIMARY KEY (stdID),
    CONSTRAINT UQ_tblStudents UNIQUE (schoolNumber),
);
CREATE INDEX IX_firstName ON  tblStudents(firstName ASC)
CREATE INDEX IX_lastName ON tblStudents(lastName ASC)
CREATE INDEX IX_birthDate ON tblStudents(birthDate ASC)

GO
INSERT INTO tblStudents VALUES
(1, 5, 'Fatima', 'Bekmamatova', '02-04-2001'),
(2, 67, 'Egemberdi', 'Bekmamatov', '11-15-2006'),
(3, 6, 'Myrzagul', 'Bekmamatova', '12-26-2002');

GO
SELECT stdId, firstName, birthDate FROM tblStudents WHERE stdId IN(1,2);


USE pubs
GO
SELECT price FROM dbo.titles;