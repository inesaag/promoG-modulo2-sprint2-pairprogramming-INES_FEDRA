USE northwind;

-- 1. Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT customer_id, company_name, COUNT(order_id) as NumeroPedidos
FROM customers
NATURAL JOIN (orders)
WHERE country = "UK"
GROUP BY customer_id;

-- 2.Productos pedidos por empresa en UK por año:

SELECT company_name, YEAR(order_date), SUM(quantity)
FROM customers
NATURAL JOIN (orders)
NATURAL JOIN (order_details)
WHERE country = "UK"
GROUP BY company_name, YEAR(order_date);

-- 3. Mejorad la query anterior:
ALTER TABLE order_details
DROP COLUMN importe_total;

SELECT company_name, YEAR(order_date), SUM(quantity), SUM((quantity*unit_price)*1-discount) AS Dinero_Total
	FROM customers
	NATURAL JOIN (orders)
	NATURAL JOIN (order_details)
	WHERE country = "UK"
	GROUP BY company_name, YEAR(order_date);
    
-- Ejemplos para referenciar:
SELECT C.company_name AS NombreEmpresa, 
        YEAR(O.order_date) AS Año, 
        SUM(OD.quantity) AS NumObjetos, 
        SUM(OD.quantity * OD.unit_price * (1-OD.discount)) AS DineroTotal
        
        
-- 6. Qué empresas tenemos en la BBDD Northwind:

SELECT order_id, company_name, order_date
FROM orders
NATURAL JOIN (customers);

-- 7. Pedidos por cliente de UK:

SELECT company_name, COUNT(order_id) AS NumeroPedidos
FROM orders
NATURAL JOIN (customers)
WHERE country = "UK"
GROUP BY company_name;


-- 8

SELECT company_name, order_id, order_date
FROM orders
WHERE country = "UK"
RIGHT JOIN (customers)
ON orders.customer_id = customers.customer_id;