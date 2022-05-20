drop database db_minhadb;

create database db_minhadb;

use db_minhadb;

create table tbTelefones(
codigo int,
nome varchar(50),
telefone char(15)
);

-- Inserindo registros na tabela tbTelefones

insert into tbTelefones(codigo,nome,telefone)
	values(1,'Marco Teixeira','(11)1111-111');

-- Outra forma de fazer insert

insert into tbTelefones values(2,'alguem','(11)2222-222');

insert into tbTelefones values(3,'maisalguem','(11)3333-333');

insert into tbTelefones values(4,'outroalguem','(11)4444-444');

insert into tbTelefones values(5,'alguemamais','(11)5555-555');

-- Visualizando os registros das tabelas

select * from tbTelefones;

-- Para apagar um registro

--delete from tbTelefones where codigo = 1;