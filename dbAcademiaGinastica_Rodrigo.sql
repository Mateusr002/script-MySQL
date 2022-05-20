drop database dbAcademiaGinastica;

create database dbAcademiaGinastica;

use dbAcademiaGinastica;

create table tbInstrutor(
codInst int not null auto_increment,
rgInst int not null unique,
nomeInst varchar(45) not null,
nasc date,
titulacao int not null,
primary key(codInst));

create table tbAtividade(
codAti int not null auto_increment,
nomeAti varchar(100),
primary key(codAti));

create table tbTelefoneInstrutor(
codTel int not null auto_increment,
numero int,
tipo varchar(45),
codInst int not null,
primary key(codTel),
foreign key(codInst)references tbInstrutor(codInst));

create table tbTurma(
codTur int not null auto_increment,
horario time,
duracao int,
dataInicio date,
dataFim date,
codAti int not null,
codInst int not null,
primary key(codTur),
foreign key(codAti)references tbAtividade(codAti),
foreign key(codInst)references tbInstrutor(codInst));

create table tbAluno(
codMat int not null auto_increment,
codTur int not null,
dataMat date,
nome varchar(45),
endAluno text,
telAluno int,
dataNasc date,
altura decimal(9,2),
peso decimal(9,2),
primary key(codMat),
foreign key(codTur)references tbTurma(codTur));

create table tbMatricula(
codMat int not null,
codTur int not null,
foreign key(codMat)references tbAluno(codMat),
foreign key(codTur)references tbTurma(codTur));

create table tbChamada(
codCham int not null auto_increment,
data date,
presente bool default false check(presente = false or presente = true),
codMat int not null,
codTur int not null,
primary key(codCham),
foreign key(codMat)references tbMatricula(codMat),
foreign key(codTur)references tbTurma(codTur));

insert into tbInstrutor(rgInst, nomeInst, nasc, titulacao)
	values(321465978, "Carlos Gomes Barbosa", "2000/12/12",132456);
insert into tbInstrutor(rgInst, nomeInst, nasc, titulacao)
	values(321465897, 'Joaquina Joana', '1999/02/21', 123465);
insert into tbInstrutor(rgInst, nomeInst, nasc, titulacao)
	values(312465978, 'Luisa Luana', '2001/05/20', 132464);
insert into tbInstrutor(rgInst, nomeInst, nasc, titulacao)
	values(321466978, 'Roberto Luis', '1998/06/21', 321465);
insert into tbInstrutor(rgInst, nomeInst, nasc, titulacao)
	values(321465798, 'Eduardo Dionisio', '1997/12/20', 132456);

insert into tbAtividade(nomeAti)
	values('Supino');
insert into tbAtividade(nomeAti)
	values('Rosca');
insert into tbAtividade(nomeAti)
	values('Rosca Alternada');
insert into tbAtividade(nomeAti)
	values('Abdominal');
insert into tbAtividade(nomeAti)
	values('Agachamento');

insert into tbTelefoneInstrutor(numero, tipo, codInst)
	values(997843214, 'celular', 1);
insert into tbTelefoneInstrutor(numero, tipo, codInst)
	values(946513127, 'residencial', 2);
insert into tbTelefoneInstrutor(numero, tipo, codInst)
	values(946513124, 'celular', 3);
insert into tbTelefoneInstrutor(numero, tipo, codInst)
	values(997843214, 'celular', 4);
insert into tbTelefoneInstrutor(numero, tipo, codInst)
	values(965472134, 'residencial', 5);

insert into tbTurma(horario, duracao, dataInicio, dataFim, codAti, codInst)
	values('09:30:00', 2, '2022/06/06', '2023/06/06', 1, 2);
insert into tbTurma(horario, duracao, dataInicio, dataFim, codAti, codInst)
	values('09:00:00', 2, '2022/07/06', '2023/07/06', 3, 1);
insert into tbTurma(horario, duracao, dataInicio, dataFim, codAti, codInst)
	values('10:30:00', 4, '2022/05/02', '2023/05/02', 2, 4);
insert into tbTurma(horario, duracao, dataInicio, dataFim, codAti, codInst)
	values('08:00:00', 1, '2022/06/10', '2023/06/10', 4, 5);
insert into tbTurma(horario, duracao, dataInicio, dataFim, codAti, codInst)
	values('11:30:00', 2, '2022/10/06', '2023/10/06', 5, 3);

insert into tbAluno(codTur, dataMat, nome, endAluno, telAluno, dataNasc, altura, peso)
	values(1, '2022/05/06', 'Geovanni Gomes', 'Rua Moenda', 946513214, '1999/12/05', 1.80, 78.50);
insert into tbAluno(codTur, dataMat, nome, endAluno, telAluno, dataNasc, altura, peso)
	values(2, '2022/06/06', 'Leticia Abreu', 'Rua Luar', 946787978, '1999/06/11', 1.60, 56.50);
insert into tbAluno(codTur, dataMat, nome, endAluno, telAluno, dataNasc, altura, peso)
	values(3, '2022/07/06', 'Luana Julia', 'Rua Sertao', 997844512, '2001/11/06', 1.75, 70.50);
insert into tbAluno(codTur, dataMat, nome, endAluno, telAluno, dataNasc, altura, peso)
	values(4, '2022/08/06', 'Gabriel Luis', 'Rua Feitico', 997846512, '1998/10/25', 1.85, 80.50);
insert into tbAluno(codTur, dataMat, nome, endAluno, telAluno, dataNasc, altura, peso)
	values(5, '2022/09/06', 'Julia Carvalho', 'Rua Maiorca', 997846512, '2000/09/15', 1.65, 45.50);

insert into tbMatricula(codMat, codTur)
	values(1, 1);
insert into tbMatricula(codMat, codTur)
	values(2, 2);
insert into tbMatricula(codMat, codTur)
	values(3, 3);
insert into tbMatricula(codMat, codTur)
	values(4, 4);
insert into tbMatricula(codMat, codTur)
	values(5, 5);

insert into tbChamada(data, presente, codMat, codTur)
	values('2022/06/08', false, 1, 1);
insert into tbChamada(data, presente, codMat, codTur)
	values('2022/06/10', true, 2, 2);
insert into tbChamada(data, presente, codMat, codTur)
	values('2022/06/07', false, 3, 3);
insert into tbChamada(data, presente, codMat, codTur)
	values('2022/06/11', true, 4, 4);
insert into tbChamada(data, presente, codMat, codTur)
	values('2022/06/22', false, 5, 5);

select * from tbInstrutor;
select * from tbAtividade;
select * from tbTelefoneInstrutor;
select * from tbTurma;
select * from tbAluno;
select * from tbMatricula;
select * from tbChamada;