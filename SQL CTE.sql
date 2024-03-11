USE northwind

-- EJERCICIO 1:  Extraer en una CTE todos los nombres de las compañias y los id de los clientes.

WITH `custID` AS (SELECT `company_name`, `customer_id`
					FROM `customers`)

SELECT  `customer_id`, `company_name`
	FROM `custID`; 

-- EJERCICIO 2: Selecciona solo los de que vengan de "Germany"

WITH `custID` AS (SELECT `company_name`, `customer_id`
					FROM `customers`
                    WHERE `country` = 'Germany')

SELECT  `customer_id`, `company_name`
	FROM `custID`; 

-- EJERCICIO 3: Extraed el id de las facturas y su fecha de cada cliente.

WITH `custID` AS (SELECT `customer_id`, `company_name`
						FROM `customers`)
SELECT `c`.`customer_id`,`c`. `company_name`,`o`.`order_id`,`o`.`order_date`
	FROM `orders`AS `o`
    INNER JOIN`custID` AS `c`
    ON `o`. `customer_id` = `c`.`customer_id`; 

-- EJERCICIO 4: Contad el número de facturas por cliente

WITH `custID` AS (SELECT `customer_id`, `company_name`
						FROM `customers`)
SELECT `c`.`customer_id`,`c`. `company_name`,COUNT(`o`.`order_id`)
	FROM `orders`AS `o`
    INNER JOIN`custID` AS `c`
    ON `o`. `customer_id` = `c`.`customer_id`
    GROUP BY `customer_id`; 
    
-- EJERCICIO 5: Cuál la cantidad media pedida de todos los productos ProductID.

WITH `custP` AS (SELECT `product_id`, SUM(`quantity`)/ COUNT(`product_id`) AS `suma_productos`
					FROM `order_details` 
                    GROUP BY `product_id`)

SELECT `product_name`, `suma_productos`
FROM `custP` AS `c`
INNER JOIN `products` AS `p`
ON `c`.`product_id` = `p`.`product_id`
GROUP BY `c`.`product_id`; 
