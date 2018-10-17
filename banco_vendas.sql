create database Vendas;

use Vendas;

create table Categoria (
	ID int not null auto_increment primary key,
	Tipo varchar(20) not null
);

create table Produtos(
	ID int not null auto_increment primary key,
	Categoria_ID int not null,
	Nome varchar(25) not null,
	Preco decimal(8,2) not null
);

insert into Categoria values (default, "Livros"), (default, "DVD");

insert into Produtos values (default, 1 , "Codigo da vinci", "39.99"), (default, 1, "Diario de um mago", "19.99"), (default, 2, "Hancock", "89.99"), (default, 2, "Eu sou a lenda", "79.99");

#Novo valor categoria
insert into Categoria values (default, "Escritorio");

#Novo valor
insert into Produtos values (default, 3, "Caneta", "10.99");

#Select
select Produtos.ID, Produtos.Nome, Produtos.Preco, Categoria.Tipo from Categoria inner join Produtos on Categoria.ID = Produtos.Categoria_ID;

#Adicionando os doces
insert into Categoria values (default, "Doces");

#Select no left join
select * from Categoria left join Produtos on Categoria.ID = Produtos.Categoria_ID;

#Select no left join
select * from Produtos left join Categoria on Produtos.Categoria_ID = Categoria.ID;
