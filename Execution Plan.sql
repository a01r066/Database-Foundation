-- Execute a query with no hints
SELECT 
    orders.customer_id,
    customers.company,
    COUNT(orders.order_id) AS number_of_orders,
    SUM(order_lines.quantity * products.price) AS customer_total_spend
FROM sales.order_lines
    JOIN inventory.products ON order_lines.sku = products.sku
    JOIN sales.orders ON order_lines.order_id = orders.order_id
    JOIN sales.customers ON orders.customer_id = customers.customer_id
GROUP BY orders.customer_id, customers.company;


-- Force all HASH joins with a query hint
SELECT 
    orders.customer_id,
    customers.company,
    COUNT(orders.order_id) AS number_of_orders,
    SUM(order_lines.quantity * products.price) AS customer_total_spend
FROM sales.order_lines
    INNER HASH JOIN inventory.products ON order_lines.sku = products.sku
    INNER HASH JOIN sales.orders ON order_lines.order_id = orders.order_id
    INNER HASH JOIN sales.customers ON orders.customer_id = customers.customer_id
GROUP BY orders.customer_id, customers.company;


-- Force all MERGE joins with a query hint
SELECT 
    orders.customer_id,
    customers.company,
    COUNT(orders.order_id) AS number_of_orders,
    SUM(order_lines.quantity * products.price) AS customer_total_spend
FROM sales.order_lines
    INNER MERGE JOIN inventory.products ON order_lines.sku = products.sku
    INNER MERGE JOIN sales.orders ON order_lines.order_id = orders.order_id
    INNER MERGE JOIN sales.customers ON orders.customer_id = customers.customer_id
GROUP BY orders.customer_id, customers.company;