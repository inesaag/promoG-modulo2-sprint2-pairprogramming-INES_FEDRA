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