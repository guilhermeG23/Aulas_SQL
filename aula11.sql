#Criar funções dentro do bd

#CONCEITOS BÁSICOS:
#São rotinas (conjunto de instruções) que são armazenadas no BD, como parte das especificações existente no SQL.
#São similares aos procedimentos, porém as suas aplicações (execução) e forma de invocá-las são diferentes.
#A função gera um valor de saída que pode ser usado na expressão.
#O valor são parâmetros passados para função.

#Rotinas dentro do banco de dados

#Exemplo de função de php
#tem entrada e return

#Exemplo
create table teste (
	ID int auto_increment not null primary key,
	nome varchar(100) not null
);

insert teste values (0, 'teste1'), (0, 'teste1'), (0, 'teste1'), (0, 'teste1'), (0, 'teste1');

#Função
create database Aula_11;

use Aula_11;

create table AAA(
	A int,
	B decimal(6.2),
	C float(4.2)
);

insert AAA values (10, 25.50, 13.39), (20, 139.99, 2.90), (20, 87.70, 1.39);

#Usando a função
CREATE FUNCTION fn_teste (a int, b decimal(6.2))
RETURNS decimal
RETURN ((a * b) + 10);

#Invocando a função
SELECT fn_teste (A, B) as "Teste com Function" FROM AAA;

#Deletando a function
drop function fn_teste;

#mostrar a estrutua da função
show create function fn_teste;

#Lição
create database BD_Total_Info;

use BD_Total_Info;

create table Categoria(
	Id int(3) primary key auto_increment,
	Nome varchar(30) not null
);

insert Categoria values (0, "Celular"), (0, "Tablet"), (0, "Notebook"), (0, "Console");

create table Produtos(
	Cod_Prod int(3) primary key auto_increment,
	Id_Categoria int(3) not null,
	Marca varchar(30) not null,
	Modelo varchar(30) not null,
	Qtd_Prod int(4) not null,
	Preco_Prod decimal (10,2) not null,
	foreign key (Id_Categoria) references Categoria (Id)
);

insert Produtos values
(0, 1, "Motorolla", "G50", 5, 1500.00),
(0, 1, "Motorolla", "G49", 4, 1400.00),
(0, 1, "Motorolla", "G48", 3, 1300.00),
(0, 1, "Motorolla", "G47", 5, 1200.00),
(0, 1, "Motorolla", "G46", 2, 1100.00),
(0, 1, "Motorolla", "G45", 0, 1000.00),
(0, 1, "Motorolla", "T111", 5, 1000.00),
(0, 1, "Motorolla", "T222", 6, 1050.00),
(0, 1, "Sansung", "G", 10, 1000.00),
(0, 1, "Sansung", "H", 15, 1100.00),
(0, 1, "Sansung", "I", 1, 1200.00),
(0, 1, "Sansung", "J", 7, 1300.00),
(0, 2, "Positivo", "P2000", 5, 500.00),
(0, 2, "Positivo", "P3000", 3, 600.00),
(0, 2, "Positivo", "P4000", 4, 700.00),
(0, 2, "Negativo", "ZZZ", 5, 200.00),
(0, 2, "Negativo", "xxx", 8, 300.00),
(0, 2, "Negativo", "www", 10, 400.00),
(0, 2, "Negativo", "yyy", 11, 500.00),
(0, 3, "Acer", "I90", 5, 1700.00),
(0, 3, "Acer", "I91", 23, 1800.00),
(0, 3, "Acer", "I92", 12, 1900.00),
(0, 3, "Acer", "I93", 1, 2000.00),
(0, 3, "HP", "F300", 22, 2200.00),
(0, 3, "HP", "F30", 20, 2100.00),
(0, 3, "HP", "F3", 11, 2000.00),
(0, 3, "HP", "F", 14, 1900.00),
(0, 4, "Sony", "PS88", 9, 5800.00),
(0, 4, "Sony", "PS4", 12, 1900.00),
(0, 4, "Sony", "PS3", 7, 1400.00),
(0, 4, "Sony", "PS2", 15, 1000.00),
(0, 4, "Sony", "PS1", 10, 900.00),
(0, 4, "Microsoft", "XBOX ELEVEN", 3, 4400.00),
(0, 4, "Microsoft", "XBOX ONE", 3, 1800.00),
(0, 4, "Microsoft", "XBOX 360", 3, 1200.00),
(0, 4, "Nintendo", "Wi U", 3, 1500.00),
(0, 4, "Nintendo", "3DS", 3, 900.00)

#Função de teste
	create function fn_desc (Preco_Prod decimal(10.2)) returns decimal return (Preco_Prod * 2);

#A
#Desconto por nossa conta
create function fn_desc (Preco_Prod decimal(10.2)) returns decimal return (Preco_Prod - (Preco_Prod * 0.05));

#Select de teste
select fn_desc (Preco_Prod) as "Desconto" from Produtos;

#teste de function
select fn_teste(Preco_Prod) as 'valor com desconto' from Produtos where Modelo = "I93";

#fazendo uma função de desconto
create function fn_teste(entrada decimal(10.2), desconto decimal(10.2)) returns decimal return (entrada + (entrada * desconto));

#B
select fn_teste(Preco_Prod, 0.10) as 'valor com desconto' from Produtos where Modelo = "I93";

#C
create function fn_valor(quantidade int, preco decimal(10.2)) returns decimal return (quantidade * preco);

#D
select fn_valor(Qtd_Prod, Preco_Prod) as "valor total" from Produtos;

#E
select sum(fn_valor(Qtd_Prod, Preco_Prod)) as "valor total" from Produtos;

#F
select Produtos.Marca, Produtos.Modelo, fn_valor(Produtos.Qtd_Prod, Produtos.Preco_Prod) as "subtotal" from Produtos inner join Categoria on Produtos.Id_Categoria = Categoria.Id where Categoria.Id = 3 or Categoria.Id = 1 order by Categoria.Nome asc;

#G
show functio status;

#H
drop function fn_valor;

#I

#2

create database alunos;

use alunos;

create table nalunos(
	RA int not null auto_increment primary key,
	Nome varchar(100) not null,
	NP1 decimal(3.1) not null,
	NP2 decimal(3.1) not null
);

#A
insert nalunos values (0, "t1", 5.0, 5.0), 
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0),
	(0, "t1", 5.0, 5.0);

#B
create function fn_media(np1 decimal(3.1), np2 decimal(3.1)) returns decimal return ((np1 * 0.4) + (np2 * 0.6));

#C
select Nome, fn_media(NP1, NP2) as "media" from nalunos;

#D
select Nome, fn_media(NP1, NP2) as "media" from nalunos where fn_media(NP1, NP2) < 7;

#E
select sum(fn_media(NP1, NP2)) / count(fn_media(NP1,NP2)) from nalunos;

#3
create table binario (
	v128 int not null default 0,
	v64 int not null default 0,
	v32 int not null default 0,
	v16 int not null default 0,
	v8 int not null default 0,
	v4 int not null default 0,
	v2 int not null default 0,
	v1 int not null default 0
);

insert binario values (0,0,0,0,0,0,0,0), (0,1,0,1,0,1,0,1),(1,0,1,0,1,0,1,0),(1,1,1,0,0,0,1,0), (0,0,1,1,1,0,1,1),(0,0,1,0,0,1,0,0) ,(1,1,1,1,1,1,1,1);

#Guilheme
create function fn_teste(v1 int, v2 int, v3 int, v4 int, v5 int, v6 int, v7 int, v8 int) returns int return ( if(v1=1, 128, 0) + if(v2=1, 64, 0)  + if(v3=1, 32, 0) + if(v4=1, 16, 0) + if(v5=1, 8, 0) + if(v6=1, 4, 0) + if(v7=1, 2, 0) + if(v8=1, 1, 0)); 

#Sergio
create function fn_teste(v1 int, v2 int, v3 int, v4 int, v5 int, v6 int, v7 int, v8 int) returns int return ((v1 * 128) + (v2 * 64)  + (v3 * 32) + (v4 * 16) + (v5 * 8) + (v6 * 4) + (v7 * 2) + (v8 * 1); 

select fn_teste(v128, v64, v32, v16, v8, v4, v2, v1) as "saida" from binario;