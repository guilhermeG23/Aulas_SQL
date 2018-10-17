#Recomendado para tabelas com pouco movimentos

#Ela roda em segundo plano para sempre ficar atualizada, com isso o resultado sempre está pronto para ser chamado

#Criando views
#Exemplo de view na tabela da livraria da aula 5 . dumps.ql
create view tabela_vw as select * from Autor where Nome = "Paulo Coelho";

#para ler ela
select * from tabela_vw;

#Exemplos
#A-)
create view vw_consulta2 as select Titulo from livro order by asc;
select * from vw_consulta2;

#B-)
create view consulta2_vw as select Titulo from livro order by Titulo asc;
select * from consulta2_vw;

#C-)
create view vw_preco1 as select Titulo, preco from livro;
select * from vw_preco1;

#D-)
create view vw_preco2 as select * from livro inner join Autor on Autor.Codigo = AutorCodigo where AutorCodigo = 4;
select * from vw_preco2;

#E-)
drop view consulta2_vw;

#F-)
#Table 'Livraria.consulta2_vw' doesn't exist
#Tabela foi apagada

#Exercicios
#A-)
create view vw_MarcaNome as select Veiculo.Nome, Fabricante.Marca from Fabricante inner join Veiculo on Veiculo.FabricanteCod = Fabricante.Codigo;

#B-)
#Saida
/*
+-----------+------------+
| Nome      | Marca      |
+-----------+------------+
| Saveiro   | Volkswagen |
| SpaceFox  | Volkswagen |
| Jetta     | Volkswagen |
| Jetta     | Volkswagen |
| Golf      | Volkswagen |
| Golf      | Volkswagen |
| Gol       | Volkswagen |
| Idea      | Fiat       |
| Siena     | Fiat       |
| Strada    | Fiat       |
| Linea     | Fiat       |
| Idea      | Fiat       |
| Uno       | Fiat       |
| Linea     | Fiat       |
| Corsa     | Chevrolet  |
| Montana   | Chevrolet  |
| S10       | Chevrolet  |
| Corsa     | Chevrolet  |
| Spin      | Chevrolet  |
| Spin      | Chevrolet  |
| S10       | Chevrolet  |
| Montana   | Chevrolet  |
| Captiva   | Chevrolet  |
| Ka        | Ford       |
| Fiesta    | Ford       |
| Ka        | Ford       |
| Fiesta    | Ford       |
| Eco Sport | Ford       |
| A5        | Audi       |
| A3        | Audi       |
| A8        | Audi       |
| A3        | Audi       |
| A1        | Audi       |
| A5        | Audi       |
+-----------+------------+
*/

#C-)
alter view vw_MarcaNome as select Veiculo.Nome, Fabricante.Marca from Fabricante inner join Veiculo on Veiculo.FabricanteCod = Fabricante.Codigo where Fabricante.Marca = "Audi";

#D-)
create view veiculo_vw as select Nome, Preco from Veiculo;

#E-)
select * from veiculo_vw where Preco >= 70000;

#F-)


#G-)
create view vw_MarcaCor as select Veiculo.Nome, Veiculo.Cor, Fabricante.Marca from Veiculo inner join Fabricante on Veiculo.FabricanteCod = Fabricante.Codigo order by Veiculo.Nome asc;

#2
create database banco_marca;
use banco_marca;
create table marca (
	Id int auto_increment not null primary key,
	Nome varchar(20) not null 
);
insert into marca values(0, "Nestle"), (0, "Ambev"), (0, "Caseiro");

create table produto (
	Codigo int auto_increment not null primary key,
	Nome varchar(20) not null,
	Validade date not null,
	MarcaId int not null,
	foreign key (MarcaId) references marca(Id)
);	
insert into produto values (default, "Chocolate Prestigio", "2018-12-15", 1), 
	(default, "Pacote Bolacha", "2019-01-01", 1),
	(default, "Nescau Prontinho", "2019-01-01", 1),
	(default, "Guanara Antartica", "2022-05-05", 2), 
	(default, "Pepsi", "2022-05-05", 2), 
	(default, "Coxinha", "2018-08-29", 3), 
	(default, "lanche Natural", "2018-08-19", 3), 
	(default, "Trufa", "2018-08-26", 3);

create table financeiro (
	Numero int auto_increment not null primary key,
	VL_Compra decimal(10,2) not null,
	Qtd int not null,
	ProdCod int not null,
	foreign key (ProdCod) references produto(Codigo) 
);
insert into financeiro values (default, "1.60", 30, 1), 
	(default, "1.99", 10, 2), 
	(default, "1.50", 50, 3), 
	(default, "2.00", 30, 4), 
	(default, "2.00", 30, 5), 
	(default, "2.00", 15, 6), 
	(default, "3.50", 15, 7), 
	(default, "3.00", 15, 8);

#A-)
select 