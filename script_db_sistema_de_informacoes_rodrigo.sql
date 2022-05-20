drop database dbSDInformacoes;

create database dbSDInformacoes;

show databases;

use dbSDInformacoes;

show tables;

create table tb_tipo_sanguineo(
cod_tipo_sanguineo int not null auto_increment,
descricao_tipo varchar(45),
primary key(cod_tipo_sanguineo));

create table tb_produto(
cod_produto int not null auto_increment,
descricao_produto varchar(45),
sigla char(5),
validade int,
lead_time_horas decimal(9,2),
primary key(cod_produto));

create table tb_entradas(
cod_bolsa int not null auto_increment,
data_entrada date,
volume int,
cod_produto int not null,
cod_tipo_sanguineo int not null,
validade date,
primary key(cod_bolsa),
foreign key(cod_tipo_sanguineo)references tb_tipo_sanguineo(cod_tipo_sanguineo),
foreign key(cod_produto)references tb_produto(cod_produto));

create table tb_demanda_mensal(
mes int,
ano int,
demanda int,
previsao decimal(9,2),
cod_tipo_sanguineo int not null,
cod_produto int not null,
foreign key(cod_tipo_sanguineo)references tb_tipo_sanguineo(cod_tipo_sanguineo),
foreign key(cod_produto)references tb_produto(cod_produto));

create table tb_doadores(
identidade int not null,
nome varchar(45),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
cod_tipo_sanguineo int not null,
data_nascimento char(8),
email varchar(45),
telefone char(45),
primary key(identidade),
foreign key(cod_tipo_sanguineo)references tb_tipo_sanguineo(cod_tipo_sanguineo));

create table tb_saida(
cod_bolsa int not null auto_increment,
nome_paciente varchar(100),
nome_hospital varchar(45),
data_saida date,
rt int,
cod_produto int not null,
cod_tipo_sanguineo int not null,
primary key(cod_bolsa),
foreign key(cod_tipo_sanguineo)references tb_tipo_sanguineo(cod_tipo_sanguineo),
foreign key(cod_produto)references tb_produto(cod_produto));

insert into tb_tipo_sanguineo(descricao_tipo)
	values('A+');

insert into tb_produto(descricao_produto, sigla, validade, lead_time_horas)
	values('Sangue', 'SG', '2022/03/12', '12:45:12');

insert into tb_entradas(data_entrada, volume, cod_produto, cod_tipo_sanguineo, validade)
	values('2022/02/26', 52, 1, 1 ,'2022/03/26');

insert into tb_demanda_mensal(mes, ano, demanda, previsao, cod_tipo_sanguineo, cod_produto)
	values(06, 2022, 500, 21.2, 1, 1);

insert into tb_doadores(nome, logradouro, numero, cep, bairro, cidade, estado, cod_tipo_sanguineo, data_nascimento, email, telefone)
	values('Joao Jorege', 'Rua irineu', 777, '07895-265', 'Sua Irma', 'Sao Paulo', 'SP', 1, '2002/02/12', 'JoJo@bizarre.com', '956524653');

insert into tb_saida(nome_paciente, nome_hospital, data_saida, rt, cod_produto, cod_tipo_sanguineo)
	values('Joana Joaquina', 'Scrr Saude', '2022/06/12', 12, 1, 1);

select * from tb_tipo_sanguineo;
select * from tb_produto;
select * from tb_entradas;
select * from tb_demanda_mensal;
select * from tb_doadores;
select * from tb_saida;