

SHOW DATABASES;

CREATE DATABASE coffee_store;

USE coffee_store;

/* Create a new Table */
CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT increases the value in the column automatically. "PRIMARY KEY" sets the column as Primary key
    name VARCHAR(30), -- name column can have upto 30 characters
    price DECIMAL(3,2)
);

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender ENUM('M','F'),
    phone_number VARCHAR(11) -- We are using VARCHAR because it is not a number in ususal sense
);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT, -- FOREIGN KEY
    customer_id INT, -- FOREIGN KEY
    order_time DATETIME,
    FOREIGN KEY (product_id) REFERENCES products(id), -- product_id is the FOREIGN KEY referencing the PRIMARY KEY, id in products table
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

SHOW TABLES;