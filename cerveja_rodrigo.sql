drop database dbcervejaria;

create database dbcervejaria;

show databases;

use dbcervejaria;

show tables;


create table venda(
codigo bigint,
data_criacao datetime,
valor_frete decimal(10,2),
valor_desconto decimal(10,2),
valor_total decimal(10,2),
status varchar(30),
observacao varchar(200),
data_hora_entrega datetime,
codigo_cliente bigint,
codigo_usuario bigint
);

create table item_venda(
codigo bigint,
qualidade int,
valor_unitario decimal(10,2),
codigo_cerveja bigint,
codigo_venda bigint
);

create table cerveja(
codigo bigint,
sku varchar(50),
nome varchar(80),
descricao text,
valor decimal(10,2),
teor_alcoolico decimal(10,2),
comissao decimal(10,2),
sabor  varchar(50),
origem varchar(50),
codigo_estilo bigint,
quantidade_estoque int,
foto varchar(100),
content_type varchar(100)
);

create table estilo(
codigo bigint,
nome varchar(50)
);

create table cliente(
codigo bigint,
nome varchar(80),
tipo_pessoa varchar(15),
cpf_cnpj char(30),
telefone varchar(20),
email varchar(50),
logradouro varchar(50),
numero char(15),
complemento varchar(20),
cep char(15),
codigo_cidade bigint
);

create table cidade(
codigo bigint,
nome varchar(50),
codigo_estado bigint
);

create table estado(
codigo bigint,
nome varchar(50),
sigla char(2)
);

create table usuario(
codigo bigint,
nome varchar(50),
email varchar(50),
senha char(120),
ativo int,
data_nascimento date
);

insert into usuario values(1,'Lucas Marques','lucas@gmail.com','123456',1,'2001/01/01');
insert into usuario values(2,'Daniel Molo','dani@gmail.com','654321',2,'2002/02/02');
insert into usuario values(3,'Voce Sabia?','VCsabia@gmail.com','321465',3,'2003/03/03');
insert into usuario values(4,'Vito Palmito','vito@gmail.com','465978',4,'2004/04/04');
insert into usuario values(5,'MC vv','VV@gmail.com','789321',5,'2005/05/05');
insert into usuario values(6,'Yun Li','lixo@gmail.com','319781',6,'2006/06/06');
insert into usuario values(7,'Lucas Hype','hype@gmail.com','314657',7,'2007/07/07');
insert into usuario values(8,'Lil Lixo','lixo@gmail.com','465871',8,'2008/08/08');
insert into usuario values(9,'Lorentralha','tralha@gmail.com','312465',9,'2009/09/09');
insert into usuario values(10,'Leandro Bife','bife@gmail.com','978321',10,'2010/10/10');

create table usuario_grupo(
codigo_usuario bigint,
codigo_grupo bigint
);

create table grupo(
codigo bigint,
nome varchar(50)
);

create table grupo_permissao(
codigo_grupo bigint,
codigo_permissao bigint
);

create table permissao(
codigo bigint,
nome varchar(50)
);

create table schema_version(
installed_rank int,
version varchar(50),
description varchar(200),
type varchar(20),
script varchar(1000),
checksum int(11),
installed_by varchar(100),
installed_on timestamp,
execution_time int,
sucess int
);

desc venda;

desc item_venda;

desc cerveja;

desc estilo;

desc cliente;

desc cidade;

desc estado;

desc usuario;

desc usuario_grupo;

desc grupo;

desc grupo_permissao;

desc permissao;

desc schema_version;

select * from usuario;