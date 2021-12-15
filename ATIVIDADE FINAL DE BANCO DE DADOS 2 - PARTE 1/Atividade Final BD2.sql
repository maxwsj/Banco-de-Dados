# 1. SELECT COM OPERADORES RELACIONAIS (<, >, <=, >=, !=):
	# i. "< 100" ;
	SELECT buyPrice
	FROM products
	WHERE buyPrice < 100
	ORDER BY buyPrice DESC;

	# ii. "> 100" ;
	SELECT buyPrice
	FROM products
	WHERE buyPrice > 100
	ORDER BY buyPrice DESC;

	# iii. "<= 100" ;
	SELECT buyPrice
	FROM products
	WHERE buyPrice <= 100
	ORDER BY buyPrice DESC;

	# iv. ">= 100" ;
	SELECT buyPrice
	FROM products
	WHERE buyPrice >= 100
	ORDER BY buyPrice DESC;

	# v. "!= 100".
	SELECT buyPrice
	FROM products
	WHERE buyPrice != 100
	ORDER BY buyPrice DESC;

# 2. SELECT COM OPERADORES LÓGICOS (AND, OR e BETWEEN):
	# a. >= e <=
	SELECT creditLimit FROM customers
	WHERE
	creditLimit >= 25000 AND creditLimit <= 100000
	ORDER BY creditLimit DESC;

	# b BETWEEN
	SELECT creditLimit FROM customers
	WHERE
	creditLimit BETWEEN 0 AND 100000
	ORDER BY creditLimit DESC;

# 3. SELECT COM ORDENAÇÃO (ORDER BY ASC e DESC):
	# a. ORDER BY ASC
    SELECT firstName AS 'NOME', lastName 'SOBRENOME', email 'E-MAIL'
    FROM employees 
	ORDER BY firstName ASC;

	# b. ORDER BY DESC
    SELECT firstName AS 'NOME', lastName 'SOBRENOME', email 'E-MAIL'
    FROM employees 
	ORDER BY firstName DESC;
    
# 4. SELECT COM DELIMITAÇÃO (LIKE e NOT LIKE):
	# a.
    SELECT customerName AS 'NOME', contactLastName 'SOBRENOME', phone 'CONTATO' 
    FROM customers
    WHERE phone like '+34%';
    
    # b.
    SELECT customerName AS 'NOME', contactLastName 'SOBRENOME', phone 'CONTATO' 
    FROM customers
    WHERE phone like '%55';
    
    # c.
    SELECT customerName AS 'NOME', contactLastName 'SOBRENOME', phone 'CONTATO' 
    FROM customers
    WHERE phone not like '%55';
    
# 5. SELECT COM JOIN (INNER e USING):
	#a. INNER JOIN SEM USING
    SELECT
    productName, productScale, buyPrice, textDescription
	FROM products tb_pd
	INNER JOIN productlines td_pdl
    ON tb_pd.productline = td_pdl.productline;
    
    #b. INNER JOIN COM USING
    SELECT 
    productName, productScale, buyPrice, textDescription
	FROM
    products tb_pd
	INNER JOIN productlines td_pdl
    USING (productline);

