#CRIAÇÃO DO BANCO DE DADOS;
CREATE DATABASE atividade_bd4;

#SELECIONANDO O BANCO;
USE atividade_bd4;

#CRIAÇÃO DA TABELA tbl_cliente
CREATE TABLE tbl_cliente(
	cod_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45) NOT NULL
);

#CRIAÇÃO DA TABELA tbl_pedido
CREATE TABLE tbl_pedido(
	cod_pedido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT UNSIGNED NOT NULL,
    data_pedido VARCHAR(10) NOT NULL,
    data_entrega VARCHAR(10) NOT NULL,
    
    constraint fk_cod_cliente
	foreign key (cod_cliente)
	references tbl_cliente (cod_cliente)
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
	qtd_pedido INT NOT NULL,
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

################ INSERÇÃO DE PRODUTOS E PEDIDOS #################

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

########################### ATIVIDADE 4 ###############################

# INSERÇÃO DE CLIENTES
INSERT INTO 
tbl_cliente (nome_cliente)
VALUES ('Gustavo Fontana'), ('Andre Damazio'), ('Kevin Guilherme'), ('Max William'), ('Cristiano Correa');

INSERT INTO
tbl_cliente (nome_cliente)
VALUES ('Andressa Gomes');

select * from tbl_cliente;

#INSERÇÃO DE PEDIDOS
# CLIENTE 1
INSERT INTO
tbl_pedido (cod_cliente, data_pedido, data_entrega)
VALUES(1,'25/10/2021','31/10/2021');

# CLIENTE 2
INSERT INTO
tbl_pedido (cod_cliente, data_pedido, data_entrega)
VALUES(2,'31/10/2021','05/11/2021'), (2,'06/11/2021','11/10/2021'),(2,'15/11/2021','20/11/2021') ;

# CLIENTE 3
INSERT INTO
tbl_pedido (cod_cliente, data_pedido, data_entrega)
VALUES(3,'25/10/2021','03/11/2021'), (3,'10/11/2021','15/11/2021');

# CLIENTE 4
INSERT INTO
tbl_pedido (cod_cliente, data_pedido, data_entrega)
VALUES(4,'06/11/2021','11/11/2021'), (4,'15/11/2021','20/11/2021');

# CLIENTE 5
INSERT INTO
tbl_pedido (cod_cliente, data_pedido, data_entrega)
VALUES(5,'06/11/2021','11/11/2021'), (5,'20/11/2021','22/11/2021');

# CLIENTE 6
INSERT INTO
tbl_pedido (cod_cliente, data_pedido, data_entrega)
VALUES(6,'06/11/2021','11/11/2021'), (6,'20/11/2021','22/11/2021');

#INSERÇÃO DE PEDIDOS TBL_ITEN_PEDIDO

INSERT INTO
# CLIENTE 1 
tbl_iten_pedido (qtd_pedido, cod_prod, cod_pedido)
VALUES(1, 2, 1);

# CLIENTE 2
INSERT INTO
tbl_iten_pedido (qtd_pedido, cod_prod, cod_pedido)
VALUES(1, 1, 2), (1, 1, 3), (1, 1, 4);

# CLIENTE 3
INSERT INTO
tbl_iten_pedido (qtd_pedido, cod_prod, cod_pedido)
VALUES(2, 2, 5), (4, 5, 6);

# CLIENTE 4
INSERT INTO
tbl_iten_pedido (qtd_pedido, cod_prod, cod_pedido)
VALUES(1, 6, 7), (1, 7, 8);

# CLIENTE 5
INSERT INTO
tbl_iten_pedido (qtd_pedido, cod_prod, cod_pedido)
VALUES(4, 10, 9), (2, 3, 10);

# CLIENTE 6
INSERT INTO
tbl_iten_pedido (qtd_pedido, cod_prod, cod_pedido)
VALUES(4, 10, 11), (2, 3, 12);

# EXERCÍCIO - FUNÇÕES DE AGREGACÃO
# 2. Contar a quantidade total de produtos na base de dados:
SELECT COUNT(cod_prod)  AS 'TOTAL DE PRODUTOS CADASTRADOS' FROM tbl_produto;

# 3. Contar a quantidade total de produto envolvidos em pedidos;
SELECT COUNT(qtd_pedido)  AS 'CONTAGEM TOTAL DE PRODUDOS PEDIDOS' FROM tbl_iten_pedido; # Contando o total de pedidos
SELECT SUM(qtd_pedido)  AS 'SOMA TOTAL DE PRODUDOS PEDIDOS' FROM tbl_iten_pedido;   # Somando o total de produtos envolvidos em pedido

# 4. Contar a quantidade total de clientes envolvidos em pedidos;
SELECT COUNT(DISTINCT cod_cliente) AS 'CONTAGEM TOTAL DE CLIENTES EM PEDIDOS' FROM tbl_pedido;

# 5. Informar o valor total dos produtos disponíveis na base de dados;
SELECT SUM(preco_produto)  AS 'VALOR TOTAL DOS PRODUTOS DISPONÍVEIS' FROM tbl_produto;

# 6. Informar o valor total de todos os produtos dos pedidos;
SELECT SUM(tb_ip.qtd_pedido * tb_pd.preco_produto) AS 'VALOR TOTAL DE PRODUTOS PEDIDOS' 
FROM tbl_produto tb_pd
INNER JOIN tbl_iten_pedido tb_ip
USING (cod_prod);

# INNER JOIN PARA CONSULTAR A TABELA E CHECAR OS VALORES
SELECT
tb_pt.nome_produto,
tb_pt.preco_produto,
tb_ip.qtd_pedido

FROM tbl_iten_pedido tb_ip
INNER JOIN tbl_pedido tb_pd
USING (cod_pedido)

INNER JOIN tbl_produto tb_pt
USING (cod_prod)
ORDER BY preco_produto ASC;

# 7. Informar a média de preços dos produtos;
SELECT AVG(preco_produto) AS 'TOTAL PREÇO MÉDIO PRODUTOS'FROM tbl_produto;

# 8. Informar o maior valor de preços dos produtos;
SELECT nome_produto,  MAX(preco_produto)
FROM tbl_produto;

SELECT nome_produto,  MAX(preco_produto)
FROM tbl_produto
GROUP BY preco_produto DESC;

# 9. Informar o menor valor de preços dos produtos;
SELECT nome_produto,  MIN(preco_produto)
FROM tbl_produto;
