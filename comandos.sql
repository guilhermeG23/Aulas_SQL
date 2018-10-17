#Criando o banco
create database Segur;

#Printando os bancos
show databases;

#Usar o banco
use Segur;

#Criando as tabelas do banco
create table Seguranca(
	Matricula int not null auto_increment primary key,
	Nome varchar(255) not null,
	Cargo varchar(255) not null,
	Salario decimal(10,2) not null
);

create table Material(
	Numero int not null auto_increment primary key,
	Tipo varchar(255) not null,
	Marca varchar(255) not null
);

create table Cliente(
	CNPJ varchar(22) not null primary key,
	Nome varchar(255) not null,
	Endereco varchar(255) not null
);

create table Escala(
	ID int not null auto_increment primary key,
	Data datetime not null,
	SegMatricula int not null,
	MatNumero int not null,
	CliCNPJ varchar(22) not null,
	foreign key (SegMatricula) references Seguranca(Matricula),
	foreign key (MatNumero) references Material(Numero),
	foreign key (CliCNPJ) references Cliente(CNPJ)
);

#Mostrar todas as tabela do banco
show tables;

#Descricao das tabelas
desc Seguranca;
desc Material;
desc Cliente;
desc Escala;

#Alter de tabelas
#Adicionando campo na tabela cliente
alter table Cliente add email varchar(255) not null;

#Renomeando campo na tabela
alter table Seguranca change Cargo Funcao varchar(255) not null default "Recem contratado";

#Deletando campo na tabela
alter table Cliente drop email;

#Renomeando a tabela
alter table Material rename Materiais;

#Insert na tabela de segurança
insert into Seguranca (Matricula, Nome, Funcao, Salario) values(default, "Jonny Ramone", "Segurança", "2500,00"), (default, "Serji Tankian", "Segurança", "2000,00"), (default, "Corey Taylor", default, "973,00");

#Insert na tabela de mateiriais
INSERT Materiais VALUES ("0", "Lanterna", "Shing Ling"), ("0", "Cassetete", "Arrebenta");

#Insert na tabela de clientes
INSERT Cliente VALUES ("00.123.445.685/0001-22", "89fm", "Av. Paulista"), ("11.987.654.321/0001-33", "Supermercado Extra", "Av. Interlagos"), ("11.999.888.777/0001-66", "Supermercado Extra", "Av. Cupêce");

#Insert no escala
insert Escala values ("0", 2018-08-08, 5, 2, "00.123.445.685/0001-22");
insert Escala values ("0", 2018-08-09, 6, 1, "11.987.654.321/0001-33");

#Select das tabelas
select avg(Salario) as "mediaSalarios" from Seguranca;
select Nome,Salario from Seguranca order by Salario desc limit 1;
select Nome from Cliente group by Nome;
select * from Seguranca where Funcao != "Recem contratado";
select * from Materiais where marca = "shing ling";
select SegMatricula from Escala where cliCNPJ = "00.123.445.685/0001-22";
select nome,salario from Seguranca where Salario > 1500;