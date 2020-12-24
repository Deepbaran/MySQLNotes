
-- CREATE DATABASE --

/* Show all Databases*/
SHOW DATABASES;

/* Create Database */
CREATE DATABASE test; -- test database is created
USE test; -- Now we are inside our test database
SHOW TABLES; -- It will dhow all the tables in the test database

/* Delete Database */
DROP DATABASE test; -- test is deleted



-- CREATING THE COFFEE STORE DATABASE --
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



-- MODIFYING TABLES: ADDING AND REMOVING COLUMNS --
SELECT * FROM products; -- All columns of the products table


/* Add Column to a table */
ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

/* Delete column from a table */
ALTER TABLE products
DROP COLUMN coffee_origin;



-- DELETING TABLES --
CREATE DATABASE example;

USE example;

CREATE TABLE test (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    age INT
);

SELECT * FROM test;
SHOW tables;

/* Delete Tables */
DROP TABLE test;



-- Truncating Tables --
TRUNCATE TABLE test; -- Delte all the rows/data in the table