create database escola;

use escola;

####### TABELA DE CURSO ############
create table tbl_curso(
cod_curso int(10) unsigned auto_increment primary key,
nome_curso varchar(250) not null,
descricao_curso text not null,
carga_horaria_curso decimal(10,2)
);

######## TABELA DE DISCIPLINA ############
create table tbl_disciplina(
cod_disciplina int(10) unsigned auto_increment primary key,
cod_curso int(10) unsigned not null,
nome_disciplina varchar(250) not null,
descricao_disciplina text not null,
carga_horaria_disciplina decimal(10,2),

# CRIAÇÃO DA CHAVE ESTRANGEIRA DENTRO DA TABELA
constraint fk_curso 
foreign key (cod_curso) 
references tbl_curso(cod_curso)

# COMANDOS PARA ATUALIZAR A TABELA QUANDO DELETARMOS ALGO, POR EX: UMA DISCIPLINA
# NÃO É USUAL E NEM SEGURO DE SER UTILIZADO
# ON UPDATE CASCADE
# ON DELETE CASCADE
);

# PODEMOS CRIAR A CHAVE ESTRANGEIRA DE DUAS FORMAS
	# NO MOMENTO QUE CRIAMOS A TABELA
	# NO MOMENTO, APÓS A CRIAÇÃO DA TABELA
    
# COMANDOS PARA ATUALIZAR A TABELA QUANDO DELETARMOS POR EX: UMA DISCIPLINA
# ON UPDATE CASCADE
# ON DELETE CASCADE

# INSERÇÃO DE DADOS tbl_curso
insert into tbl_curso (nome_curso, descricao_curso, carga_horaria_curso)
values
('1°DS', 'Desenvolvimento de Sistemas', '500'),
('2°DS', 'Desenvolvimento de Sistemas', '500'),
('3°DS', 'Desenvolvimento de Sistemas', '500');

select * from tbl_curso;

# INSERÇÃO DE DADOS tbl_disciplina
insert into tbl_disciplina (cod_curso, nome_disciplina, descricao_disciplina, carga_horaria_disciplina)
values
(1, 'LTT','LINGUAGEM TECNOLOGIA E TRABALHO', 40),
(1, 'PA', 'PROGRAMAÇÃO DE ALGORITMOS', 80),
(1, 'BD-1', 'BANCO DE DADOS 1', 40),
(1, 'APS', 'ANALISE DE PROJETOS E SISTEMA', 40),
(1, 'DD', 'DESIGN DIGITAL', 40),
(1, 'PW-1', 'PROGRAMACAO WEB 1', 80),
(1, 'FI', 'FUNDAMENTOS DA INFORMÁTICA', 40),
(1, 'TP', 'TÉCNICAS DE PROGRAMAÇÃO', 40);

# JOIN is a method of linking data between one (self-join) or more tables based on values of the common column between the tables.
# INNER JOIN É UMA SELECT QUE É CONSTRUIDA, ONDE ENVOLVE DUAS TABELAS
	# DEVE EXISTER UMA CHAVE ESTRANGEIRA ENTRE ELAS
    # VAI TRAZER SOMENTE OS DADOS QUE SE ENCONTRAM (INTERSECÇÃO) NAS DUAS TABELAS
	# SEMPRE COMEÇAMOS PELO QUE CHAMAMOS DE TABELA DE INFILTRAÇÃO, SEMPRE É A TABELA QUE CARREGA A CHAVE ESTRANGEIRA OU A QUE MAIS CARREGA CHAVES ESTRANGEIRAS

# INNER JOIN SEM CRITERIO DE PESQUISA
select * from tbl_disciplina
inner join tbl_curso;

# INNER JOIN COM CRITERIO DE PESQUISA
select * from tbl_disciplina
inner join tbl_curso
on tbl_disciplina.cod_curso = tbl_curso.cod_curso;
# podemos ler o ON como QUANDO
# é necessário específicar a tabela da qual o campo será pesquisado, e utilizando o "nome-da-tabela.nome-da-coluna"

# INNER JOIN COM CRITERIO DE PESQUISA / APELIDANDO AS TABELAS
select * from tbl_disciplina td # td = tabela disciplina
inner join tbl_curso tc # tc = tabela curso
on td.cod_curso = tc.cod_curso;

# INNER JOIN - NOVOS CAMPOS PARA PESQUISA
select nome_disciplina, descricao_disciplina, carga_horaria_disciplina, nome_curso
from tbl_disciplina td
inner join tbl_curso tc
on td.cod_curso = tc.cod_curso;

# INNER JOIN - NOVOS CAMPOS PARA PESQUISA COM APELIDOS
select 
td.nome_disciplina, 
td.descricao_disciplina, 
td.carga_horaria_disciplina, 
tc.nome_curso
from tbl_disciplina td
inner join tbl_curso tc
on td.cod_curso = tc.cod_curso;

# INNER JOIN - UTILIZANDO WHERE
select 
td.nome_disciplina, 
td.descricao_disciplina, 
td.carga_horaria_disciplina, 
tc.nome_curso
from tbl_disciplina td
inner join tbl_curso tc
on td.cod_curso = tc.cod_curso
where td.cod_disciplina = 3;

# INNER JOIN - UTILIZANDO ORDER BY
select 
td.nome_disciplina, 
td.descricao_disciplina, 
td.carga_horaria_disciplina, 
tc.nome_curso
from tbl_disciplina td
inner join tbl_curso tc
on td.cod_curso = tc.cod_curso
order by td.nome_disciplina asc;

# INNER JOIN - COM MAIS DE UMA TABELA DENTRO DA MESMA SELECT
select 
td.nome_disciplina, 
td.descricao_disciplina, 
td.carga_horaria_disciplina, 
tc.nome_curso
from tbl_disciplina td
inner join tbl_curso tc
#suprimir o ON com USING
using (cod_curso);