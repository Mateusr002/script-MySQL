drop database dbmercearia;

create database dbmercearia;

show databases;

use dbmercearia;

show tables;

create table tbvenda(
id int,
valor_total decimal(10,2),
data datetime,
cliente_id int,
vendedor_id int,
pagamento_id int
);

create table tbcliente(
id int,
nome varchar(45),
telefone char(11),
email varchar(45)
);

create table tbvenda_has_produto(
venda_id int,
produto_id int
);

create table tbproduto(
id int,
nome varchar(45),
preco decimal(10,2),
qtd_estoque char(45),
categoria_id int,
fornecedores_id int
);

create table tbvendedor(
id int,
nome varchar(45)
);

create table tbpagamento(
id int,
form_pagamento varchar(45)
);

create table tbcategoria(
id int,
nome varchar(45)
);

create table tbfornecedores(
id int,
cnpj char(45),
nome varchar(45)
);

show tables;

desc tbvenda;

desc tbcliente;

desc tbvenda_has_produto;

desc tbproduto;

desc tbvendedor;

desc tbpagamento;

desc tbcategoria;

desc tbfornecedores;