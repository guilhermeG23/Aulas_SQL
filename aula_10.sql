#Dump aula 10
create database biblioteca;

use biblioteca;

create table aluno( 
	RA int(5) primary key not null, 
	nome varchar(50) not null, 
	telefone int(9) not null 
); 

insert aluno values 
	(12345, "Joey Ramone", 991213344), 
	(54321,"Lars Ulrich",977889966), 
	(11223,"Serj Tankian",987658899), 
	(98765,"Vicky Psarakis", 922556688), 
	(56789,"Corey Taylor", 901238525);

create table funcionario( 
	matricula int(5) primary key auto_increment, 
	nome varchar(50) not null, 
	cargo varchar(30) not null 
); 
insert funcionario values 
	(0, "Melvil Dewey", "Bibliotecario1"), 
	(0, "Manuel Bastos Tigre", "Bibliotecario2");

create table livro( 
	isbn int(5) primary key not null, 
	nome varchar(50) not null, 
	secao varchar(20) not null ); 

insert livro values 
	(11111, "Vida Punk", "musica"), 
	(22222,"Mestres da Bateria", "musica"), 
	(33333,"Sexta-feira 13", "terror"), 
	(44444,"Mulheres do Rock", "musica"), 
	(55555,"O exorcista", "terror"), 
	(66666,"O chamado", "terror"), 
	(77777,"Mascaras", "musica"), 
	(88888,"ToxiCity", "musica"), 
	(99999,"Diariode um Mago", "esoterismo");

create table Emprestimo( 
	numero int(3) primary key auto_increment, 
	retirada date not null, 
	devolucao date not null, 
	aluno_RA int(5) not null, 
	funcionario_matricula int(5) not null, 
	livro_isbn int(5) not null, 
	foreign key(aluno_RA) references Aluno (RA), 
	foreign key(funcionario_matricula) references Funcionario(matricula), 
	foreign key(livro_isbn) references Livro (isbn) 
);

insert Emprestimo values 
	(0, "2018/01/02","2018/01/17",12345, 1, 11111), 
	(0, "2018/01/15","2018/02/01",11223, 2, 88888), 
	(0, "2018/04/05","2018/04/20",56789, 2, 77777), 
	(0, "2018/03/15","2018/03/30",98765, 1, 44444), 
	(0, "2018/06/06","2018/06/21",56789, 1, 55555), 
	(0, "2018/08/01","2018/08/16",12345, 2, 22222), 
	(0, "2018/10/10","2018/10/25",11223, 1, 66666);

create table Restricao( 
	Id int(2) primary key auto_increment, 
	aluno_RA int(5) not null, 
	livro_isbn int(5) not null, 
	foreign key(aluno_RA) references Aluno (RA), 
	foreign key(livro_isbn) references Livro (isbn) 
); 

insert Restricao values
	(0,12345, 22222);

#Aula
#SELECT <campo> FROM <tabela> WHERE <campo> IN (SELECT <campo> FROM <tabela>);

#Alunos que etão bloqueados
select nome from aluno where RA in (select aluno_RA from Restricao);

#Não bloquedos
select nome from aluno where RA not in (select aluno_RA from Restricao);

#Exercicio 1
select aluno.nome as aluno, livro.nome as livro from aluno, livro where aluno.RA in (select Aluno_RA from Restricao) and livro.isbn in (select livro_isbn from Restricao);

#Exercicio 2
select aluno.nome as aluno from aluno where aluno.RA not in (select aluno_RA from emprestimo);

#Exercicio 3
select nome from livro where secao not in (select secao from livro where secao = "musica");

#Dump lanchonete
drop database Lanchonete; 
create database Lanchonete; 
use Lanchonete; 
create table Marca ( 
	Id int(3) primary key auto_increment, 
	Nome char (20) not null 
); 

INSERT Marca VALUES 
	(0, "Nestle"), 
	(0, "Ambev"), 
	(0, "Caseiro"); 

create table Produto ( 
	Codigo int(8) primary key auto_increment,
	Nome varchar (30) not null, 
	Validade Date not null, 
	MarcaId int(3) not null, 
	foreign key (MarcaId) references Marca (Id)
);

INSERT Produto VALUES 
	(0, "Chocolate Prestigio", "2018/12/15", 1), 
	(0, "Pacote Bolacha", "2018/12/30", 1), 
	(0, "Nescau Prontinho", "2019/01/01", 1), 
	(0, "Guarana Antartica", "2022/05/05", 2), 
	(0, "Pepsi", "2022/05/05", 2), 
	(0, "Coxinha", current_date + 10, 3), 
	(0, "Lanche Natural", current_date, 3), 
	(0, "Trufa", current_date + 7, 3);

create table Financeiro ( 
	Numero int(8) primary key auto_increment, 
	Vl_Compra decimal (5,2) not null, 
	Qtd int(8) not null, 
	ProdCod int(3) not null, 
	foreign key (ProdCod) references Produto(Codigo)
); 

INSERT Financeiro VALUES 
	(0, 1.60, 30, 1), 
	(0, 1.99, 10, 2), 
	(0, 1.50, 50, 3), 
	(0, 2.00, 30, 4), 
	(0, 2.00, 30, 5), 
	(0, 2.00, 15, 6), 
	(0, 3.50, 15, 7), 
	(0, 3.00, 15, 8); 

#Exercicios praticos

#A
select Nome from Marca where Nome not in (select Nome from Marca where Nome = "Nestle");
#B
select Nome, validade from produto where validade in (select validade from produto where validade < Current_date() + 15);

#C
select Numero, (Vl_Compra * Qtd) from financeiro where (Vl_Compra * Qtd) in (select (Vl_Compra * Qtd) from financeiro where (Vl_Compra * Qtd) >= 50);

#D
select marca.Nome, produto.Nome from marca, produto where marca.Id in (select MarcaId from produto where MarcaId = 3) and produto.MarcaId in (select MarcaId from produto where MarcaId = 3);

#E
select produto.Nome as "Produto", (financeiro.Vl_Compra * financeiro.Qtd) as "Total" from produto, financeiro where produto.validade not in (select validade from produto where validade < "2018-12-31") and financeiro.ProdCod = Produto.Codigo;

#F
select marca.Nome, produto.Nome, financeiro.Qtd from marca,produto,financeiro where marca.Id not in (select produto.MarcaId from produto where marcaId = 3) and produto.MarcaId = Marca.Id and financeiro.ProdCod = produto.Codigo order by produto.Nome asc;

#G
select marca.Nome, produto.Nome from produto, marca where produto.MarcaId = marca.Id and marca.Id not in (select marca.Id from marca where Id = 2);

#H
select produto.Nome, produto.Validade from produto, financeiro where produto.Validade in (select produto.Validade from produto where produto.Validade < current_date() + 180) and financeiro.Qtd in ( select financeiro.Qtd from financeiro, produto where financeiro.Qtd <= 20 and financeiro.ProdCod = produto.Codigo) group by Nome;

#I
create table Cliente (
	Id int auto_increment not null primary key,
	Nome varchar(100) not null,
	Telefone varchar(14) not null
);

insert into Cliente values
	(default, "Donatello", "987654321"),
	(default, "Raphael", "963852741"),
	(default, "Michelangello", "951357852"),
	(default, "Leonardo", "998877665"),
	(default, "splinter", "878965412");

#J
create table Venda (
	Num int not null auto_increment primary key,
	ClienteId int not null,
	ProdCod int not null,
	Data date not null,
	ValorVenda int not null
);

insert into Venda values
	(default, 1, 8, current_date(), 4),
	(default, 2, 2, current_date(), 3),
	(default, 3, 4, current_date(), 4),
	(default, 4, 4, current_date(), 4);

#L
select cliente.Nome, cliente.Telefone from cliente,venda where cliente.Id = venda.ClienteId;

#M
select cliente.Nome, produto.Nome from cliente, venda, produto, marca where marca.Id = 2 and cliente.Id = venda.ClienteId and venda.ProdCod = produto.Codigo and produto.MarcaId = 2;

#N
select cliente.Nome, venda.ValorVenda, produto.Nome from cliente, venda, produto where produto.marcaId in (select MarcaId from produto where MarcaId = 3) and produto.Codigo = venda.ProdCod and cliente.Id = venda.ClienteId;

#O
select cliente.Nome, cliente.Telefone from cliente where cliente.Id not in (select venda.clienteId from venda);