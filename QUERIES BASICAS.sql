CREATE SCHEMA northwind;

USE northwind;

/*4. */
SELECT employee_id, last_name, first_name
FROM employees;

/*5.Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad oscilen entre 0 y 5 dólares, es decir, los productos más asequibles. */
SELECT *
FROM products
WHERE unit_price <= 5;

/*6. */
SELECT *
FROM products
WHERE unit_price IS NULL;

/*7. */
SELECT *
FROM products
WHERE unit_price <= 15 AND product_id < 10;

/*8. */
SELECT *
FROM products
WHERE NOT unit_price <= 15 AND NOT product_id < 10;

/*9. */
SELECT DISTINCT ship_country
FROM orders;

/*10 */
SELECT product_name, unit_price
FROM products
ORDER BY product_id ASC
LIMIT 10;

/*11 */
SELECT product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

/*12 */
SELECT DISTINCT order_id
FROM order_details;

/*13 */
ALTER TABLE order_details
	ADD COLUMN importe_total FLOAT;
    
UPDATE order_details
	SET importe_total = unit_price * quantity;

SELECT importe_total
	FROM order_details;

SELECT *
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 3;
    
/*14 */
SELECT order_id
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 5
    OFFSET 4;
    
/*15 */
SELECT category_name AS `nombre de categoria`
FROM categories;

/*16 */
SELECT DATE_ADD(shipped_date, INTERVAL 5 DAY) AS `fecha retrasada`
FROM orders;

/*17 */
SELECT *
FROM products
WHERE unit_price BETWEEN 15 AND 50;

/*18 */
SELECT *
FROM products
WHERE unit_price IN (18, 19, 20);