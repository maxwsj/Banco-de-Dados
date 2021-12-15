#INSERÇÃO DE DADOS NA TABELA tbl_especialidade:
INSERT INTO tbl_especialidade (nome_especialidade)
VALUES('NEUROLOGIA');

INSERT INTO tbl_especialidade (nome_especialidade)
VALUES('ORTOPEDIA');

#INSERÇÃO DE DADOS NA TABELA tbl_especialidade:
INSERT INTO tbl_especialidade (nome_especialidade)
VALUES('OFTAMOLOGIA');

INSERT INTO tbl_especialidade (nome_especialidade)
VALUES('PODOLOGIA');

SELECT * FROM tbl_especialidade;


#TABELA DE TESTE VACINAÇÃO EXPLICANDO A UTILIZAÇÃO DOS OPERADORES LÓGICOS AND OU OR
CREATE DATABASE vacinacao;
USE vacinacao;

CREATE TABLE tbl_pessoas(
cod_pessoa int unsigned auto_increment primary key,
nome_pessoa varchar(500) not null,
idade int not null
);



SELECT * FROM pessoas;


INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Ana', 30);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Jorge', 35);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Fernanda', 40);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Yure', 45);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Robson', 50);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Carol', 60);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Andre', 70);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Kevin', 80);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Gustavo', 79);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Anderson', 78);
INSERT INTO tbl_pessoas(nome_pessoa, idade)
VALUES ('Caroline', 90);

SELECT * FROM tbl_pessoas;

SELECT * FROM tbl_pessoas WHERE
idade >= 75 AND idade <= 89;

SELECT * FROM tbl_pessoas WHERE
idade >= 75 OR idade <= 89;

