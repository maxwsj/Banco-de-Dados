INSERT INTO tbl_pessoas (nome_pessoa, idade)
VALUES ('Ana da Silva', 30), 
('Carlos Alberto', 35),
('Maria Joana', 40),
('Igor Rocha', 45),
('Gustavo Lima', 50)
;

describe tbl_pessoas;

SELECT * FROM tbl_pessoas;

#SELEÇÃO DE DADOS COM CRITÉRIO DE INICIO E FIM

#OPERADOR AND
SELECT * FROM tbl_pessoas
WHERE
idade >= 75 AND idade <= 85;

#OPERADOR BETWEEN
SELECT * FROM tbl_pessoas
WHERE
idade between 75 and 89;

#OPERADOR ORDER BY ASC
SELECT * FROM tbl_pessoas
WHERE
idade between 75 and 89
ORDER BY nome_pessoa ASC;

#OPERADOR ORDER BY DESC
SELECT * FROM tbl_pessoas
WHERE
idade between 75 and 89
ORDER BY nome_pessoa DESC;

#Seleção de dados por um modelo/padrão utilizando (underline) LIKE
select * from tbl_pessoas
where idade like '7_';

#Seleção de dados por um modelo/padrão utilizando (porcentagem) LIKE
select * from tbl_pessoas
where nome_pessoa like 'ana%';

#Seleção de dados por um modelo/padrão utilizando (porcentagem no começo/meio ou fim) LIKE
select * from tbl_pessoas
where nome_pessoa like '%Silva%';

#Seleção de dados por um modelo/padrão utilizando (porcentagem com operador not like [que não possua]) LIKE
select * from tbl_pessoas
where nome_pessoa not like '%Silva%';