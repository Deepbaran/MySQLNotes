
SELECT * FROM products; -- All columns of the products table


/* Add Column to a table */
ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

/* Delete column from a table */
-- ALTER TABLE products
-- DROP COLUMN coffee_origin;