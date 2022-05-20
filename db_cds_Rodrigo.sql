drop database dbCds;

create database dbCds;

use dbCds;

create table tbArtistas(
codArt int not null auto_increment,
nomeArt varchar(100) not null unique,
primary key(codArt));

create table tbGravadoras(
codGrav int not null auto_increment,
nomeGrav varchar(100) not null unique,
primary key(codGrav));

create table tbCategorias(
codCat int not null auto_increment,
nomeCat varchar(100) not null unique,
primary key(codCat));

create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key(siglaEst));

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
endFunc varchar(50) not null,
salFunc decimal(9,2) not null default 0 check(salFunc >= 0),
sexoFunc char(1) not null default 'F' check(sexoFunc = 'F' or sexoFunc = 'M'),
primary key(codFunc));

create table tbCidades(
codCid int not null auto_increment,
nomeCid varchar(50) not null,
siglaEst char(2) not null,
primary key(codCid),
foreign key(siglaEst)references tbEstados(siglaEst));

create table tbClientes(
codCli int not null auto_increment,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
sexoCli char(1) not null default 'F' check(sexoCli = 'F' or sexoCli = 'M'),
codCid int not null,
primary key(codCli),
foreign key(codCid)references tbCidades(codCid));

create table tbConjuge(
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null,
sexoConj char(1) not null default 'F' check(sexoConj = 'F' or sexoConj = 'M'),
codCli int not null,
primary key(codCli),
foreign key(codCli)references tbClientes(codCli));

create table tbDependentes(
codDep int not null auto_increment,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F' check(sexoDep = 'F' or sexoDep ='M'),
codFunc int not null,
primary key(codDep),
foreign key(codFunc)references tbFuncionarios(codFunc));

create table tbTitulos(
codTit int not null auto_increment,
nomeCD varchar(50) not null unique,
valCD decimal(9,2) not null check(valCD >= 0),
qtdEstq int not null check(qtdEstq >= 0),
codGrav int not null,
codCat int not null,
primary key(codTit),
foreign key(codGrav)references tbGravadoras(codGrav),
foreign key(codCat)references tbCategorias(codCat));

create table tbPedidos(
numPed int not null auto_increment,
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed >= 0),
codCli int not null,
codFunc int not null,
primary key(numPed),
foreign key(codCli)references tbClientes(codCli),
foreign key(codFunc)references tbFuncionarios(codFunc));

create table tbTitulosPedido(
qtdCD int not null check(qtdCD >= 0),
valCD decimal(9,2) not null check(valCD >= 0),
numPed int not null,
codTit int not null,
foreign key(numPed)references tbPedidos(numPed),
foreign key(codTit)references tbTitulos(codTit));

create table tbTitulosArtistas(
codTit int not null,
codArt int not null,
foreign key(codTit)references tbTitulos(codTit),
foreign key(codArt)references tbArtistas(codArt));

insert into tbArtistas(nomeArt)
	values("Marisa Monte");
insert into tbArtistas(nomeArt)
	values("Gilberto Gil");
insert into tbArtistas(nomeArt)
	values("Caetano Veloso");
insert into tbArtistas(nomeArt)
	values("Milton Nascimento");
insert into tbArtistas(nomeArt)
	values("Legiao Urbana");
insert into tbArtistas(nomeArt)
	values("The Beatles");
insert into tbArtistas(nomeArt)
	values("Rita Lee");

insert into tbGravadoras(nomeGrav)
	values("Polygram");
insert into tbGravadoras(nomeGrav)
	values("Emi");
insert into tbGravadoras(nomeGrav)
	values("Som Livre");
insert into tbGravadoras(nomeGrav)
	values("Som Music");

insert into tbCategorias(nomeCat)
	values("MPB");
insert into tbCategorias(nomeCat)
	values("Trilha Sonora");
insert into tbCategorias(nomeCat)
	values("Rock Internacional");
insert into tbCategorias(nomeCat)
	values("Rock Nacional");

insert into tbEstados(siglaEst, nomeEst)
	values("SP", "Sao Paulo");
insert into tbEstados(siglaEst, nomeEst)
	values("MG", "Minas Gerais");
insert into tbEstados(siglaEst, nomeEst)
	values("RJ", "Rio de Janeiro");
insert into tbEstados(siglaEst, nomeEst)
	values("ES", "Espirito Santo");

insert into tbCidades(siglaEst, nomeCid)
	values("SP", "Sao Paulo");
insert into tbCidades(siglaEst, nomeCid)
	values("SP", "Sorocaba");
insert into tbCidades(siglaEst, nomeCid)
	values("SP", "Jundiai");
insert into tbCidades(siglaEst, nomeCid)
	values("SP", "Americana");
insert into tbCidades(siglaEst, nomeCid)
	values("SP", "Araraquara");
insert into tbCidades(siglaEst, nomeCid)
	values("MG", "Ouro Preto");
insert into tbCidades(siglaEst, nomeCid)
	values("ES", "Cachoeira do Itapemirim");

insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Jose Nogueira", "Rua A", 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Angelo Pereira", "Rua B", 2000.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Alem Mar Paranhos", "Rua C", 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Catarina Souza", "Rua D", 892.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Vagner Costa", "Rua E", 950.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Antenor da Costa", "Rua F", 1582.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Maria Amelia de Souza", "Rua G", 1552.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Paulo Roberto Silva", "Rua H", 3250.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Fatima Souza", "Rua I", 1632.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli)
	values(1, "Joel da Rocha", "Rua J", 2000.00, 'M');

insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj)
	values(1, "Carla Nogueira", 2500.00, "F");
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj)
	values(2, "Emilia Pereira", 5500.00, "F");
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj)
	values(6, "Altiva da Costa", 3000.00, "F");
insert into tbConjuge(codCli, nomeConj, rendaConj, sexoConj)
	values(7, "Carlos de Souza", 3250.00, "M");

insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFunc)
	values("Vania Gabriela Pereira", "Rua A", 2500.00, "F");
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFunc)
	values("Norberto Pereira da Silva", "Rua B", 3000.00, "M");
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFunc)
	values("Olavo Linhares", "Rua C", 580.00, "M");
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFunc)
	values("Paula da Silva", "Rua D", 3000.00, "F");
insert into tbFuncionarios(nomeFunc, endFunc, salFunc, sexoFunc)
	values("Rolando Rocha", "Rua E", 2000.00, "M");

insert into tbDependentes(codFunc, nomeDep, sexoDep)
	values(1, "Ana Pereira", "F");
insert into tbDependentes(codFunc, nomeDep, sexoDep)
	values(1, "Roberto Pereira", "M");
insert into tbDependentes(codFunc, nomeDep, sexoDep)
	values(1, "Celso Pereira", "M");
insert into tbDependentes(codFunc, nomeDep, sexoDep)
	values(1, "Brisa Linhares", "F");
insert into tbDependentes(codFunc, nomeDep, sexoDep)
	values(1, "Mari Sol Linhares", "F");
insert into tbDependentes(codFunc, nomeDep, sexoDep)
	values(1, "Sonia da Silva", "F");

insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 1, "Tribalistas", 30.00, 1500);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 2, "Tropicalia", 50.00, 500);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 1, "Aquele Abraco", 50.00, 600);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 2, "Refazenda", 60.00, 1000);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 3, "Totalmente Demais", 50.00, 2000);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 3, "Travessia", 55.00, 500);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(1, 2, "Courage", 30.00, 200);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(4, 3, "Legiao Urbana", 20.00, 100);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(3, 2, "The Beatles", 30.00, 300);
insert into tbTitulos(codCat, codGrav, nomeCD, valCD, qtdEstq)
	values(4, 1, "Rita Lee", 30.00, 500);

insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(1, 2, "02/05/02", 1500.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(3, 4, "02/05/02", 50.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(4, 5, "02/06/02", 100.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(1, 4, "02/02/03", 200.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(7, 5, "02/03/03", 300.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(4, 4, "02/03/03", 100.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(5, 5, "02/03/03", 50.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(8, 2, "02/02/03", 50.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(2, 2, "02/03/03", 2000.00);
insert into tbPedidos(codCli, codFunc, dataPed, valPed)
	values(7, 1, "02/03/03", 3000.00);

insert into tbTitulosArtistas(codTit, codArt)
	values(1,1);
insert into tbTitulosArtistas(codTit, codArt)
	values(2,2);
insert into tbTitulosArtistas(codTit, codArt)
	values(3,2);
insert into tbTitulosArtistas(codTit, codArt)
	values(4,2);
insert into tbTitulosArtistas(codTit, codArt)
	values(5,3);
insert into tbTitulosArtistas(codTit, codArt)
	values(6,4);
insert into tbTitulosArtistas(codTit, codArt)
	values(7,4);
insert into tbTitulosArtistas(codTit, codArt)
	values(8,5);
insert into tbTitulosArtistas(codTit, codArt)
	values(9,6);
insert into tbTitulosArtistas(codTit, codArt)
	values(10,7);

insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(1,1,2,30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(1,2,3,20.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(2,1,1,50.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(2,2,3,30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(3,1,2,40.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(4,2,3,30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(5,1,2,25.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(6,2,3,30.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(6,2,1,35.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(7,4,2,55.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(8,1,4,60.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(9,2,3,15.00);
insert into tbTitulosPedido(numPed, codTit, qtdCD, valCD)
	values(10,7,2,15.00);


select * from tbArtistas order by codArt;
select * from tbGravadoras order by codGrav;
select * from tbCategorias order by codCat;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbFuncionarios;
select * from tbDependentes;
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulosArtistas;
select * from tbTitulosPedido;

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 

select tit.nomeCD, grav.nomeGrav
from tbTitulos as tit
inner join tbGravadoras as grav
on grav.codGrav = tit.codTit;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD. 

select tit.nomeCD, cat.nomeCat
from tbTitulos as tit
inner join tbCategorias as cat
on cat.codCat = tit.codTit;

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.

select tit.nomeCD, grav.nomeGrav, cat.nomeCat
from tbTitulos as tit
inner join tbGravadoras as grav
on grav.codGrav = tit.codTit
inner join tbCategorias as cat
on cat.codCat = tit.codTit;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez.

select cli.nomeCli, tit.nomeCD
from tbClientes as cli
inner join tbTitulos as tit
on tit.codTit = cli.codCli;

--5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido.

select func.nomeFunc, titped.numPed, ped.dataPed, ped.valPed, cli.nomeCli
from tbFuncionarios as func
inner join tbTitulosPedido as titped
on titped.numPed = func.codFunc
inner join tbPedidos as ped
on ped.numPed = func.codFunc
inner join tbClientes as cli
on cli.codCli = func.codFunc;

-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada funcionário.

select func.nomeFunc, dep.nomeDep
from tbFuncionarios as func
inner join tbDependentes as dep
on dep.codDep = func.codFunc;

-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente. 

select func.nomeFunc, con.nomeConj
from tbFuncionarios as func
inner join tbConjuge as con
on con.codCli = func.codFunc;

-- 8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes de seus cônjuges também.

select cli.nomeCli, con.nomeConj
from tbClientes as cli
inner join tbConjuge as con
on con.codCli = cli.codCli;

-- 9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez, valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada pedido.

select cli.nomeCli, con.nomeConj, titped.numPed, ped.valPed, func.codFunc
from tbClientes as cli
inner join tbConjuge as con
on con.codCli = cli.codCli
inner join tbTitulosPedido as titped
on titped.numPed = cli.codCli
inner join tbPedidos as ped
on ped.valPed = cli.codCli
inner join tbFuncionarios as func
on func.codFunc = cli.codCli;