#FUNÇÕES DE AGREGACÃO - Tem por finalidade geralmente realizar operações aritméticas em cima de registros


SELECT * FROM products;

#Esse conceito se aplica a qualquer campo de ordem numerica
# Como utilizar as funções de agregação aqui:
SELECT buyprice FROM products;

# Receber a média de um campo
# AVG -> DETERMINA A MÉDIA DE UM GRUPO DE VALORES NUMERICOS
SELECT AVG(buyPrice) AS 'PREÇO MÉDIO'FROM products;

# COUNT ->  CONTA A QUANTIDADE DE VALORES (OU INCIDENCIA DE VALORES) DE UMA TABELA 
SELECT COUNT(productCode)  AS 'PRODUTOS TOTAIS' FROM products;
SELECT COUNT(*)  AS 'PRODUTOS TOTAIS' FROM products;

# SUM ->  REALIZA A SOMA DE UM CAMPO NUMÉRICO ESPECÍFICO 
SELECT * FROM products;
# vamos fazer em duas partes
SELECT SUM(quantityInStock * buyPrice) AS 'TOTAL DE DINHEIRO EM ESTOQUE' FROM products;

# MAX ->  DEVOLVE O MAIOR VALOR DE UMA SÉRIE DE VALORES NUMERICOS
SELECT MAX(buyPrice) AS 'MAIOR Valor' FROM products;
SELECT buyPrice FROM products ORDER BY buyPrice DESC;

# MIN ->  DEVOLVE O MENOR VALOR DE UMA SÉRIE DE VALORES NUMERICOS
SELECT MIN(buyPrice) AS 'MENOR Valor' FROM products;
SELECT buyPrice FROM products ORDER BY buyPrice ASC;


#####################################################################