
use coffee_store;

-- SELECT STATEMENT --
select * from customers; -- retrieved all the data in our customer table
select last_name from customers; -- retrieved only the last_name column
select last_name, phone_number from customers; -- retieve last_name and phone_number column

-- WHERE CLAUSE --
select * from products
where coffee_origin = 'Colombia'; -- retrieved only rows where coffee_origin is 'Colombia'

select * from products
where price = 3.00
AND coffee_origin = 'Colombia'; -- retrieved only rows which meets both the criterias

select * from products
where price = 3.00
OR coffee_origin = 'Colombia'; -- retrieved only rows which mmets one or both the criterias



-- USING INEQUALITY SYMBOLS --
/*
> - greater than
>= - greater than equal to
< - less than
<= less than equal to
*/
-- use inequality symbols in case of numerical columns

select * from products
where price >= 3.00; -- retrieved rows where price column is greater than equal to 3.00



-- NULL VALUES --
-- use is instead of = in case of null
select * from customers
where phone_number is null; -- retrieved rows where phone_number column is null


-- use is and is not for null
select * from customers
where phone_number is not null; -- retrieved rows where phone_number column is not null



-- EXERCISE 1 --
-- From the customer table, select the first name and phone number of all the females who have a last name of Bluth
select first_name, phone_number from customers
where gender = 'F'
and last_name = 'Bluth';

-- From the products table, select the name for all products that have a price greater than 3.00 or a coffee origin of Sri Lanka
select name from products
where price > 3.00
or coffee_origin = 'Sri Lanka';

-- How many male customers don't have a phone number entered into the customers table?
select * from customers
where gender = 'M'
and phone_number is null;



-- IN, NOT IN --
select * from customers
where last_name in ('Taylor','Bluth','Armstrong'); -- retrieved rows where the last_name column is Taylor, Bluth or Armstrong

select * from customers
where first_name not in ('Katie','John','George'); -- retrieved rows where first_name column is not Katie, John or George



-- BETWEEN --
-- retrieve the product_id, customer_id and order_time columns of all the rows where order_time is between a certain period/value. It includes both the end points
select product_id, customer_id, order_time from orders
where order_time between '2017-01-01' and '2017-01-07';

select product_id, customer_id, order_time from orders
where customer_id between 5 and 10; -- It will include rows with customer_id 5 and 10

select * from customers
where last_name between 'A' and 'L'; -- All rows where last_name column value starts from 'A' and ends with 'L' is retrieved



-- LIKE --
/*
% - any number of characters
_ - just one character
*/

select * from customers
where last_name like 'w%'; -- return any last_name that starts with w and then followed by any number of characters

select * from customers
where last_name like '%o%'; -- returns any last_name with any number of characters before o and any number of characters after o

select * from customers
where first_name like '_o_'; -- returns any first_name with just one characters before o and just one characters after o

-- like works with numerical values too. But we will need to use single quotation if we use like even if it is numeric
select * from products
where price like '3%';



-- ORDER BY --
-- rows are automatically ordered by the primary key (here it is the id field)
-- By default columns are ordered from null and then in ascending order
select * from products
order by price asc; -- ordered by price column in ascending order (asc)

select * from products
order by price desc; -- ordered by price column in descending order (desc)

-- order by is applicable for strings too. For strings, it follows lexicographical rule while ascending or descending
-- order by is applicable to date and time too

select * from orders
where customer_id = 1
order by order_time desc;



-- EXERCISE 2 --
-- From products table, select the name and price of all products with a coffee origin equal to Colombia or Indonesia. Ordered by name A-Z
select name, price from products
where coffee_origin in ('Colombia','Indonesia')
order by name asc;

-- From the orders table, select all the orders from February 2017 for customers with id's of 2, 4, 6 and 8.
select * from orders
where order_time between '2017-02-01' and '2017-02-28'
and customer_id in (2,4,6,8);  

-- From the customers table, select the first name and phone number of all customers who's last name contains the pattern 'ar'.
select first_name, phone_number from customers
where last_name like '%ar%';



-- DISTINCT --
-- it retrieves data after removing duplicates
select distinct coffee_origin from products; -- only distinct values from coffee_origin is retrieved

select distinct customer_id, product_id from orders
where order_time between '2017-02-01' and '2017-02-28';
-- we might get same cutomer_id even though it is distinct. And that is because, they might have different product_id
-- Here customer_id and product_id together act as a pair and this pair needs to be distinct



-- LIMIT --
-- Limiting the number of rows returned from our select statement
select * from customers
limit 5; -- number of rows returned is limited to 5

-- we can set offset (starting row)
select * from customers
limit 5 offset 5; -- 5 rows after the offset value i.e 5 is retrieved. So, rows 6,7,8,9 and 10 are returned

select * from customers
order by last_name
limit 10; --  returned first 10 rows, ordered by last_name in ascending order



-- COLUMN NAME ALIAS --
-- Renaming a column in our results
select name as coffee, price, coffee_origin as country from products; -- in the result name will be renamed to coffee and coffee_origin
-- we are just changing the name of the column in the results. The columns in the database are unchanged 



-- EXERCISE 3 --
-- From the customers table, select distinct last names and order them alphabetically from A-Z
select distinct last_name from customers
order by last_name asc;

-- From the orders table, select the first 3 orders placed by customer with id 1, in February 2017
select * from orders
where customer_id = 1
and order_time between '2017-02-01' and '2017-02-28'
limit 3;

-- From the products table, select the name, price and coffee origin but rename the price to retail_prce in the result set.
select name, price as retail_price, coffee_origin from products;










