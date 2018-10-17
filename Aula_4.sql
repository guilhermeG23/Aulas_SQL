#Cria banco
create database Aula_4;

#Usa banco
use Aula_4;

#Cria tabelas
create table Categoria(
    ID int not null auto_increment primary key,
	Tipo varchar(20) not null
);

create table Produtos(
	ID int not null auto_increment primary key,
	Categoria_ID int not null,
	Nome varchar(25) not null,
	Preco decimal(6,2) not null
);

#Inserir valores
insert into Categoria values(default ,"Livros"), (default, "DVD");
insert into Produtos values(default, "1", "Codigo da Vinci", 39.99), (default, "1", "Diario de um Mago", 19.99), (default, "2", "Hancock", 89.99), (default, "2", "Eu sou a lenda", 79.00);

#selecionar com inner join
select * from Categoria inner join Produtos on Categoria.ID = Produtos.Categoria_ID;