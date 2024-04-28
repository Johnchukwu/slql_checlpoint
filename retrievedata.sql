/*display all the data of customers*/
SELECT * FROM customers;

/*Display the product_name and category for products which their price is between 5000 and 10000:*/
SELECT product_name, category 
FROM products 
WHERE price BETWEEN 5000 AND 10000;

/*Display all the data of products sorted in descending order of price:*/
SELECT * 
FROM products 
ORDER BY price DESC;

/*Display the total number of orders, the average amount, the highest total amount, and the lower total amount:*/
SELECT 
    COUNT(order_id) AS total_orders,
    AVG(total_amount) AS average_amount,
    MAX(total_amount) AS highest_total_amount,
    MIN(total_amount) AS lowest_total_amount
FROM orders;

/*For each product_id, display the number of orders:*/
SELECT 
    product_id, 
    COUNT(order_id) AS order_count 
FROM orders 
GROUP BY product_id;

/*Display the customer_id which has more than 2 orders:*/
SELECT customer_id
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) AS subquery
WHERE order_count > 2;

/*for each month of the 2020 year, display the number of orders:*/

SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(order_id) AS order_count
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY EXTRACT(MONTH FROM order_date);

/*r each order, display the product_name, the customer_name, and the date of the order*/
SELECT 
    o.order_id,
    p.product_name,
    c.customer_name,
    o.order_date
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id;

/*Display all the orders made three months ago:*/
SELECT *
FROM orders
WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH)
AND order_date < DATE_SUB(CURRENT_DATE(), INTERVAL 2 MONTH);

/*Display customers (customer_id) who have never ordered a product:*/
SELECT customer_id
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);


