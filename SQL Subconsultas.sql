USE northwind;

-- 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS o1
WHERE o1.order_date = (SELECT MAX(order_date)
							FROM orders AS o2
                            WHERE o1.employee_id = o2.employee_id);
       
SELECT MAX(order_date)
FROM orders
WHERE employee_id = 1;
                            
                            
                            
-- 2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
SELECT DISTINCT product_id, unit_price
FROM order_details AS OD1
WHERE unit_price = (SELECT MAX(unit_price)
							FROM order_details AS OD2
                            WHERE OD1.product_id = OD2.product_id);
                            
SELECT MAX(unit_price)
FROM order_details
WHERE product_id = 1;
                            
                            
                            
SELECT product_id, MAX(unit_price)
FROM order_details AS OD1
WHERE unit_price = (SELECT MAX(unit_price)
							FROM order_details AS OD2
                            WHERE OD1.product_id = OD2.product_id)
GROUP BY product_id;

/* 3- Extraed información de los productos "Beverages
En este caso nuestro jefe nos pide que le devolvamos toda la información 
necesaria para identificar un tipo de producto.
 En concreto, tienen especial interés por los productos con categoría "Beverages".
 Devuelve el ID del producto, el nombre del producto y su ID de categoría */
 
SELECT category_id, product_name
FROM products
WHERE category_id = 1; 

SELECT product_id, product_name, category_id
FROM products AS p
WHERE p.category_id IN (SELECT p2.category_id 
                       FROM products AS p2
                       WHERE p2.category_id = 1);

/*4- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país.
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, 
entonces podría dirigirse a estos países para buscar proveedores adicionales.*/

SELECT*
FROM customers;


SELECT DISTINCT customers.country
FROM customers
WHERE NOT EXISTS( SELECT *
                   FROM suppliers 
                   WHERE customers.country = suppliers.country);

/* Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto
 "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.*/

/*NO ESTA TERMINADO */


SELECT product_id
FROM products
WHERE product_name = "Grandma's Boysenberry Spread";

SELECT order_id, customer_id
FROM orders 
WHERE product_id = (SELECT product_id
                      FROM products
                       WHERE product_name = "Grandma's Boysenberry Spread");





