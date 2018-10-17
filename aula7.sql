#Aula 7

#Dump tabelas sergio
drop database TechStore;

create database TechStore;

use TechStore;

Create table Categoria(
Id int(3) primary key auto_increment,
Nome varchar(30) not null
);

insert Categoria values
(0, "Celular"),
(0, "Tablet"),
(0, "Notebook"),
(0, "Console");

Create table Produtos(
Codigo int(10) primary key auto_increment,
CategoriaId int(3) not null,
Marca varchar(30) not null,
Modelo varchar(30) not null,
Preco decimal (6,2) not null,
constraint FK_CategoriaId
foreign key (CategoriaId) references Categoria(Id)
);

insert Produtos values
(0, 1, "Motorolla", "G50", 1500.00),
(0, 1, "Motorolla", "G49", 1400.00),
(0, 1, "Motorolla", "G48", 1300.00),
(0, 1, "Motorolla", "G47", 1200.00),
(0, 1, "Motorolla", "G46", 1100.00),
(0, 1, "Motorolla", "G45", 1000.00),
(0, 1, "Motorolla", "T111", 1000.00),
(0, 1, "Motorolla", "T222", 1050.00),
(0, 1, "Sansung", "G", 1000.00),
(0, 1, "Sansung", "H", 1100.00),
(0, 1, "Sansung", "I", 1200.00),
(0, 1, "Sansung", "J", 1300.00),
(0, 2, "Positivo", "P2000", 500.00),
(0, 2, "Positivo", "P3000", 600.00),
(0, 2, "Positivo", "P4000", 700.00),
(0, 2, "Negativo", "ZZZ", 200.00),
(0, 2, "Negativo", "xxx", 300.00),
(0, 2, "Negativo", "www", 400.00),
(0, 2, "Negativo", "yyy", 500.00),
(0, 3, "Acer", "I90", 1700.00),
(0, 3, "Acer", "I91", 1800.00),
(0, 3, "Acer", "I92", 1900.00),
(0, 3, "Acer", "I93", 2000.00),
(0, 3, "HP", "F300", 2200.00),
(0, 3, "HP", "F30", 2100.00),
(0, 3, "HP", "F3", 2000.00),
(0, 3, "HP", "F", 1900.00),
(0, 4, "Sony", "PS88", 5800.00),
(0, 4, "Sony", "PS4", 1900.00),
(0, 4, "Sony", "PS3", 1400.00),
(0, 4, "Sony", "PS2", 1000.00),
(0, 4, "Sony", "PS1", 900.00),
(0, 4, "Microsoft", "XBOX ELEVEN", 4400.00),
(0, 4, "Microsoft", "XBOX ONE", 1800.00),
(0, 4, "Microsoft", "XBOX 360", 1200.00),
(0, 4, "Nintendo", "Wi U", 1500.00),
(0, 4, "Nintendo", "3DS", 900.00);

#tentativa de inserir produto com categoria id não adicionada a tabela pai
#Foreign key tem que ter dos dois lados para fazer um insert na tabela
insert Produtos values (0, 8, "NVIDIA", "Tesla P100", 1900.00);

#O mesmo não funciona quando tentamos deletar um valor primary que esta sendo usada como externa em outra tabela
#Enquanto a chave compartilhar um valor em outra tabela o valor fica bloqueado a ser deletado
delete from Categoria where Id = 2;

#Novo dump tabela com delete cascade

drop database TechStore;

create database TechStore;

use TechStore;

Create table Categoria(
Id int(3) primary key auto_increment,
Nome varchar(30) not null
);

Create table Produtos(
Codigo int(10) primary key auto_increment,
CategoriaId int(3) not null,
Marca varchar(30) not null,
Modelo varchar(30) not null,
Preco decimal (6,2) not null,
foreign key (CategoriaId) references Categoria(Id) on delete cascade);

insert Categoria values
(0, "Celular"),
(0, "Tablet"),
(0, "Notebook"),
(0, "Console");

insert Produtos values
(0, 1, "Motorolla", "G50", 1500.00),
(0, 1, "Motorolla", "G49", 1400.00),
(0, 1, "Motorolla", "G48", 1300.00),
(0, 1, "Motorolla", "G47", 1200.00),
(0, 1, "Motorolla", "G46", 1100.00),
(0, 1, "Motorolla", "G45", 1000.00),
(0, 1, "Motorolla", "T111", 1000.00),
(0, 1, "Motorolla", "T222", 1050.00),
(0, 1, "Sansung", "G", 1000.00),
(0, 1, "Sansung", "H", 1100.00),
(0, 1, "Sansung", "I", 1200.00),
(0, 1, "Sansung", "J", 1300.00),
(0, 2, "Positivo", "P2000", 500.00),
(0, 2, "Positivo", "P3000", 600.00),
(0, 2, "Positivo", "P4000", 700.00),
(0, 2, "Negativo", "ZZZ", 200.00),
(0, 2, "Negativo", "xxx", 300.00),
(0, 2, "Negativo", "www", 400.00),
(0, 2, "Negativo", "yyy", 500.00),
(0, 3, "Acer", "I90", 1700.00),
(0, 3, "Acer", "I91", 1800.00),
(0, 3, "Acer", "I92", 1900.00),
(0, 3, "Acer", "I93", 2000.00),
(0, 3, "HP", "F300", 2200.00),
(0, 3, "HP", "F30", 2100.00),
(0, 3, "HP", "F3", 2000.00),
(0, 3, "HP", "F", 1900.00),
(0, 4, "Sony", "PS88", 5800.00),
(0, 4, "Sony", "PS4", 1900.00),
(0, 4, "Sony", "PS3", 1400.00),
(0, 4, "Sony", "PS2", 1000.00),
(0, 4, "Sony", "PS1", 900.00),
(0, 4, "Microsoft", "XBOX ELEVEN", 4400.00),
(0, 4, "Microsoft", "XBOX ONE", 1800.00),
(0, 4, "Microsoft", "XBOX 360", 1200.00),
(0, 4, "Nintendo", "Wi U", 1500.00),
(0, 4, "Nintendo", "3DS", 900.00);

#Mais um dump
drop database TechStore;

create database TechStore;

use TechStore;

Create table Categoria(
Id int(3) primary key auto_increment,
Nome varchar(30) not null
);

Create table Produtos(
Codigo int(10) primary key auto_increment,
CategoriaId int(3) not null,
Marca varchar(30) not null,
Modelo varchar(30) not null,
Preco decimal (6,2) not null,
constraint FK_CategoriaId
foreign key (CategoriaId) references Categoria(Id));

Create table EstiloJogo(
Cod int(3) primary key auto_increment,
Nome varchar(30) not null
);

Create table Jogos(
Numero int(3) primary key auto_increment,
Nome varchar(30) not null,
EstiloJogoCod int(3) not null,
constraint FK_EstiloJogoCod foreign key (EstiloJogoCod) references EstiloJogo(Cod),
ProdutosCodigo int(10) not null,
constraint FK_ProdutosCodigo foreign key (ProdutosCodigo) references Produtos(Codigo)
);

insert Categoria values
(0, "Celular"),
(0, "Tablet"),
(0, "Notebook"),
(0, "Console");

insert Produtos values
(0, 1, "Motorolla", "G50", 1500.00),
(0, 1, "Motorolla", "G49", 1400.00),
(0, 1, "Motorolla", "G48", 1300.00),
(0, 1, "Motorolla", "G47", 1200.00),
(0, 1, "Motorolla", "G46", 1100.00),
(0, 1, "Motorolla", "G45", 1000.00),
(0, 1, "Motorolla", "T111", 1000.00),
(0, 1, "Motorolla", "T222", 1050.00),
(0, 1, "Sansung", "G", 1000.00),
(0, 1, "Sansung", "H", 1100.00),
(0, 1, "Sansung", "I", 1200.00),
(0, 1, "Sansung", "J", 1300.00),
(0, 2, "Positivo", "P2000", 500.00),
(0, 2, "Positivo", "P3000", 600.00),
(0, 2, "Positivo", "P4000", 700.00),
(0, 2, "Negativo", "ZZZ", 200.00),
(0, 2, "Negativo", "xxx", 300.00),
(0, 2, "Negativo", "www", 400.00),
(0, 2, "Negativo", "yyy", 500.00),
(0, 3, "Acer", "I90", 1700.00),
(0, 3, "Acer", "I91", 1800.00),
(0, 3, "Acer", "I92", 1900.00),
(0, 3, "Acer", "I93", 2000.00),
(0, 3, "HP", "F300", 2200.00),
(0, 3, "HP", "F30", 2100.00),
(0, 3, "HP", "F3", 2000.00),
(0, 3, "HP", "F", 1900.00),
(0, 4, "Sony", "PS88", 5800.00),
(0, 4, "Sony", "PS4", 1900.00),
(0, 4, "Sony", "PS3", 1400.00),
(0, 4, "Sony", "PS2", 1000.00),
(0, 4, "Sony", "PS1", 900.00),
(0, 4, "Microsoft", "XBOX ELEVEN", 4400.00),
(0, 4, "Microsoft", "XBOX ONE", 1800.00),
(0, 4, "Microsoft", "XBOX 360", 1200.00),
(0, 4, "Nintendo", "Wi U", 1500.00),
(0, 4, "Nintendo", "3DS", 900.00);

insert EstiloJogo values
(0, "Guerra"),
(0, "Esporte"),
(0, "Corrida");

insert Jogos values (0, "SuperTiro", 1, 28),
(0, "SuperTiro", 1, 33),
(0, "Fut2018", 2, 29),
(0, "Fut2018", 2, 34),
(0, "Fut2018", 2, 35),
(0, "Fut2018", 2, 36),
(0, "Lentos & Calmos", 3, 28),
(0, "Lentos & Calmos", 3, 29),
(0, "Lentos & Calmos", 3, 30),
(0, "Lentos & Calmos", 3, 31),
(0, "Lentos & Calmos", 3, 32),
(0, "Lentos & Calmos", 3, 33),
(0, "Lentos & Calmos", 3, 34),
(0, "Lentos & Calmos", 3, 35),
(0, "Lentos & Calmos", 3, 36),
(0, "Lentos & Calmos", 3, 37);