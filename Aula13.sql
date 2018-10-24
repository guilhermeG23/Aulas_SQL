#Aula Triggers Aula 13

#Basicamente o triggers é um procedimento que é “chamado” toda vez que um comando DML(delete, update e select) é executado;
#Verificação de Integridade;
#Validação de dados;
#Trigger é associado a uma tabela;
#Não é chamado diretamente, automaticamente.

#vantagens -> confirma a integridade de dados

#Mysql não consegue utilizar multiplos triggers

#Exemplo Trigger

#criar um trigger
#create trigger <nome_triger> timing <operacoes> on <nome tabela> for each row <declaracoes>;

#timing -> before -> antes / after -> depo-s

#for each row -> linha por linha na operação

#deletar um trigger
#drop trigger <nome do trigger>;

#exibir o trigger
#show triggers;

#Em gatilhos executados após a inserção de registros, a palavra reservada NEW dá acesso ao novo registro

#insert = usa new
#delete = usa old 
#update = ambos

#Delimitar 
#Pode usar is $$, ;; e @@

#Aula

create database New_Shoes;

use New_Shoes;

create table Tennis(
	Codigo int(3) primary key auto_increment,
	Nome varchar(50) not null,
	Estoque int(3) not null,
	Preco_Normal decimal(6, 2) not null,
	Preco_Desconto decimal(6, 2) not null
);

insert Tennis values (0, "nike downshifter", 5, 250.00, 220.00);

select * from Tennis;

#Operação
CREATE TRIGGER tr_desc BEFORE INSERT ON Tennis FOR EACH ROW SET New.Preco_Desconto = (New.Preco_Normal * 0.95);

#Operação apos insert
select * from Tennis;

#Insert
insert Tennis (Codigo, Nome, Estoque, Preco_Normal) values (0, "nike air vapormax flyknit", 10, 745.00);
insert Tennis (Codigo, Nome, Estoque, Preco_Normal) values (0, "teste", 10, 1405.00);

#Select
select * from Tennis;

#Usando o delimiter
delimiter $$
CREATE TRIGGER tr_venda AFTER INSERT
ON tbl_venda
FOR EACH ROW
begin
	update Tennis set Tennis.Estoque = Tennis.Estoque - 1;
end $$
delimiter ;

#Exemplos after insert

create table tbl_venda(
Id int primary key auto_increment,
Nome varchar(30) not null,
TennisCod int not null,
foreign key(TennisCod) references Tennis(Codigo)
);
delimiter $$
CREATE TRIGGER tr_venda AFTER INSERT
ON tbl_venda
FOR EACH ROW
begin
update Tennis
set Tennis.Estoque = Tennis.Estoque - 1;
end $$
delimiter ;
insert tbl_venda values (0, "nike downshifter", 1);
select * from tbl_venda;
select * from Tennis;

#delete
create table tbl_backup(
	Id int primary key auto_increment,
	Nome varchar(50) not null,
	Estoque int(3) not null,
	Preco_Normal decimal(6, 2) not null,
	Preco_Desconto decimal(6, 2) not null
);
delimiter $$

CREATE TRIGGER tr_backup AFTER DELETE ON Tennis FOR EACH ROW 
begin
insert tbl_backup values (old.Codigo, old.Nome, old.Estoque, old.Preco_Normal,
old.Preco_Desconto);
end $$
delimiter ;
delete from Tennis where Codigo = 2;

#slect
select * from Tennis;
select * from tbl_backup;

#update
create table tbl_backup2(
	Id int primary key auto_increment,
	Nome varchar(50) not null,
	Estoque int(3) not null,
	Preco_Normal decimal(6, 2) not null,
	Preco_Desconto decimal(6, 2) not null,
	DataAlteracao date
);

#procedure
delimiter $$
CREATE TRIGGER tr_backup2 before update
ON Tennis
FOR EACH ROW
begin
insert tbl_backup2 values (old.Codigo, old.Nome, old.Estoque, old.Preco_Normal,
old.Preco_Desconto, current_date);
end $$
delimiter ;

#Update
update Tennis set Preco_Normal = 100.00 where Codigo = 1;

#select
select * from Tennis;
select * from tbl_backup2;


#Exercicio
#1
drop database LojaGames;

create database LojaGames;

use LojaGames;

create table Jogo(
	Id int primary key auto_increment,
	Nome varchar(50) not null,
	Quantidade int not null,
	PrecoNormal decimal(6,2) not null,
	PrecoVista decimal(6,2) not null,
	Preco3X decimal(6,2) not null
);

create table Funcionario(
	Matricula int(3) primary key auto_increment,
	Nome varchar(50) not null
);

insert Funcionario values
(0, "Bob Esponja"),
(0, "Patrick Estrela"),
(0, "Sandy Bochechas");

create table Venda(
	Numero int primary key auto_increment,
	JogoId int not null,
	FuncionarioMat int(3) not null,
	foreign key (JogoId) references Jogo(Id),
	foreign key (FuncionarioMat) references Funcionario(Matricula)
);

#A
insert into Jogo values (0, 't', 10, 100, 0, 0);

CREATE TRIGGER tr_venda BEFORE insert 
ON Jogo
FOR EACH ROW
SET New.PrecoVista = ((New.PrecoNormal / 100) * 90), New.Preco3X = ((New.PrecoNormal / 100) * 110);

#B 
insert into Jogo (Id, Nome, Quantidade, PrecoNormal)values (0, 't', 10, 100);
insert into Jogo (Id, Nome, Quantidade, PrecoNormal)values (0, 't', 10, 100);
insert into Jogo (Id, Nome, Quantidade, PrecoNormal)values (0, 't', 10, 100);
insert into Jogo (Id, Nome, Quantidade, PrecoNormal)values (0, 't', 10, 100);
insert into Jogo (Id, Nome, Quantidade, PrecoNormal)values (0, 't', 10, 100);

#C
#Funcionou

#D
show triggers;

#E
create table JogoBK(
	Id int primary key auto_increment,
	Nome varchar(50) not null,
	Quantidade int not null,
	PrecoNormal decimal(6,2) not null,
	PrecoVista decimal(6,2) not null,
	Preco3X decimal(6,2) not null,
	Data date not null
);

#F
delimiter $$
CREATE TRIGGER tr_bk after delete
ON Jogo
FOR EACH ROW
begin
insert JogoBK values (old.Id, old.Nome, old.Quantidade, old.PrecoNormal, old.PrecoVista, old.Preco3X, current_date);
end $$
delimiter ;

#G 
#Funcionou

#2
create table tb1 (
	A int auto_increment primary key,
	B int,
	C decimal(10, 2)
);

create table tb2 (
	A int auto_increment primary key,
	B int,
	C decimal(10, 2)
);

#delimiter

delimiter $$
CREATE TRIGGER tr_op before insert
ON tb1
FOR EACH ROW
begin
	insert into tb2 (A, B, C) values (default, New.B * New.C, ((New.B * New.C) / 2));
end $$
delimiter ;
