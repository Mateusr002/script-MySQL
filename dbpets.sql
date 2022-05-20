-- Apagar o banco de dados

drop database dbpets;

-- Criar o banco de dados dbpets

create database dbpets;

-- Visualizar o banco de dados

show databases;

-- Acessando o banco de dados

use dbpets;

-- Visualizar as tabelas do banco

show tables;

-- Criar tabelas no banco de dados


create table tbclientes(
idCLiente int,
nome char(100),
cpf char(14),
dataNasc date,
genero char(1),
logradouro char(100),
numero char(10),
cep char(9),
bairro char(100),
cidade char(100),
estado char(2),
telefone char(100),
email char(100)
);


create table tbfornecedores(
idFornecedor int,
razaoSocial char(100),
nomeFantasia char(100),
CNPJ char(15),
logradouro char(100),
numero char(10),
cep char(9),
bairro char(100),
cidade char(100),
estado char(2),
telefone char(100)
);


create table tbprodutos(
idProdutos int,
CodigoDeBarras char(13),
NomeProduto char(100),
Marca char(100),
Tipo char(100),
Fornecedor char(100),
ValorDaCompra decimal(8,2),
ValorDaVenda decimal(8,2),
QuantidadeEmEstoque int,
fornecedores_idfornecedor int
);

create table compra_has_produtos(
compras_idCompra int,
produtos_idproduto int
);

create table tbcopras(
idCompra int,
produtos varchar(100),
cpf_cliente char(14),
cpf_funcionario char(14),
valorTotal decimal(8,2),
dataAtual date,
funcionarios_idFuncionario int,
clientes_idcliente int
);

create table tbfuncionarios(
idFuncionario int,
nome varchar(100),
cargo varchar(100),
cpf char(14),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
telefone char(100),
email varchar(100),
cargofuncionario_idCargo int
);

create table tbcargofuncionario(
idcargo int,
cargo varchar(100),
salario decimal(8,2)
);

create table tbfuncionarios_has_servicos(
funcionarios_idFuncionario int,
servicos_idServico int
);

create table tbanimais(
idAnimal int,
nomeAnimal varchar(100),
especie varchar(100),
raca varchar(100),
genero char(1),
dataDeNascimento date,
clientes_idcliente int
);

create table tbanimais_has_servicos(
animais_idAnimal int,
animais_clientes_idCliente int,
servicos_idServico int
);

create table tbservicos(
idServico int,
descricaoServico varchar(100),
valorServico decimal(8,2),
tempoServico time
);

create table tbservicos_has_clientes(
servicos_idServico int,
clientes_idcliente int
);

-- Visualizar tabelas do banco de dados

show tables;

-- Visualizar a estrutura das tabelas criadas no banco de dados

desc tbclientes;

desc tbprodutos;

desc tbfornecedores;

desc tbcopras;

desc tbanimais;

desc tbservicos;

desc tbfuncionarios;

desc tbcargofuncionario;