-- CUSTOMER
INSERT INTO CUSTOMER (customer_id, name, email, password, phone) VALUES
(1, 'Alice Smith', 'alice@example.com', 'password123', '123-456-7890'),
(2, 'Bob Johnson', 'bob@example.com', 'securepass', '234-567-8901');
-- CATEGORY
INSERT INTO CATEGORY (category_id, name) VALUES
(1, 'Electronics'),
(2, 'Books');
-- SUPPLIER
INSERT INTO SUPPLIER (supplier_id, name, contact_info) VALUES
(1, 'Tech Supplier Co.', 'tech@example.com'),
(2, 'Book Wholesalers Inc.', 'books@example.com');
-- PRODUCT
INSERT INTO PRODUCT (product_id, name, description, price, image, stock_quantity,
category_id, supplier_id) VALUES
(1, 'Smartphone', 'Latest model smartphone', 699.99, 'smartphone.jpg', 50, 1, 1),
(2, 'Science Fiction Novel', 'A thrilling sci-fi book', 14.99, 'scifi.jpg', 200, 2, 2);
-- ADDRESS
INSERT INTO ADDRESS (address_id, customer_id, street, city, state, zip) VALUES
(1, 1, '123 Maple St', 'New York', 'NY', '10001'),
(2, 2, '456 Oak Ave', 'Los Angeles', 'CA', '90001');
-- SHIPPING_ADDRESS
INSERT INTO SHIPPING_ADDRESS (shipping_address_id, address_id) VALUES
(1, 1),
(2, 2);
-- PAYMENT_METHOD
INSERT INTO PAYMENT_METHOD (payment_method_id, name) VALUES
(1, 'Credit Card'),
(2, 'PayPal');
-- ORDER_TABLE
INSERT INTO ORDER_TABLE (order_id, customer_id, order_date, status, total_amount,
shipping_address_id, payment_id) VALUES
(1, 1, '2025-04-01', 'Shipped', 714.98, 1, 1),
(2, 2, '2025-04-03', 'Processing', 14.99, 2, 2);
-- PAYMENT
INSERT INTO PAYMENT (payment_id, order_id, payment_date, amount,
payment_method_id) VALUES
(1, 1, '2025-04-01', 714.98, 1),
(2, 2, '2025-04-03', 14.99, 2);
-- ORDER_ITEM
INSERT INTO ORDER_ITEM (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 699.99),
(2, 1, 2, 1, 14.99),
(3, 2, 2, 1, 14.99);
