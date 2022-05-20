drop database dbClinica;

create database dbClinica;

use dbClinica;

create table tbMedico(
codMedico int not null auto_increment,
nomeMedico varchar(45) not null,
telMedico varchar(10) not null unique,
primary key(codMedico));

create table tbReceitaMedica(
codReceita int not null auto_increment,
descricao varchar(500),
primary key(codReceita));

create table tbPaciente(
codPaciente int not null auto_increment,
nomePaciente varchar(45) not null,
telPaciente varchar(10) not null,
convenio varchar(45),
primary key(codPaciente));

create table tbConsulta(
codConsulta int not null auto_increment,
dataConsulta datetime,
codMedico int not null,
codPaciente int not null,
codReceita int not null,
primary key(codConsulta),
foreign key(codMedico)references tbMedico(codMedico),
foreign key(codReceita)references tbReceitaMedica(codReceita),
foreign key(codPaciente)references tbPaciente(codPaciente));

insert into tbMedico(nomeMedico, telMedico)
	values('Carlos Gomes', '94653-4652');
insert into tbReceitaMedica(descricao)
	values('Tomar todo dia uma dose de Juizo');
insert into tbPaciente(nomePaciente, telPaciente, convenio)
	values('Cintia Alvez', '99786-3214', 'Amil');
insert into tbConsulta(dataConsulta, codMedico, codPaciente, codReceita)
	values('2022/10/12 17:30:00', 1, 1, 1);

desc tbMedico;
desc tbReceitaMedica;
desc tbPaciente;
desc tbConsulta;

select * from tbMedico;
select * from tbReceitaMedica;
select * from tbPaciente;
select * from tbConsulta;