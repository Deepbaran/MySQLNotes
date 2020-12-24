
use coffee_store;

-- INNER JOIN --
select products.name, orders.order_time from orders -- name column from products table and order_time column from orders table will be retrieved
inner join products 
on orders.product_id = products.id; -- product_id column from the orders table is equivalent to id column from the products table.
-- All the matching data from orders table (table 1) and products table (table 2) is retrieved
-- Matching is done on product_id column from the orders and id column from the products table.

-- SHort hand version
select p.name, o.order_time from orders o -- assigning alias o to table orders
join products p -- join and inner join are same
on o.product_id = p.id;

-- whenever using joins, always use <table_name>.<column_name> not only <column_name>
select p.name, o.order_time from orders o
join products p on o.product_id = p.id
where o.product_id = 5
order by o.order_time;



-- LEFT JOIN --
select o.id, c.phone_number, c.last_name, o.order_time from orders o
left join customers c on o.customer_id = c.id
order by o.order_time
limit 10;
-- orders is table 1 and customers is table 2
-- Here all the data from orders table (id and order_time) is retrieved and only the matching data from customers table (phone_number and last_name) is retrieved.
-- If no matching data is there in the table 2 for the data in table 1 then that field of result table will have null.
-- So, getting the data of table 1 and table 2 is important



-- RIGHT JOIN --
select o.id, c.phone_number, c.last_name, o.order_time from orders o
right join customers c on o.customer_id = c.id
order by o.order_time
limit 10;
-- orders is table 1 and customers is table 2
-- Here all the data from customers table (phone_number and last_name) is retrieved and only the matching data from orders table (id and order_time) is retrieved.
-- If no matching data is there in the table 1 for the data in table 2, then that field of result table will have null.
-- So, getting the data of table 1 and table 2 is important
-- Switching the tables is same as switching left and right join



-- JOINING MORE THAN TWO TABLES --
select p.name, p.price, c.first_name, c.last_name, o.order_time from products p
join orders o on p.id = o.product_id -- inner joined orders and products tables
join customers c on c.id = o.customer_id -- inner join customers and products tables
where c.last_name = 'Martin'
order by o.order_time;
-- products table and customers table does not have any matching columns. So, we need to join them through orders table



-- EXERCISE --
-- Select the order id and customer phone number for all orders of product id 4.
select o.id, c.phone_number from orders o
join customers c on o.customer_id = c.id
where o.product_id = 4;

-- Select product name and order time for filter coffees sold between January 15th 2017 and February 14th 2017.
select p.name, o.order_time from products p
join orders o on p.id = o.product_id
where p.name = 'Filter'
and o.order_time between '2017-01-15' and '2017-02-14';

-- Select the product name and price and order time for all orders from females in January 2017.
select p.name, p.price, o.order_time from products p
join orders o on p.id = o.product_id
join customers c on o.customer_id = c.id
where c.gender = 'F'
and o.order_time between '2017-01-01' and '2017-01-31';


















