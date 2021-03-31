SELECT * FROM sales.orders;
SELECT * FROM sales.customers;

-- Aggregate number of orders of each company
CREATE VIEW sales.orders_count AS
SELECT
    COUNT(sales.orders.order_id) AS 'Number of Orders',
    customers.company
FROM sales.orders JOIN sales.customers ON orders.customer_id = customers.customer_id
GROUP BY customers.company;

SELECT * FROM sales.orders_count
ORDER BY 'Number of Orders' DESC;

-- Multiply quantity * price for each order line
SELECT * FROM sales.order_lines;
SELECT * FROM inventory.products;

CREATE VIEW sales.total_price AS
SELECT 
    order_lines.line_id,
    order_lines.quantity * products.price AS 'Total Price'
FROM sales.order_lines JOIN inventory.products ON order_lines.sku = products.sku;

SELECT * FROM sales.total_price;

SELECT * 
    FROM sales.order_details JOIN sales.total_price
    ON order_details.line_id = total_price.line_id;