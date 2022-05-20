drop database dbPadaria;

create database dbPadaria;

use dbPadaria;

create table tbfuncionarios(
codfunc int not null auto_increment,
nome varchar(200) not null,
email varchar(200) not null,
cpf char(14) not null unique,
salario decimal(9,2) not null default 0.0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
ctps char(6) default '000000',
logradouro varchar(200),
numero char(10),
bairro varchar(200),
cep char(9),
primary key(codfunc));

create table tbFornecedores(
codforn int not null auto_increment,
nome varchar(200) not null,
cnpj char(14) not null unique,
inscrest char(9) not null unique,
email varchar(200) not null,
primary key(codforn));

create table tbClientes(
codCli int not null auto_increment,
nome varchar(200) not null,
cpf char(14) not null unique,
email varchar(200) not null,
telCel char(10),
primary key(codCli));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(20) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codUsu),
foreign key(codfunc)references tbfuncionarios(codfunc));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(200) not null,
valor decimal(9,2) not null default 0.0 check(valor >=0),
dataEntrada datetime not null,
validade datetime not null,
codUsu int not null,
codforn int not null,
primary key(codProd),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codforn)references tbFornecedores(codforn));

create table tbVendas(
codVenda int not null auto_increment,
codProd int not null,
codUsu int not null,
codCli int not null,
dataVenda datetime,
horaVenda time,
quantidade decimal(9,2) not null default 0.0 check(quantidade >=0),
valor decimal(9,2) not null default 0.0 check(valor >=0),
primary key(codVenda),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli));