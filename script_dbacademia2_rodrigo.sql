drop database dbAcademia2;

create database dbAcademia2;

use dbAcademia2;

create table tbAtividade(
CodAtividade int not null auto_increment,
Atividade varchar(45) not null,
primary key(CodAtividade));

create table tbInstrutor(
CodInstrutor int not null auto_increment,
RGInstrutor varchar(45) not null unique,
Nome varchar(45) not null,
Nascimento date not null,
Titulacao varchar(45) not null,
Telefone varchar(45) not null,
primary key(CodInstrutor));

create table tbMonitor(
CodMonitor int not null auto_increment,
NomeMonitor varchar(45) not null,
primary key(CodMonitor));

create table tbTurma(
CodTurma int not null auto_increment,
Quant_Alunos int not null,
Horario_Aula datetime not null,
Duracao_Aula datetime not null,
Data_Inicio date not null,
Data_Fim date not null,
CodAtividade int not null,
CodInstrutor int not null,
CodMonitor int not null,
primary key(CodTurma),
foreign key(CodInstrutor)references tbInstrutor(CodInstrutor),
foreign key(CodMonitor)references tbMonitor(CodMonitor),
foreign key(CodAtividade)references tbAtividade(CodAtividade));

create table tbAluno(
CodAluno int not null auto_increment,
Data_Matricula date not null,
Nome varchar(45) not null,
logradouro varchar(100) not null,
numero char(10) not null,
cep char(9) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
telefone char(100) not null,
nascimento date not null,
altura decimal(9,2) not null,
peso decimal(9,2) not null,
CodTurma int not null,
primary key(CodAluno),
foreign key(CodTurma)references tbTurma(CodTurma));

create table tbRegistro(
CodRegistro int not null auto_increment,
Ausencia int default 0 check(Ausencia >=0),
CodTurma int not null,
CodAluno int not null,
primary key(CodRegistro),
foreign key(CodTurma)references tbTurma(CodTurma),
foreign key(CodAluno)references tbAluno(CodAluno));

insert into tbAtividade(Atividade)
	values('Supino');

insert into tbInstrutor(RGInstrutor, Nome, Nascimento, Titulacao, Telefone)
	values('32112546-4', 'Roberto Gomes', '1999/12/9', 'uma coisa ai', '94564-4565');

insert into tbMonitor(NomeMonitor)
	values('Cleitin Souza');

insert into tbTurma(Quant_Alunos, Horario_Aula, Duracao_Aula, Data_Inicio, Data_Fim, CodAtividade, CodInstrutor, CodMonitor)
	values(5, '17:09:00', '01:30:00', '2020/03/10', '2022/02/10', 1, 1, 1);

insert into tbAluno(Data_Matricula, Nome, logradouro, numero, cep, bairro, cidade, estado, telefone, nascimento, altura, peso, CodTurma)
	values('2022/2/4', 'Vito Palmito', 'Rua Moenda Velha', 21, 12345-566, 'Jardim Guaruja', 'Sao Paulo', 'SP', 94564-5645, '1987/12/4', 1.78, 80.0, 1);

select * from tbAtividade;
select * from tbInstrutor;
select * from tbMonitor;
select * from tbTurma;
select * from tbAluno;

select tur.Quant_Alunos, tur.Horario_Aula, tur.Data_Inicio, inst.Nome, inst.Titulacao
from tbInstrutor as inst
inner join tbTurma as tur
on tur.CodTurma = inst.CodInstrutor;
