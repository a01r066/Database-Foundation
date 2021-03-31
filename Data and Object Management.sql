-- SQL Server documentation: https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/catalog-views-transact-sql
-- View SQL Server databases
SELECT * FROM sys.databases;

-- PostgreSQL documentation: https://www.postgresql.org/docs/current/catalogs.html
-- View PostgreSQL sever databases
-- SELECT * FROM pg_database;

-- Duplicate Table
SELECT * FROM inventory.products;

-- Create table from selection in PostgreSQL
-- CREATE TABLE inventory.beauty_products AS
-- SELECT *
-- FROM inventory.products
-- WHERE category_id = 3

-- Create table from selection in SQL Server
SELECT * INTO inventory.beauty_products
FROM inventory.products
WHERE category_id = 3;

-- Review the new, duplicated table's contents
SELECT * FROM inventory.beauty_products;

SELECT * FROM inventory.beauty_products;

-- Remove all data rows one at a time (slow)
DELETE FROM inventory.beauty_products;

-- Remove all data rows from a table at once (fast)
TRUNCATE TABLE inventory.beauty_products;

SELECT * FROM inventory.beauty_products;

-- Remove the table from the database
DROP TABLE inventory.beauty_products;

-- PostgreSQL
-- Create temporary table from selection
-- CREATE TEMPORARY TABLE infused_oils_temp AS
-- SELECT *
-- FROM inventory.products
-- WHERE category_id = 2

-- View data from the temporary table
SELECT * FROM infused_oils_temp;

-- Remove the temporary table
-- DROP TABLE infused_oils_temp;

-- SQL Server
-- Create temporary table from selection
SELECT * INTO #infused_oils_temp
FROM inventory.products
WHERE category_id = 2;

SELECT * FROM #infused_oils_temp;

DROP TABLE #infused_oils_temp;

