-- HOW TO DELETE TABLES FROM A DATABASE

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

/* Truncate Table */
-- TRUNCATE TABLE test; -- Delte all the rows/data in the table