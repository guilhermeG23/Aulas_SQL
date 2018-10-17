create database LimeCar;

use LimeCar;

create table Fabricante (
Codigo int(3) primary key auto_increment,
Marca char (20) not null
);

INSERT Fabricante VALUES (0, "Volkswagen"),
(0, "Fiat"),
(0, "Chevrolet"),
(0, "Ford"),
(0, "Audi"),
(0, "Hyundai");

create table Veiculo (
RENAVAN int(8) primary key,
Nome varchar (30) not null,
Cor varchar (20) not null,
Preco decimal (10,2) not null,
FabricanteCod int(3) not null,
foreign key (FabricanteCod) references Fabricante(Codigo));

INSERT Veiculo VALUES (95195195, "Gol", "preto", 18000.00, 1),
(01234567, "Corsa", "azul", 15000.00, 3),
(02589967, "Idea", "prata", 44000.00, 2),
(12345678, "A3", "prata", 44000.00, 5),
(87654321, "Golf", "azul", 32000.00, 1),
(04445566, "A5", "azul", 80000.00, 5),
(78889994, "Jetta", "prata", 55000.00, 1),
(11122255, "S10", "preto", 33000.00, 3),
(36544477, "Linea", "prata", 35000.00, 2),
(77889966, "Montana", "preto", 32000.00, 3),
(55220044, "Fiesta", "branco", 25000.00, 4),
(01444558, "Ka", "verde", 49000.00, 4),
(10102020, "Saveiro", "preto", 22000.00, 1),
(30303030, "Strada", "preto", 27000.00, 2),
(11111111, "SpaceFox", "amarelo", 39000.00, 1),
(22222222, "Siena", "preto", 18000.00, 2),
(33333333, "Spin", "preto", 40000.00, 3),
(44444444, "Spin", "prata", 38000.00, 3),
(55555555, "Uno", "vermelho", 12000.00, 2),
(66666666, "Ka", "preto", 19000.00, 4),
(77777777, "A1", "preto", 49000.00, 5),
(88888888, "Captiva", "preto", 62000.00, 3),
(99999999, "Eco Sport", "preto", 49000.00, 4),
(32132132, "A8", "branco", 90000.00, 5),
(12312312, "Corsa", "rosa", 18000.00, 3),
(45645645, "Idea", "branco", 42000.00, 2),
(65465465, "A3", "verde", 54000.00, 5),
(78978998, "Golf", "dourado", 82000.00, 1),
(98798798, "A5", "blindado", 40000.00, 5),
(14714714, "Jetta", "prata", 45000.00, 1),
(74174174, "S10", "azul", 23000.00, 3),
(85285285, "Linea", "amarelo", 55000.00, 2),
(02582582, "Montana", "lilas", 62000.00, 3),
(96396396, "Fiesta", "marrom", 25000.00, 4);