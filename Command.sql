-- List All Products with Category and Supplier Names :
SELECT
 p.product_id,
 p.name AS product_name,
 p.price,
 c.name AS category_name,
 s.name AS supplier_name
FROM PRODUCT p
JOIN CATEGORY c ON p.category_id = c.category_id
JOIN SUPPLIER s ON p.supplier_id = s.supplier_id;
-- Get All Orders with Customer Name and Total Amount:
SELECT
 o.order_id,
 c.name AS customer_name,
 o.order_date,
 o.status,
 o.total_amount
FROM ORDER_TABLE o
JOIN CUSTOMER c ON o.customer_id = c.customer_id;
-- Get Order Items for a Specific Order (e.g., Order ID = 1):
SELECT
 oi.order_item_id,
 p.name AS product_name,
 oi.quantity,
 oi.price
FROM ORDER_ITEM oi
JOIN PRODUCT p ON oi.product_id = p.product_id
WHERE oi.order_id = 1;
-- Find All Orders Placed by a Specific Customer (e.g., customer_id =1):
SELECT
 o.order_id,
 o.order_date,
 o.status,
 o.total_amount
FROM ORDER_TABLE o
WHERE o.customer_id = 1;
-- Get All Payments with Method Name SELECT * FROM Employees:
SELECT
 p.payment_id,
 p.order_id,
 p.payment_date,
 p.amount,
 pm.name AS payment_method
FROM PAYMENT p
JOIN PAYMENT_METHOD pm ON p.payment_method_id = pm.payment_method_id;
-- Get Shipping Address Details for Each Order SELECT * FROM Reservations WHERE guest_id = 1:
SELECT
 o.order_id,
 a.street,
 a.city,
 a.state,
 a.zip
FROM ORDER_TABLE o
JOIN SHIPPING_ADDRESS sa ON o.shipping_address_id = sa.shipping_address_id
JOIN ADDRESS a ON sa.address_id = a.address_id;
-- Total Revenue from All Orders:
SELECT SUM(total_amount) AS total_revenue FROM ORDER_TABLE;
-- Best-Selling Product by Quantity:
SELECT
 p.name,
 SUM(oi.quantity) AS total_sold
FROM ORDER_ITEM oi
JOIN PRODUCT p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 1;
-- Show All Customers and Their Saved Addresses:
SELECT
 c.name AS customer_name,
 a.street,
 a.city,
 a.state,
 a.zip
FROM CUSTOMER c
JOIN ADDRESS a ON c.customer_id = a.customer_id;
-- Check Inventory: Products with Low Stock (e.g., < 10 units):
SELECT
 name,
 stock_quantity
FROM PRODUCT
WHERE stock_quantity < 100;
