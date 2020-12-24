
/* Notes */
-- MySQL is a Relational Database Management System.
-- Provides a UI for us to access and interact with the database.

-- SQL: Structures Query Language.
-- It is a standard Language used to communicate with databases.
-- SQL is used to perform tasks on database.

-- DBMS (Database Management System) takes instruction from SQL and executes them on the Database.

-- A Database allows us to access and interact with the data.

-- A Database is an organized collection of information (data).

-- Tables in a relational database can be linked together.
-- RDBMS is what we use to access and interact with the relational database.

-- A Relational Database is a collection of data organized into tables.
-- Tables contain columns of data categories and rows with particular instances of that data category.

-- DDL: Data Definition Language. It is a subset of SQL that is used to define data structures and modify data and creating tables.

-- DML: Data Manipulation Language. It is a subset of SQL that is concerned with iserting, updating and deleting of data in tables.



/* Data Types */
/* Numeric Data Types */
-- INT: Whole numbers
-- FLOAT(M,D): Decimal numbers (approximate)
-- DECIMAL(M,D): Decimal numbers (precise)

/* Non-numeric Data Types */
-- CHAR(N): Fixed length character
-- VARCHAR(N): Varying length character (Variable Character length. Upto N length)
-- ENUM('M','F'): Value of a defined list (Geneder column/yes and no column)
-- BOOLEAN: True or False value

/* Date and Time Data Types */
-- DATE: Date (YYYY-MM-DD)
-- DATETIME: Date and the time (YYYY-MM-DD HH-MM-SS)
-- TIME: Time (HHH-MM-SS)
-- YEAR: Year (YYYY)



/* Primary Key and Foreign Key */
/* Primar Key */
-- A primary key is a column, or set of columns, which uniquely identifies a record within a table
-- A primary key must be unique.
-- A primary key cannot be NULL
-- A table can only have one primary key.

/* Foreign Key */
-- A foreign key is used to link two tables together
-- A foreign key is a column whose values match the values of another tables primary key column.
-- The table with the primary key is called the reference, or parent table and the parent with the foreign key is called the child table.
-- A table can have multiple foreign keys



/* JOINS */
-- Joins allow you to retrieve data from multiple tables in a sigle select statement
-- To join two tables there needs to be a related column between them
-- There are any different kinds of Join

-- Inner Join retrieve data only when there is matching values in both tables.
-- Left Join will retrieve all data from the left table (table 1) and matching data/rows from the right table (table 2).
-- Right Join will retrieve all data from right table (table 2) and matching data/rows from the left table (table 1).
-- Other databases have a Join called Full Join or Outer Join which will retrieve all the data in table 1 and table 2 no matter if they match or not.
-- MySQL does not have such Full/Outer Join. 



/* DATABASE DESIGN */
/* Normalization */
-- Normalization is the process of efficiently organizing data in a database.
-- To eliminate redundant data.
-- To store related data in a table.

-- Benefits:
-- 1. Reduce storage space.
-- 2. Reduce insert, update and deletion anomalies.
-- 3. Improve query performance

-- Levels of Nurmalization: 
-- 1st Normal Form (1NF)
-- 2nd Normal Form (2NF)
-- 3rd Normal Form (3NF)
-- Boyce and Codd Normal Form (BCNF)

/* 1st Normal Form */
-- Tables are in 1NF if:
-- No repeated rows of data.
-- Columns only contain a single value.
-- The table has a primary key.

-- We can have multiple columns append to make a primary key.

/* 2nd Normal Form */
-- Tables are in 2NF if:
-- They conform to 1NF
-- Every column that is not a primary key of the table is dependent on the whole of the primary key.

/* 3rd Normal Form */
-- Tables are in 3NF if:
-- They conform to 2NF
-- Every Column that is not a primary key is only dependent on the whole of primary key.

/* Relationships */
-- Tables are related through primary and foreign keys.
-- One to One Relationship
-- One to Many Relationship
-- Many to Many Relationship

/* Relationships - One to One */
-- Least common
-- Where a key to one table appears no more than once as the key in another rable and vice versa.

/* Relationships - One to Many */
-- Most Common
-- Where a primary key of one table can be in multiple rows of a foreign key column of another table.

/* Relationships - Many to Many */
-- Most Complicated and as common as One to Many
-- Where two tables can have many instances of each other.

-- To tackle Many to Many relationship, we introduce a new table called the junction table. This table holds the ids of both the tables and as the data in both tables increase,
-- It's rows also increase.
-- It has a One to Many relationship with table1 and table2. Here for one table1 and table2 row, there can be many junction table rows.

-- For example, orders and products table can make a May to Many relationship.
-- TO tackle it we can make a order_details table. It will have products_id and orders_id. As orders come in, for every order, many order_details rows can be added as one
-- order might have order for multiple products and each person can give multiple orders.

/* Constraints */
-- NOT NULL - A column can't contain any null values
-- UNIQUE - A column can't contain any duplicate values
-- PRIMARY KEY - A column that uniquely identifies each row of data.
-- FOREIGN KEY - A column which is related to a primary key in another table.
-- CHECK - Controls th values that can be inserted into a column. Example: CHECK(ratings BETWEEN 0 AND 100)
-- DEFAULT - If no value is inserted into a column, you can set a default value. Example: email DEFAULT 'No Data'



/* AGGREGATE FUNCTIONS */
-- Aggregate Functions perform calculations on data within a column and returns one result row.
-- Can use GROUP BY clauses to group the results by one (or more) columns.
-- Can use a HAVING clause in a similar way to a WHERE clause in SELECT statement to filter the results set.

-- Aggregate Functions:
-- COUNT
-- SUM
-- MIN
-- MAX
-- AVG



/* SUBQUERIES */
-- Subqueries are queries nested within other queries.

-- Example:
/*
-- Non-correlated:
SELECT <column1_table1>, <column2_table1> FROM <table1> -- outer query
WHERE <column3_table1> IN 
(SELECT <column1_table2> FROM <table2> -- inner query
WHERE <column2_table2> > <value>);

-- Correlated:
SELECT <column1_table1>, <column2_table1>,
(SELECT COUNT(<column1_table2>)
FROM <table2> WHERE <column2_table2> = t1.<column3_table1>)
FROM <table1> t1;
*/

-- Subqueries can be used in a SELECT, INSERT, UPDATE or DELETE query.
-- The nested query can be in the WHERE clause or the FROM.

-- Two types of subquery:
-- 1. Non-correlated: The inner query can run independently of the outer query. That means, we can run the inner query even without the other query. 
-- Inner query runs first and produces a result set, which is then used by the outer query.
-- 2. Correlated: The inner query can't run independently of the outer query. That means that the inner query is using data from the outer query.
-- THe inner query runs for every row in the other query.



/* MySQL Functions */
-- Functions are dtores programs which can be passed parameters and return a value.
-- Aggregate functions are also MySQL functions.

-- STRING FUNCTIONS: Functions that take string parameters.
-- DATE FUNCTIONS: Functons that take date, time or datetime parameters.
















