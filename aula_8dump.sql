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
Id_Categoria int(3) not null,
Marca varchar(30) not null,
Modelo varchar(30) not null,
Preco decimal (6,2) not null,
foreign key (Id_Categoria) references Categoria (Id)
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

#1
select * from Produtos inner join Categoria on Produtos.Id_Categoria = Categoria.Id where Categoria.id = 1;

#2
delete from Produtos where Modelo = "G50";

#3
select * from Produtos inner join Categoria on Produtos.Id_Categoria = Categoria.Id where Categoria.id = 1;

#4
select * from Produtos inner join Categoria on Produtos.Id_Categoria = Categoria.Id where Categoria.id = 2;

#5
delete from Produtos where Marca = "Negativo" and Preco < 500;

#6
select * from Produtos inner join Categoria on Produtos.Id_Categoria = Categoria.Id where Categoria.id = 2;

#7
delete from Produtos where Marca = "HP" or Id_Categoria = 3 and Preco > 2000;

#8
delete from Categoria where Nome = "Tablet";

#9
#foi impedido por que a coluna é uma foreign key de outra tabela

#10
select * from Produtos inner join Categoria on Produtos.Id_Categoria = Categoria.Id where Categoria.id = 4;

#11
delete from Produtos where Id_Categoria = 4 and Preco < 1000 or Preco > 4000;

#12
delete from Produtos where Modelo like "T%";

#13
#Drop: deleta uma estrutura do banco
#delete: deleta um dado que o banco armazena
#truncate: limpa totalmente uma tabela

#14
truncate Produtos;
drop table Produtos;
delete from Produtos;

#15
drop database TechStore

#16
#Recria tudo e altera aqui
Create table Categoria(
Id int(3) primary key auto_increment,
Nome varchar(30) not null
);
Create table Produtos(
Codigo int(10) primary key auto_increment,
Id_Categoria int(3) not null,
Marca varchar(30) not null,
Preco decimal (6,2) not null,
foreign key (Id_Categoria) references Categoria (Id) on delete cascade
);

#17
select count(*) from Categoria inner join Produtos on Categoria.Id = Produtos.Id_Categoria;

#18
delete from Categoria where Nome = "Tablet";

#19
select count(*) from Categoria inner join Produtos on Categoria.Id = Produtos.Id_Categoria;