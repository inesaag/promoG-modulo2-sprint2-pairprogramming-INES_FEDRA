
SELECT  'Hola!'  AS tipo_nombre
FROM customers;

/* los dos primeros ejercicios los hicimos con schema de tienda */

/* 1- Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas 
en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.*/

SELECT city, customer_name, contact_first_name   
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%"; 
 
 /* Número de pedidos que han hecho en las ciudades que empiezan con L.*/

SELECT city, customer_name, contact_first_name, COUNT(order_number) AS numero_pedidos
FROM customers
LEFT JOIN orders 
ON customers.customer_number = orders.customer_number
WHERE city LIKE "L%"
GROUP BY orders.customer_number ; 

 /* 3- Todos los clientes cuyo "contact_title" no incluya "Sales".
 Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". 
 Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.*/
 
 USE northwind; 
 
 SELECT contact_name, contact_title, company_name
 FROM customers
 WHERE contact_title NOT LIKE "%Sales%"; 
 
 /* 4.-*/
 SELECT contact_name 
 FROM customers
 WHERE contact_name NOT LIKE "_a%"; 
 
 /*5- */
 
 SELECT city, company_name, contact_name, "customers" AS relationship
 FROM customers
 UNION 
 SELECT city, company_name, contact_name, "suppliers" AS relationship
 FROM suppliers; 
 
 /*6-*/
 
 SELECT category_name 
 FROM categories
 WHERE description LIKE "%sweet%" OR  description LIKE "%Sweet%" ;
 
 /*7- */
 SELECT CONCAT(first_name," ",  last_name) AS contact_name 
 FROM employees 
 UNION
 SELECT contact_name
 FROM customers; 
 
 
 
 
 
 
 
 
 

