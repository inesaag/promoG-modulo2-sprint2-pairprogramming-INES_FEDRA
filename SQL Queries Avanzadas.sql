CREATE SCHEMA northwind; 
USE northwind; 

/*  */

SELECT  MIN(unit_price) AS lowestprice, MAX(unit_price) AS highestprice
FROM products; 

/* 2- */

SELECT  AVG(unit_price),  COUNT(unit_price) 
FROM products; 

/* 3- */
SELECT MIN(freight), MAX(freight) 
FROM orders 
WHERE ship_country = "UK"; 

/* 4-*/

SELECT AVG(unit_price)
FROM products; 

SELECT unit_price, product_id
FROM products 
WHERE unit_price > 28.866363636363637 
ORDER BY unit_price DESC; 

/* 5*/ 

SELECT product_id 
FROM products 
WHERE discontinued = 1 ; 

/*6*/  

SELECT product_id, product_name 
FROM products 
ORDER BY product_id DESC
LIMIT 10 ; 

/*7-*/
SELECT COUNT(order_id), MAX(freight), employee_id
FROM orders
WHERE order_date IS NOT NULL
GROUP BY employee_id 
ORDER BY employee_id; 

/*9 */ 

SELECT order_date, COUNT(order_id)
FROM orders 
GROUP BY order_date; 


/*  SELECT 
    YEAR(order_date) AS Anio,
    MONTH(order_date) AS Mes,
    DAY(fecha_pedido) AS Dia,
    COUNT(*) AS Numero_de_Pedidos
FROM 
    pedidos
GROUP BY 
    Anio, Mes, Dia
ORDER BY 
    Anio, Mes, Dia;  */   
    
  /* 11- */ 
  SELECT city, COUNT(employee_id)
  FROM employees
  GROUP BY city 
  HAVING COUNT(employee_id) >= 4 ; 
  
  
  
  
  
    /* 12- */
SELECT quantity, unit_price 
FROM order_details 


ALTER TABLE order_details	
ADD COLUMN importe_total FLOAT;

UPDATE order_details	
SET importe_total = unit_price * quantity;


SELECT *, 
CASE 
     WHEN importe_total > 2000 THEN "ALto" 
      WHEN importe_total < 2000 THEN "bajo" 
      END AS clasificacion
FROM order_details ; 

    
    
    


