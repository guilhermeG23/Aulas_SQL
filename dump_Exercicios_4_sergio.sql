Create database LojaMotos;
Use LojaMotos;
Create table Marca(
Codigo int primary key auto_increment,
Nome varchar (30) not null
);
INSERT Marca VALUES (0, "Honda"),
(0, "Yamaha"),
(0, "Kawasaki"),
(0, "Suzuki");
Create table Moto(
Chassi int primary key,
Nome varchar(30) not null,
Cor varchar(20) not null,
MarcaCodigo int not null,
foreign key(MarcaCodigo) references Marca(Codigo)
);
INSERT Moto VALUES (12356789, "Titan", "Azul", 1),
(321654987, "Twister", "Preta", 1),
(147258369, "Factor", "Prata", 2),
(852258022, "Fazer", "Vermelha", 2),
(996655887, "Ninja 250", "Preta", 3),
(753951254, "Ninja 650", "Preta", 3),
(102030550, "CBR", "Prata", 1),
(805099604, "R1", "Amarela", 2);
create table Cliente(
Numero int(3) primary key auto_increment,
Nome varchar(30) not null,
Celular varchar(13) not null
);
INSERT Cliente VALUES (0, "Corey Taylor", "(19)988552266"),
(0, "Joey Jordison", "(19)977441122"),
(0, "Paul Gray", "(19)992365417"),
(0, "Shawn Crahan", "(19)998004433"),
(0, "James Root", "(19)920360055"),
(0, "Mick Thomson", "(19)914523688"),
(0, "Sid Wilson", "(19)977553344");
create table Servicos(
Cod int(3) primary key auto_increment,
Nome varchar(30) not null,
Preco decimal (6,2) not null
);
INSERT Servicos VALUES (0, "Troca de óleo", 120.00),
(0, "Troca pastilha", 100.00),
(0, "Troca transmissao", 150.00),
(0, "Eletrica", 80.00),
(0, "Troca cabo freio", 50.00),
(0, "Troca cabo do acelerador", 70.00);
create table Produtos(
Numero int(3) primary key auto_increment,
Nome varchar(30) not null,
Preco decimal (6,2) not null
);
INSERT Produtos VALUES (0, "Oleo", 30.00),
(0, "Pastilha de freio", 50.00),
(0, "Transmissao", 120.00),
(0, "Fio", 20.00),
(0, "Cabo freio", 25.00),
(0, "Cabo do acelerador", 30.00);
create table Vendas(
Numero int(3) primary key auto_increment,
MotoChassi int not null,
ClieNumero int(3) not null,
ServCod int(3) not null,
ProdNumero int(3) not null,
foreign key (MotoChassi) references Moto(Chassi),
foreign key (ClieNumero) references Cliente(Numero),
foreign key (ServCod) references Servicos(Cod),
foreign key (ProdNumero) references Produtos(Numero)
);
INSERT Vendas VALUES (0, 12356789, 1, 2, 2),
(0, 321654987, 2, 4, 4),
(0, 147258369, 3, 6, 6),
(0, 852258022, 6, 1, 1),
(0, 996655887, 7, 3, 3),
(0, 753951254, 5, 5, 3),
(0, 102030550, 4, 2, 2),
(0, 805099604, 3, 3, 3);