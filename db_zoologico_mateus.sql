--  1) Crie uma database chamada ZOOLOGICO. 

create database db_zoologico; 

--  2) Na database ZOOLOGICO, crei uma tabela chamada ANIMAIS com os seguintes 

create table animais(
	codigo int,
	tipo char(15),
	nome char(30),
	idade int,
	valor decimal(10,2));


0
insert into (codigo,tipo,nome,idade,valor) values(2,cachorro,sula,5,300.00);
insert into (codigo,tipo,nome,idade,valor) values(3,cachorro,sarina,7,300.00);
insert into (codigo,tipo,nome,idade,valor) values(4,gato,pipa,2,500.00);
insert into (codigo,tipo,nome,idade,valor) values(5,gato,sarangue,2,500.00);
insert into (codigo,tipo,nome,idade,valor) values(6,gato,clarences,1,500.00);
insert into (codigo,tipo,nome,idade,valor) values(7,coruja,agnes,0,700.00);	
insert into (codigo,tipo,nome,idade,valor) values(8,coruja,arabela,1,700.00);		
insert into (codigo,tipo,nome,idade,valor) values(9,sapo,quash,1,100.00);
insert into (codigo,tipo,nome,idade,valor) values(10,peixe,fish,0,100.00);		

-- 3) Escreva um comando que exiba todas as colunas e todas as linhas da tabela ANIMAIS. 


show tables;

desc animais;

select * from animais;



-- 4) Escreva um comando que exiba apenas as colunas TIPO e NOME da tabela ANIMAIS, 
-- apresentando todos os registros da tabela.

select nome,tipo from animais; 


-- 5) Escreva um comando que exiba apenas as colunas TIPO, NOME e IDADE da tabela 
--ANIMAIS, apresentado todos os registros


select nome,tipo,idade from animais; 

-- 6) Escreva um comando que exiba apenas as colunas TIPO e NOME da tabela ANIMAIS
--apresentando todos os registros. Apresente a legenda da coluna TIPO com o alias 
--[Tipo de Animal] e a coluna nome com o alias [Nome do Animal]. 

select tipo as 'tipo do animal' nome 'nome do animal' from animais;

--  7) Escreva um comando que exiba apenas as colunas TIPO, NOME e IDADE da tabela 
--ANIMAIS apresentando todos os registros. Apresente a legenda da coluna TIPO com o 
--alias [Tipo de Animal], da coluna nome com o alias [Nome do Animal] e da coluna 
--IDADE com o alias [Tempo de Vida]. 


select tipo as 'tipo de animal', nome as 'nome do animal', idade as 'idade do animal';

-- 8) Escreva um comando que apresente os dados da tabela ANIMAIS da seguinte forma:

select 'animal domestico', as 'procedência' tipo,nome,idade as 'tempo de vida' from animais;

-- 9) Escreva um comando que apresente os dados da tabela ANIMAIS da seguinte forma: 

select * tipo,nome,idade,valor from animais;

select tipo as 'Tipo', nome as 'Nome', idade as 'Idade' valor as 'Valor Original', * 1.10 as 'Valor da venda' from animais; 

-- 10) Escreva um comando que apresente os dados da tabela ANIMAIS como vemos a seguir, 
--apresentando uma vez os dados repetidos. 

select distinct tipo as 'Tipo', valor as 'Valor original', valor 'Valor da venda' from animais; 	
                                                                                                                                                                           














