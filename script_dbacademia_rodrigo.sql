drop database dbacademia;

create database dbacademia;

show databases;

use dbacademia;

show tables;

create table aluno(
matricula int,
data_matricula date,
nome varchar(45),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
telefone char(100),
nascimento date,
altura decimal(9,2),
peso decimal(9,2),
id_turma int
);

create table registro(
id_aluno int,
in_turma int,
ausencia int,
id_registro int
);

create table monitor(
id_aluno int
);

create table turma(
id int,
quant_alunos int,
horario_aula datetime,
ducacao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);

create table atividade(
id int,
atividade varchar(45)
);

create table instrutor(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone char(45)
);

desc aluno;

desc registro;

desc monitor;

desc turma;

desc atividade;

desc instrutor;