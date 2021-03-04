USE pubs
GO
--ORDER: SELECT>>FROM>>WHERE>>GROUP BYY>>HAVING>>ORDER BY;

SELECT [stor_name], [stor_address], [city] FROM dbo.stores;
SELECT TOP(5) * FROM dbo.publishers;
SELECT * FROM dbo.titles ORDER BY pubdate DESC;
SELECT * FROM dbo.titles WHERE price BETWEEN '10' AND '20' ORDER BY pubdate ASC;
SELECT * FROM dbo.authors WHERE au_fname LIKE 'S%' ORDER BY au_fname ASC;
SELECT [au_fname],[au_lname],[phone] FROM dbo.authors WHERE au_fname LIKE 'S%' ORDER BY au_fname ASC;
SELECT [au_fname],[au_lname],[phone] FROM dbo.authors WHERE au_fname LIKE '[DMR]%' ORDER BY au_fname ASC;
SELECT [au_fname],[au_lname],[phone] FROM dbo.authors WHERE au_lname NOT LIKE '[ABCD]%' ORDER BY au_lname ASC;
SELECT [au_fname],[au_lname],[phone] FROM dbo.authors WHERE au_fname LIKE 'A%M' ORDER BY au_fname ASC;
SELECT [au_fname],[au_lname],[phone] FROM dbo.authors WHERE au_fname LIKE '%er' ORDER BY au_fname ASC;
SELECT [au_fname],[au_lname],[phone] FROM dbo.authors WHERE au_fname LIKE '%ne%' ORDER BY au_fname ASC;
SELECT * FROM dbo.titles WHERE price IS NULL ORDER BY pubdate ASC;
SELECT DISTINCT [type] FROM dbo.titles;
SELECT COUNT(title) AS num_of_publications FROM dbo.titles;
SELECT MAX([price]) AS expensive_price FROM dbo.titles;
SELECT MIN([price]) AS cheapest_price FROM dbo.titles;
SELECT pubdate, COUNT(pubdate) AS num_of_publications FROM dbo.titles GROUP BY pubdate;
SELECT city, COUNT(city) AS num_of_authors FROM dbo.authors GROUP BY city;
SELECT city, COUNT(city) AS num_of_authors FROM dbo.authors GROUP BY city HAVING COUNT(city)>=2;
DELETE FROM dbo.authors WHERE au_id='893-72-1158';
DELETE FROM dbo.authors WHERE au_id='111-22-3334';
INSERT INTO authors VALUES('111-22-3334','Big','Ball','444 455-4545','12963 Baker St.','London', 'EU','91919','5');
UPDATE authors SET city='Salt Lake City' WHERE au_id='274-80-9391';





