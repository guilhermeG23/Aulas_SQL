create database Livraria;
use Livraria;

create table Autor (
	Codigo int(3) primary key auto_increment,
	Nome char (20) not null
);


INSERT Autor VALUES (0, "Paulo Coelho"),
	(0, "J. K. Rowling"),
	(0, "Jo Soares"),
	(0, "Para Leigos"),
	(0, "Use a cabeca");

create table livro (
	Numero int(3) primary key auto_increment,
	Titulo varchar (30) not null,
	Preco decimal (6,2) not null,
	AutorCodigo int(3) not null,
	foreign key(AutorCodigo) references Autor(Codigo)
);

INSERT livro VALUES (0, "Diario de um mago", 29.00, 1),
	(0, "Veronika decide morrer", 19.00, 1),
	(0, "Adestramento", 45.00, 4),
	(0, "Assassinatos na ABL", 69.00, 3),
	(0, "Psicologia", 35.00, 4),
	(0, "Harry Potter 1", 49.00, 2),
	(0, "O alquimista", 29.00, 1),
	(0, "Onze minutos", 19.00, 1),
	(0, "Brida", 29.00, 1),
	(0, "Harry Potter 3", 49.00, 3),
	(0, "C#", 120.00, 5),
	(0, "O homem que matou G V", 69.00, 3),
	(0, "Harry Potter 4", 49.00, 2),
	(0, "A bruxa de Portobello", 29.00, 1),
	(0, "C++", 100.00, 5),
	(0, "O monte cinco", 9.00, 1),
	(0, "Motivacao", 25.00, 4),
	(0, "Harry Potter 2", 49.00, 2),
	(0, "Harry Potter 1", 49.00, 2),
	(0, "MySql", 99.00, 5),
	(0, "Sherlock Holmes", 69.00, 3),
	(0, "O xango de bazer street", 70.00, 3),
	(0, "Estatistica", 75.00, 4),
	(0, "Grego", 35.00, 4),
	(0, "R", 88.00, 5),
	(0, "Violao", 35.00, 4),
	(0, "PMP", 120.00, 5),
	(0, "Java", 150.00, 5),
	(0, "Oficce 2007", 120.00, 4);