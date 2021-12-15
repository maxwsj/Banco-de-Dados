#CRIAÇÃO DO BANCO DE DADOS;
CREATE DATABASE atividade_bd2;

#SELECIONANDO O BANCO;
USE atividade_bd2;

#CRIAÇÃO DA TABELA tbl_pedido
CREATE TABLE tbl_pedido(
	cod_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(10) NOT NULL
);

#CRIAÇÃO DA TABELA tbl_produto
CREATE TABLE tbl_produto(
	cod_prod INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(500) NOT NULL,
    descricao_produto TEXT NOT NULL,
    preco_produto DECIMAL(10,2) NOT NULL
);

#CRIAÇÃO DA TABELA tbl_iten_produto
CREATE TABLE tbl_iten_pedido(
	cod_prod INT UNSIGNED NOT NULL,
    cod_pedido INT UNSIGNED NOT NULL
);


#CRIAÇÃO DA CHAVE ESTRANGEIRA NA TABELA
#FK_PRODUTO_ITEN_PEDIDO
ALTER TABLE tbl_iten_pedido ADD CONSTRAINT FK_PRODUTO_ITEN_PEDIDO
FOREIGN KEY (cod_prod)
REFERENCES tbl_produto (cod_prod);

#CRIAÇÃO DA CHAVE ESTRANGEIRA NA TABELA
#FK_PRODUTO_ITEN_PEDIDO
ALTER TABLE tbl_iten_pedido ADD CONSTRAINT FK_PEDIDO_ITEN_PEDIDO
FOREIGN KEY (cod_pedido)
REFERENCES tbl_pedido (cod_pedido);

#ATIVIDADE 2 - INSERÇÃO DE PRODUTOS E PEDIDOS

#INSERÇÃO DE PRODUTOS
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('teclado', 'teclado mecânico', 400.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('mouse', 'mouse gamer', 200.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('monitor', 'monitor 120hz', 1200.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('gabinete', 'gabinete gamer', 550.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('pendrive', 'sandisk 120gb', 35.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('hd', 'hd mecânico', 300.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('ssd', '1tb sandisk', 800.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('processador', 'intel 4.4ghz', 400.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('processador', 'amd 4.4ghz', 400.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('memória', 'corsair 8gb', 600.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('mouse', 'mouse gamer razer', 600.00);
INSERT INTO 
tbl_produto (nome_produto, descricao_produto, preco_produto)
VALUES('mouse', 'mouse gamer logitech', 400.00);




#INSERÇÃO DE PEDIDOS

INSERT INTO
tbl_pedido (data)
VALUES('25/10/2021');

INSERT INTO
tbl_pedido (data)
VALUES('20/10/2021');

INSERT INTO
tbl_pedido (data)
VALUES('15/10/2021');

#INSERÇÃO DE PEDIDOS TBL_ITEN_PEDIDO

INSERT INTO 
tbl_iten_pedido (cod_prod, cod_pedido)
VALUES(2, 1);

INSERT INTO 
tbl_iten_pedido (cod_prod, cod_pedido)
VALUES(4, 2);

INSERT INTO 
tbl_iten_pedido (cod_prod, cod_pedido)
VALUES(6, 3);

SELECT * FROM tbl_iten_pedido;



#REALIZAÇÃO DE SELECTS

SELECT * FROM tbl_produto;
SELECT nome_produto, descricao_produto FROM tbl_produto;
SELECT nome_produto, descricao_produto FROM tbl_produto;
SELECT nome_produto, descricao_produto FROM tbl_produto WHERE cod_prod = 11;

#ALTERAR CAMPOS [nome_produto,descricao_produto] na tbl_produto
SELECT * FROM tbl_produto;
ALTER TABLE tbl_produto
CHANGE COLUMN nome_produto produto VARCHAR(500) NOT NULL;

SELECT * FROM tbl_produto;
ALTER TABLE tbl_produto
CHANGE COLUMN descricao_produto detalhes TEXT NOT NULL;

#ALTERAR DADOS na tbl_produto
SELECT detalhes FROM tbl_produto WHERE cod_prod = 9;
UPDATE tbl_produto
SET detalhes = 'teclado membrana'
WHERE cod_prod = 9;

SELECT detalhes FROM tbl_produto WHERE cod_prod = 10;
UPDATE tbl_produto
SET detalhes = 'mouse sem fio'
WHERE cod_prod = 10;

SELECT detalhes FROM tbl_produto WHERE cod_prod = 12;
UPDATE tbl_produto
SET detalhes = 'gabinete de escritório'
WHERE cod_prod = 12;

#ATIVIDADE 3

# 1 - Construir uma “SELECT” que liste produtos por uma faixa de preço:
SELECT * FROM tbl_produto WHERE
preco_produto >= 10.00 AND preco_produto <= 200.00;

# 2 - Construir uma “SELECT” que liste produtos por uma faixa de preço:
SELECT * FROM tbl_produto
WHERE
preco_produto between 200.00 and 500.00;

# 3 - Construir uma “SELECT” que liste nomes de produtos utilizando o conceito do comando “LIKE” com os operadores “%” e “_” com uso do operador de ordenação “ORDER BY ASC”;

#COMANDO LIKE - OPERADOR "%" E OPERADOR ORDER BY ASC
SELECT * FROM tbl_produto
WHERE
descricao_produto like 'm%'
ORDER BY descricao_produto ASC;

#COMANDO LIKE - OPERADOR "_" E OPERADOR ORDER BY ASC
SELECT * FROM tbl_produto
WHERE
cod_prod like '1_'
ORDER BY cod_prod ASC;

# 4 - Construir uma “SELECT” que liste nomes de produtos utilizando o conceito do comando “LIKE” com os operadores “%” e “_” com uso do operador de ordenação “ORDER BY DESC”;

#COMANDO LIKE - OPERADOR "%" E OPERADOR ORDER BY DESC
SELECT * FROM tbl_produto
WHERE
preco_produto like '4%'
ORDER BY descricao_produto DESC;

#COMANDO LIKE - OPERADOR "_" E OPERADOR ORDER BY DESC
SELECT * FROM tbl_produto
WHERE
cod_prod like '1_'
ORDER BY preco_produto DESC;

# 5 - Construir uma “SELECT” com uso de “INNER JOIN” que liste a data do pedido da tabela “tbl_pedido” e os códigos dos produtos “tbl_item_pedido” referente aos pedidos.

select 
ip.cod_pedido,
pd.data
from tbl_iten_pedido ip
inner join tbl_pedido pd
using (cod_pedido)
ORDER BY cod_pedido ASC;

######### DESAFIO #########
select
tb_pt.nome_produto,
tb_pt.preco_produto,
tb_pd.data
from tbl_iten_pedido
inner join tbl_pedido tb_pd
using (cod_pedido)
inner join tbl_produto tb_pt
using (cod_prod)
ORDER BY data ASC;