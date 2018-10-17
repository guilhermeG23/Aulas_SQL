create database teste;

use teste;

create table Sorvete(
Id int(3) zerofill primary key not null auto_increment,
Nome char(25) not null,
Cobertura char(20) not null,
Preco decimal (6,2) not null,
Fabricante char(20) not null
);

insert Sorvete values (0, "chocolate", "cobertura simples", 2.50, "Geladao"),
(0, "creme", "cobertura simples", 2.50, "Congela"),
(0, "Limao", "sem cobertura", 2.00, "Frutz"),
(0, "Pitanga", "sem cobertura", 2.00, "Frutz"),
(0, "crocante", "cobertura simples", 2.50, "Geladao"),
(0, "creme holandes", "cobertura simples", 2.50, "Congela"),
(0, "Laranja", "sem cobertura", 2.00, "Frutz"),
(0, "Uva", "sem cobertura", 2.00, "Frutz"),
(0, "Skimo", "cobertura simples", 3.50, "Geladao"),
(0, "Cascao", "cobertura simples", 3.50, "Congela"),
(0, "Abacaxi", "sem cobertura", 2.00, "Frutz"),
(0, "Kiwi", "sem cobertura", 2.00, "Frutz"),
(0, "Moranguete", "cobertura simples", 3.00, "Geladao"),
(0, "Queijo", "cobertura simples", 2.50, "Congela"),
(0, "Uvaia", "sem cobertura", 2.00, "Frutz"),
(0, "Umbu", "sem cobertura", 2.00, "Frutz"),
(0, "Cornetao", "cobertura simples", 3.50, "Congela"),
(0, "Groselha", "sem cobertura", 2.00, "Frutz"),
(0, "Papaya", "sem cobertura", 2.00, "Frutz"),
(0, "Leite Condensado", "cobertura simples", 2.50, "Geladao");

create table produtos(
Cod int(3) zerofill primary key not null auto_increment,
Nome char(20) not null,
Preco decimal(6,2) not null,
Localizacao char(20) not null default "Gondola"
);

insert produtos values (0, "lanterna", 5.99, "ferramentas"),
(0, "bolacha", 1.99, "alimentos"),
(0, "lixeira", 9.99, "casa"),
(0, "carrinho", 2.99, "brinquedos"),
(0, "cera", 2.99, "automoveis"),
(0, "talheres", 5.99, "casa"),
(0, "Danone", 1.99, "alimentos"),
(0, "Massinha", 1.99, "brinquedos"),
(0, "bolo", 5.99, "alimentos"),
(0, "Jogo de Copo", 39.99, "casa"),
(0, "Boneca Baby", 10.99, "brinquedos"),
(0, "Vela", 15.99, "automoveis"),
(0, "Toalha de mesa", 9.99, "casa"),
(0, "Chiclete", 1.49, "alimentos"),
(0, "Avião Controle", 99.99, "brinquedos");

#A
update produtos set Preco = "5.99" where Nome = "Lixeira";

#B
update produtos set Preco = Preco + 1.00;

#C
update produtos set Preco = Preco * 1.10 where Nome = "talheres";

#D
update produtos set Localizacao = "infantil" where Localizacao = "brinquedos";

#E
update produtos set Preco = Preco + 0.01 where Nome != "Danone";

#Extra

#1
create database banco;

use banco;

create table Agencia(
	ID int not null auto_increment primary key,
	Nome varchar(100) not null,
	Cidade varchar(100) not null
);

create table Funcionario(
	Matricula int not null auto_increment primary key,
	Nome varchar(100) not null,
	Cargo varchar(100) not null,
	Salario decimal(10,8) not null,
	Agencia_ID int not null,
	foreign key (Agencia_ID) references Agencia(ID)
);

#A
insert into Agencia values (default, "banco1", "city1"), (default, "banco2", "city2");

#B
insert into Funcionario values (default, "Nome1", "funcionario", "1200.00", 1),
(default, "Nome2", "funcionario", "1200.00", 1),
(default, "Nome3", "funcionario", "1200.00", 1),
(default, "Nome4", "funcionario", "1200.00", 2)
(default, "Nome5", "funcionario", "1200.00", 2);

#C
insert into Agencia values (default, "gerente1", "gerente", "5000.00", 1),
	(default, "gerente2", "gerente", "5000.00", 2);

#D
update Funcionario set Salario = Salario * 1.10 where Cargo != "gerente";

#E
update Funcionario set Salario = Salario * 1.05 where Cargo = "gerente";

#F
update set Funcionario set Cargo = "Diretor" where Cargo = "gerente" limit 1;

#G
update set Funcionario set Salario = "6250.00" where Cargo = "Diretor";

#H
select Nome, Salario from Funcionario where Salario < 2000;

#I
select Funcionario.Matricula, Funcionario.Nome, Agencia.Cidade from Agencia inner join Funcionario on Agencia.ID = Funcionario.Agencia_ID where Funcionario.Salario > 3000;

#J
create view procura as select Funcionario.Nome, Funcionario.Cargo, Agencia.ID, Agencia.Nome from 
Agencia inner join Funcionario on Agencia.ID = Funcionario.Agencia_ID;

#I
#Funcionou

#M
select * from procura order by Funcionario.Cargo asc;

#N
insert into Agencia values (default, "banco3", "city3");

#O
select * from Agencia left join Funcionario on Agencia.ID = Funcionario.Agencia_ID;

#P
select * from Funcionario left join Agencia on Agencia.ID = Funcionario.Agencia_ID;
