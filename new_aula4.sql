create database loja;

use loja;

create table Categoria (
	Numero int not null auto_increment primary key,
	Tipo varchar(20) not null
);

create table Produtos (
	ID int not null auto_increment primary key,
	Nome varchar(25) not null,
	Preco decimal(8,2) not null,
	CatNum int not null,
	foreign key (CatNum) references Categoria(Numero)
);

insert into Categoria values (default, "Livros"), (default, "DVD");
insert into Produtos values (default, "Codigo da vinci", "39.99", 1), (default, "Diario de um mago", "19.99", 1), (default, "Hancock", "89.99", 2), (default, "Eu sou a lenda", "79.99", 2);

#Select inner join
select Categoria.Tipo, Produtos.Nome, Produtos.Preco from Produtos inner join Categoria on Produtos.CatNum = Categoria.Numero;

#Exericio 
#1
insert into Categoria values (default, "Escritorio"), (default, "Doces");
select * from Produtos inner join Categoria on Produtos.CatNum = Categoria.Numero;
#O motivo de não aparece é que as duas tabelas tem que possuir o valor para aparecer no inner join

#2
insert into Produtos values (default, "Caneta", "19.99", 3);
select * from Produtos inner join Categoria on Produtos.CatNum = Categoria.Numero;
#Apareceu pois as duas tabelas tem valores que coincidem

#3
select Produtos.ID, Produtos.Nome, Produtos.Preco, Categoria.Tipo from Produtos inner join Categoria on Produtos.CatNum = Categoria.Numero;

#4
#left mostra tudo da tabela 1 e so o que coincide com a table2
select * from Categoria left join Produtos on Categoria.Numero = Produtos.CatNum;
select * from Produtos left join Categoria on Produtos.CatNum = Categoria.Numero;

#right mostra tudo que tem na tabela 2 e so o que coincide com a table 1
select * from Categoria right join Produtos on Categoria.Numero = Produtos.CatNum;
select * from Produtos right join Categoria on Produtos.CatNum = Categoria.Numero;

#5
#A
select Moto.Nome, Marca.Nome from Marca inner join Moto on Moto.MarcaCodigo = Marca.Codigo order by Moto.Nome asc;

#B
select Marca.Nome, Moto.Nome from Marca left join Moto on Marca.Codigo = Moto.MarcaCodigo;

#C
select Cliente.Nome, Moto.Nome, Moto.Chassi from Vendas inner join Moto on Vendas.MotoChassi = Moto.Chassi inner join Cliente on Vendas.ClieNumero = Cliente.Numero order by Cliente.Nome asc;

#D
select Moto.Nome, Moto.Chassi, Produtos.Nome from Vendas inner join Moto on Vendas.MotoChassi = Moto.Chassi inner join Produtos on Vendas.ProdNumero = Produtos.Numero inner join Marca on Moto.MarcaCodigo = Marca.Codigo where Marca.Nome = "Honda" order by Produtos.Nome desc;

#E
select Cliente.Nome, (Produtos.Preco + Servicos.Preco) as Total from Vendas inner join Produtos on Vendas.ProdNumero = Produtos.Numero inner join Servicos on Servicos.Cod = Vendas.ServCod inner join Cliente on Cliente.Numero = Vendas.ClieNumero order by Cliente.Nome asc;

#F
select Moto.Nome from Moto inner join Marca on Moto.MarcaCodigo = Marca.Codigo where Moto.Cor = "Preta" or Moto.Cor = "Prata" and Marca.Nome ="Honda" or Marca.Nome="Kawasaki";

#G
select avg(Produtos.Preco + Servicos.Preco) as Media from Vendas inner join Produtos on Vendas.ProdNumero = Produtos.Numero inner join Servicos on Servicos.Cod = Vendas.ServCod; 

#H
select Cliente.Nome, Cliente.Celular, Moto.Nome from Vendas inner join Moto on Vendas.MotoChassi = Moto.Chassi inner join Marca on Marca.Codigo = Moto.MarcaCodigo inner join Cliente on Cliente.Numero = Vendas.clieNumero where Marca.Nome = "Yamaha";

#I
select Moto.Nome, Moto.Chassi from Vendas inner join Moto on Vendas.MotoChassi = Moto.Chassi inner join Servicos on Vendas.ServCod = Servicos.Cod where Servicos.Nome = "Troca de oleo";

#J
select Moto.Nome, Moto.Chassi, Cliente.Nome, Servicos.Nome, Servicos.Preco, Produtos.Nome, Produtos.Preco , (Servicos.Preco + Produtos.Preco) as Total from Vendas inner join Cliente on Vendas.ClieNumero = Cliente.Numero inner join Moto on Vendas.MotoChassi = Moto.Chassi inner join Servicos on Vendas.ServCod = Servicos.Cod inner join Produtos on Vendas.ProdNumero = Produtos.Numero order by Cliente.Nome desc; 

#6
create database Unip;

use Unip;

create table Professores(
	RG varchar(14) not null primary key;
	Nome Varchar(100) not null
);

create table Alunos (
	RG varchar(14) not null primary key;
	Nome Varchar(100) not null
);

create table Curso (
	ID_curso int not null auto_increment primary key,
	Nome varchar(100) not null 
);

create table Disciplina (
	ID_Curso int not null,
	ID_Disciplina int not null primary key,
	Nome varchar(100) not null,
	foreign key (ID_Curso) references Curso(ID_Curso)
);

create table Presenca (
	ID_Presenca int not null auto_increment primary key,
	RG_Aluno varchar(14) not null,
	RG_Prof varchar(14) not null,
	ID_Curso int not null,
	ID_Disciplina int not null,
	Max_Presenca int not null,
	Atual_Presenca int not null,
	foreign key (RG_Aluno) references Alunos(RG),
	foreign key (RG_Prof) references Professores(RG),
	foreign key (ID_Curso) references Curso(ID_Curso),
	foreign key (ID_Disciplina) references Disciplina(ID_Disciplina)
);

create table Notas(
	ID_Nota int not null auto_increment primary key,
	RG_Aluno varchar(14) not null,
	RG_Prof varchar(14) not null,
	ID_Curso int not null,
	ID_Disciplina int not null,
	Nota1 decimal(4,2) not null,
	Nota2 decimal(4,2) not null,
	Trabalho decimal(4,2) not null,
	foreign key (RG_Aluno) references Alunos(RG),
	foreign key (RG_Prof) references Professores(RG),
	foreign key (ID_Curso) references Curso(ID_Curso),
	foreign key (ID_Disciplina) references Disciplina(ID_Disciplina)
);