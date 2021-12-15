#AGRUPAMENTO OU GRUPO DE DADOS ( GROUP BY )
# PERMITE ORGANIZAR DADOS QUE SE REPETEM ( NÃO POR SER MAL MODELADOS )
# MAS SE REPETEM PORQUE REPRESENTAM GRUPOS DE DADOS DE FORMA ÚNICA SEM REPETIÇÃO DESSES DADOS
SELECT orderNumber, status FROM orders ORDER BY status  ASC;

SELECT status FROM orders GROUP BY status;

# ONDE UTILIZAR O GROUP BY ?
# UTILIZANDO-O COM AS FUNÇÕES DE AGREGAÇÃO
SELECT status, COUNT(status) FROM orders GROUP BY status;



SELECT od.quantityOrdered, od.priceEach, status FROM orders o
INNER JOIN orderdetails od
USING(orderNumber);

# UTILIZANDO GROUP BY E SUM - ORDERNAR POR STATUS E OBTER O VALOR 
# QUANTIDADE VENDIDA * PREÇO UNITÁRIO
SELECT o.status, SUM(od.quantityOrdered * od.priceEach) AS 'TOTAL STATUS'
FROM orders o
INNER JOIN orderdetails od
USING(orderNumber)
GROUP BY status;

# UTILIZANDO GROUP BY E MAX
SELECT productLine, MAX(buyPrice)
FROM products
GROUP BY productLine;

# UTILIZANDO GROUP BY E MIN
SELECT productLine, MIN(buyPrice)
FROM products
GROUP BY productLine;

use classicmodels;