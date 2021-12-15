#COMENTÁRIO DE LINHA
/*
20-09-2021
COMENTÁRIO DE BLOCO
BD-2 - ETEC DE BARUERI
*/

#CRIAÇÃO DO BANCO DE DADOS:
CREATE DATABASE centro_cirurgico;

#SELECIONA (HABILITAR/ATIVAR) O BANCO DE DADOS:
USE centro_cirurgico;

#LISTAR TODAS AS TABELAS DA BASE DE DADOS ATIVA:
show tables;

#CRIAÇÃO DAS TABELAS:

#CRIAÇÃO DA TABELA tbl_especialidade:
CREATE TABLE tbl_especialidade(

	cod_especialidade INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nome_especialidade VARCHAR(100) NOT NULL

);

SHOW TABLES;

DESCRIBE tbl_especialidade;

#CRIAÇÃO DA TABELA tbl_paciente:
CREATE TABLE tbl_paciente(

	cod_paciente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nome_paciente VARCHAR(500) NOT NULL,
	telefone_paciente VARCHAR(10) NOT NULL,
	celular_paciente VARCHAR(11) NOT NULL,
	email_paciente VARCHAR(100) NOT NULL,
	nome_responsavel VARCHAR(500) NULL,
	telefone_responsavel VARCHAR(10) NULL

);

#CRIAÇÃO DA TABELA tbl_medico:
CREATE TABLE tbl_medico(

	cod_medico INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_especialidade INT UNSIGNED NOT NULL,
	nome_medico VARCHAR(500) NOT NULL,
	email_medico VARCHAR(100) NOT NULL,
	telefone_medico VARCHAR(10) NOT NULL,
	celular_medico VARCHAR(11) NOT NULL

);

#CRIAÇÃO DA TABELA tbl_insumos:
CREATE TABLE tbl_insumos(

	cod_isumos INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cod_paciente INT UNSIGNED NOT NULL,
    nome_insumo VARCHAR(100) NOT NULL,
    quantidade_insumo DECIMAL(10,2)

);

#CRIAÇÃO DA TABELA tbl_sala:
CREATE TABLE tbl_sala (
    cod_sala INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nro_sala VARCHAR(10) NOT NULL,
    cod_especialidade INT UNSIGNED NOT NULL
);

#CRIAÇÃO DA TABELA tbl_agenda:
CREATE TABLE tbl_agenda(

	cod_agenda INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cod_sala INT UNSIGNED NOT NULL,
    cod_medico INT UNSIGNED NOT NULL,
    cod_paciente INT UNSIGNED NOT NULL,
    data_cirurgia VARCHAR(10),
    status_cirurgia ENUM('AGENDADO', 'CONCLUÍDO', 'CANCELADO')

);

#ALTERANDO A TABELA tbl_sala PARA A CRIAÇÃO
#DA CHAVE ESTRANGEIRA
ALTER TABLE tbl_sala ADD CONSTRAINT FK_ESPECIALIDADE
FOREIGN KEY (cod_especialidade)
REFERENCES tbl_especialidade (cod_especialidade);

#CRIAÇÃO DA CHAVE ESTRANGEIRA NA TABELA
#tbl_insumos.
ALTER TABLE tbl_insumos ADD CONSTRAINT FK_PACIENTE
FOREIGN KEY (cod_paciente)
REFERENCES tbl_paciente(cod_paciente);

#CRIAÇÃO DA CHAVE ESTRANGEIRA NA TABELA
#tbl_medico.
ALTER TABLE tbl_medico ADD CONSTRAINT FK_MEDICO_ESPECIALIDADE
FOREIGN KEY (cod_especialidade)
REFERENCES tbl_especialidade (cod_especialidade);

#FK_SALA_AGENDA
ALTER TABLE tbl_agenda ADD CONSTRAINT FK_SALA_AGENDA
FOREIGN KEY (cod_sala)
REFERENCES tbl_sala (cod_sala);

#FK_MEDICO_AGENDA
ALTER TABLE tbl_agenda ADD CONSTRAINT FK_MEDICO_AGENDA
FOREIGN KEY (cod_medico)
REFERENCES tbl_medico (cod_medico);

#FK_PACIENTE_AGENDA
ALTER TABLE tbl_agenda ADD CONSTRAINT FK_PACIENTE_AGENDA
FOREIGN KEY (cod_paciente)
REFERENCES tbl_paciente (cod_paciente);







