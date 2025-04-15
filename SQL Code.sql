-- Create CUSTOMER Table
CREATE TABLE CUSTOMER (
 customer_id INT PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(100) UNIQUE,
 password VARCHAR(100),
 phone VARCHAR(20)
);
-- Create CATEGORY Table
CREATE TABLE CATEGORY (
 category_id INT PRIMARY KEY,
 name VARCHAR(100)
);
-- Create SUPPLIER Table
CREATE TABLE SUPPLIER (
 supplier_id INT PRIMARY KEY,
 name VARCHAR(100),
 contact_info TEXT
);
-- Create PRODUCT Table
CREATE TABLE PRODUCT (
 product_id INT PRIMARY KEY,
 name VARCHAR(100),
 description TEXT,
 price DECIMAL(10, 2),
 image VARCHAR(255),
 stock_quantity INT,
 category_id INT,
 supplier_id INT,
 FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id),
 FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id)
);
-- Create ADDRESS Table
CREATE TABLE ADDRESS (
 address_id INT PRIMARY KEY,
 customer_id INT,
 street VARCHAR(255),
 city VARCHAR(100),
 state VARCHAR(100),
 zip VARCHAR(20),
 FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);
-- Create SHIPPING_ADDRESS Table
CREATE TABLE SHIPPING_ADDRESS (
 shipping_address_id INT PRIMARY KEY,
 address_id INT,
 FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);
-- Create PAYMENT_METHOD Table
CREATE TABLE PAYMENT_METHOD (
 payment_method_id INT PRIMARY KEY,
 name VARCHAR(50)
);
-- Create ORDER_TABLE Table
CREATE TABLE ORDER_TABLE (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_date DATE,
 status VARCHAR(50),
 total_amount DECIMAL(10, 2),
 shipping_address_id INT,
 payment_id INT,
 FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
 FOREIGN KEY (shipping_address_id) REFERENCES
SHIPPING_ADDRESS(shipping_address_id),
 FOREIGN KEY (payment_id) REFERENCES PAYMENT(payment_id)
);
-- Create PAYMENT Table
CREATE TABLE PAYMENT (
 payment_id INT PRIMARY KEY,
 order_id INT,
 payment_date DATE,
 amount DECIMAL(10, 2),
 payment_method_id INT,
 FOREIGN KEY (order_id) REFERENCES ORDER_TABLE(order_id),
 FOREIGN KEY (payment_method_id) REFERENCES
PAYMENT_METHOD(payment_method_id)
);
-- Create ORDER_ITEM Table
CREATE TABLE ORDER_ITEM (
 order_item_id INT PRIMARY KEY,
 order_id INT,
 product_id INT,
 quantity INT,
 price DECIMAL(10, 2),
 FOREIGN KEY (order_id) REFERENCES ORDER_TABLE(order_id),
 FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);
