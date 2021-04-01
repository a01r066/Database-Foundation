-- Create a function to translate company name into id

-- Review the customer and order data
SELECT * FROM sales.customers;
SELECT * FROM sales.orders;


-- Create the function in PostgreSQL
-- CREATE FUNCTION fetch_id (search_name VARCHAR(100))
--     RETURNS CHAR(5)
--     AS $$
--         BEGIN
--         RETURN (SELECT customer_id
--                 FROM sales.customers
--                 WHERE company_name = search_name);
--         END;
--     $$ LANGUAGE plpgsql;


-- Create the function in SQL Server
CREATE FUNCTION sales.fetch_id (@search_name VARCHAR(100))
RETURNS CHAR(5)
AS
    BEGIN
        DECLARE @id_value CHAR(5);
        SET @id_value = (SELECT customer_id
                FROM sales.customers
                WHERE company = @search_name);
        RETURN(@id_value);
    END
;


-- Use the function to translate name to id value
-- For SQL Server, use “sales.fetch_id”
SELECT sales.fetch_id('Flavorville');
SELECT sales.fetch_id('Blue Vine');

SELECT * FROM sales.orders
WHERE customer_id = (SELECT sales.fetch_id('Green Gardens'));

-- PostgreSQL
-- Review the current customer data
-- SELECT * FROM sales.customers;

-- Create a stored procedure to add new customers on PostgreSQL
-- CREATE PROCEDURE insert_customer (
--     customer_id CHAR(5),
--     company     VARCHAR(100),
--     address     VARCHAR(100),
--     city        VARCHAR(50),
--     state       CHAR(2),
--     zip         CHAR(5))
-- LANGUAGE SQL
-- AS $$
-- INSERT INTO sales.customers VALUES (customer_id, company, address, city, state, zip);
-- $$;

-- Execute the procedure on PostgreSQL and pass it a parameter value
-- CALL insert_customer('WF100', 'Whitney Fields', '100 Main St', 'Bellingham', 'WA', '98225');

-- Verify the results
-- SELECT * FROM sales.customers;

---------------
-- SQL Server
-- Review the current customer data
SELECT * FROM sales.customers;

-- Create a stored procedure to add new customers on SQL Server
CREATE PROCEDURE insert_customer (
    @customer_id CHAR(5),
    @company     VARCHAR(100),
    @address     VARCHAR(100),
    @city        VARCHAR(50),
    @state       CHAR(2),
    @zip         CHAR(5))
AS
INSERT INTO sales.customers VALUES (@customer_id, @company, @address, @city, @state, @zip);

-- Execute the procedure on SQL Server and pass it a parameter value
EXECUTE insert_customer 'WF100', 'Whitney Fields', '100 Main St', 'Bellingham', 'WA', '98225';

-- Verify the results
SELECT * FROM sales.customers
WHERE customer_id = 'wf100'
;