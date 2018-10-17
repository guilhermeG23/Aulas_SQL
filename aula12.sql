#Procedures e delemitors

#procedures = procedimentos armazenados diretos no banco

#So serve para banco relacional
#Não funciona por que não tem uma tabela routins em noSQL

#Conhecido como procedimentos armazenados (Stored Procedures), é uma sub-rotina para aplicações de BD relacional;
#Pode ser utilizada em controle de acesso, execução de funções, consultas e declarações mais complexas;
#Disponivel a partir da versão 5.0
#São inseridos em uma tabela chamada ROUTINES no banco de dados INFORMATION_SCHEMA, que é o dicionário de dados do MySQL.

#Eu
#Caminho para o routins
#information_schemas -> routines;

#criar um procedure
create procedure proc_valor(teste int) select Nome, Valor from Test where Valor = teste;
create procedure proc_valor(teste int, teste1 int) select * from Test where valor > teste and valor < teste1;

#deletar um procedure
drop procedure proc_valor;

#chamar o procedure
call proc_valor(100);

#testes
create database TestProc;

use TestProc;

create table Test(
	Id int primary key auto_increment,
	Nome varchar(30),
	Valor int
);

insert Test values (0, "AAA", 200),
(0, "BBB", 300),
(0, "CCC", 400),
(0, "DDD", 500),
(0, "EEE", 600),
(0, "FFF", 700),
(0, "GGG", 800),
(0, "HHH", 900),
(0, "III", 200),
(0, "JJJ", 300),
(0, "KKK", 400),
(0, "LLL", 500),
(0, "MMM", 600),
(0, "NNN", 700),
(0, "OOO", 800),
(0, "PPP", 900),
(0, "QQQ", 200),
(0, "RRR", 300),
(0, "SSS", 400),
(0, "TTT", 500),
(0, "UUU", 600),
(0, "VVV", 700),
(0, "XXX", 800),
(0, "YYY", 900),
(0, "WWW", 200),
(0, "ZZZ", 100);

#1
CREATE DATABASE Prefeitura;

USE Prefeitura;

CREATE TABLE IPTU (
	Id int(3) primary key auto_increment,
	CPF bigint(11) not null,
	Nome varchar(255) not null,
	Endereco varchar(255) not null,
	Status int not null,
	Valor decimal(10,2) not null
);

INSERT IPTU values
(0,"16250722839","Francis Singleton","7017 Mauris St.",1,1954.00),
(0,"16110209255","Otto Dawson","Ap #726-952 Tortor St.",0,0.00),
(0,"16101107287","Gareth Bryan","158-788 Congue Avenue",1,957.00),
(0,"16381024592","Murphy Carr","Ap #948-1503 Imperdiet St.",0,0.00),
(0,"16270720751","Oren Barry","4770 Velit Rd.",0,0.00),
(0,"16071021141","Edward Olson","P.O. Box 810, 4855 Massa St.",1,1800.00),
(0,"16771115491","Kelly Graham","1137 Nec Av.",0,0.00),
(0,"16140115400","Hayden Jordan","6071 Nulla Avenue",0,0.00),
(0,"16240411490","Stephen Farley","P.O. Box 745, 5084 Ipsum. Av.",1,939.00),
(0,"16400101613","Herman Hood","Ap #628-1698 Gravida Avenue",1,645.00),
(0,"16740526299","Grady Howell","P.O. Box 533, 1658 Feugiat. St.",1,1545.00),
(0,"16441114046","Gil Banks","P.O. Box 403, 3729 Nisi. St.",0,0.00),
(0,"16390403472","Ishmael Hampton","7538 Ante Ave",1,1289.00),
(0,"16520906151","Cole Banks","1283 Scelerisque, Ave",1,1087.00),
(0,"16790717410","Malcolm Pierce","Ap #985-3862 Amet Avenue",1,633.00),
(0,"16170405755","Luke Carrillo","9411 In Ave",1,1905.00),
(0,"16920418994","Declan Gill","Ap #709-4497 Dui, Street",1,828.00),
(0,"16780528023","Jakeem Stafford","P.O. Box 729, 9795 Ut Street",1,613.00),
(0,"16841202688","Zachary Lambert","692-9158 Lorem Rd.",1,1445.00),
(0,"16230319167","Kenyon Wilder","414 Eu Av.",1,1946.00),
(0,"16801102405","Lee Vazquez","687-3600 Libero Avenue",0,0.00),
(0,"16141125097","Benedict Weber","5913 Massa. Rd.",0,0.00),
(0,"16471128893","Herrod Smith","756-8813 Sagittis Ave",1,1221.00),
(0,"16290526539","Jasper Mathis","Ap #658-8744 Non St.",1,1074.00),
(0,"16640904496","Lars Anderson","P.O. Box 804, 6210 Ornare, Street",1,1245.00),
(0,"16720528862","Maxwell Velasquez","P.O. Box 904, 678 Vel, Avenue",1,1110.00),
(0,"16371005068","Craig Mcmahon","523 Nibh St.",1,1710.00),
(0,"16681115272","Tucker Edwards","4618 Augue. Rd.",1,1732.00),
(0,"16030627361","Nash Fernandez","2622 Id Ave",1,1388.00),
(0,"16710227165","Chadwick Hunt","P.O. Box 969, 5740 Nunc. St.",0,0.00),
(0,"16780706802","Samuel Underwood","209-9268 Lobortis Rd.",1,1431.00),
(0,"16151213536","Yasir Livingston","Ap #423-8313 Purus, St.",1,1139.00),
(0,"16970406136","Giacomo Ball","2657 Turpis Road",1,1453.00),
(0,"16470723556","Isaac Velazquez","570-3390 Proin Rd.",1,1424.00),
(0,"16640122792","Omar Montgomery","Ap #274-9274 Lacus. St.",1,1280.00),
(0,"16540125849","Colt Roth","P.O. Box 924, 1989 Est. Rd.",1,737.00),
(0,"16310927401","Moses Tanner","Ap #639-2798 Ante Rd.",0,0.00),
(0,"16370604524","Jonas Wilder","P.O. Box 826, 2018 Vel, St.",0,0.00),
(0,"16470320223","Leo Logan","7844 Magna Rd.",0,0.00),
(0,"16100610105","Baxter Best","Ap #798-9814 Et, Av.",1,1403.00),
(0,"16001211827","Gary Watts","5810 Nisi St.",1,1267.00),
(0,"16150911994","Gavin Jones","Ap #121-418 Aliquam Ave",1,1209.00),
(0,"16730222762","Drew Myers","P.O. Box 744, 9975 Odio Avenue",1,1032.00),
(0,"16350901028","Ethan George","P.O. Box 354, 8155 Natoque St.",0,0.00),
(0,"16490312306","Carson Mills","Ap #672-6752 Semper Av.",1,714.00),
(0,"16611222454","Malachi Rivas","599-2971 Sapien. Road",1,1395.00),
(0,"16740524324","Prescott Perry","P.O. Box 537, 1478 Vel Rd.",0,0.00),
(0,"16451206107","Nathaniel Patel","7860 Neque. Ave",1,1134.00),
(0,"16660930020","Solomon Cooke","354-4773 Montes, Avenue",1,838.00),
(0,"16000629547","Castor Swanson","Ap #542-7065 Aenean Av.",0,0.00),
(0,"16090919416","Noble Cox","P.O. Box 358, 919 Enim Ave",1,1392.00),
(0,"16380811814","Phillip Hester","717-3208 Ipsum. Av.",1,819.00),
(0,"16650528271","Judah Talley","Ap #784-6873 Metus. Street",1,1853.00),
(0,"16300204507","Harlan Hinton","P.O. Box 144, 6909 Nibh. Rd.",0,0.00),
(0,"16931115226","Raymond Myers","5147 In Road",0,0.00),
(0,"16620124592","Troy Webster","789-5976 Elit St.",1,1307.00),
(0,"16390809006","Yuli Hurst","P.O. Box 993, 3709 Posuere, St.",1,802.00),
(0,"16320521540","Jack Leon","1636 Nam St.",1,1765.00),
(0,"16720503501","Callum Nolan","P.O. Box 403, 3708 Parturient St.",0,0.00),
(0,"16500804262","Boris Merritt","6580 Egestas Rd.",1,1148.00),
(0,"16111126533","Harrison Howe","7694 Ridiculus Ave",1,1019.00),
(0,"16071108063","Noah Mcfarland","5492 Erat Street",0,0.00),
(0,"16100522909","Calvin Ruiz","3438 Cursus St.",0,0.00),
(0,"16550501327","Deacon Walter","P.O. Box 806, 2871 Imperdiet Road",1,1920),
(0,"16720401253","Hashim Jefferson","Ap #743-6305 Velit. Rd.",1,641.00),
(0,"16770824388","Hunter York","P.O. Box 156, 3799 Blandit Road",1,1615.00),
(0,"16280530677","Lane Mccarty","P.O. Box 756, 8692 Eget Rd.",1,919.00),
(0,"16531014732","Bradley Cochran","P.O. Box 395, 7094 Augue, Street",1,730.00),
(0,"16691215420","Zachery Winters","P.O. Box 940, 9427 Quam Road",1,1744.00),
(0,"16070613108","Dalton Rosario","Ap #777-458 Enim, Rd.",0,0.00),
(0,"16361022942","Zachery Callahan","Ap #911-1524 Vitae Street",0,0.00),
(0,"16381024592","Murphy Carr","Rua Palmeiras, 1951",1,1000.00),
(0,"16270720751","Oren Barry","Av. 1, n. 1500",1,50.00),
(0,"16071021141","Edward Olson","Av. Pedro Alvares Cabral, 1000",0,0.00),
(0,"16381024592","Murphy Carr","Av. Ipiranga, 600",1,300.00);

#A
create procedure proc_consulta(valor_entrada decimal) select CPF, Endereco, Valor from IPTU where Valor not in (select Valor from IPTU where Valor = valor_entrada);
create procedure proc_consulta_certo(municipio bigint) select CPF, Endereco, Valor from IPTU where CPF = municipio;

#B
call proc_consulta_certo(16381024592);
call proc_consulta_certo(16550501327);
call proc_consulta_certo(16071021141);

#C
create procedure proc_consulta_end(pessoa varchar(255)) select Nome, Valor, Endereco from IPTU where Nome = pessoa;

#D
call proc_consulta_end("Oren Barry");
call proc_consulta_end("Otto Dawson");
call proc_consulta_end("Samuel Underwood");

#E
show procedure status;

#F
create procedure proc_total_div(sta int) select sum(Valor) as "Divida IPTU" from IPTU where status = sta;

#G
call proc_total_div(1);

#H
drop procedure proc_consulta_certo;

#delemiter

delimiter $$
	CREATE PROCEDURE proc_testeDelimiter (var_valor int)
		begin
		update Test
		set Valor = Valor * 1.5
		where Valor = var_valor and Valor < 500;
			update Test
			set Valor = Valor * 1.3
			where Valor = var_valor and Valor >= 500;
			end
	$$
delimiter ;

#2
create database teste_func;

use teste_func;

create table Funcionario(
	Matricula int primary key auto_increment,
	CPF bigint(11) not null,
	Nome varchar(255) not null,
	Salario decimal(8,2),
	Status varchar(255) not null
);

insert Funcionario values
(15000,"16951220344","Jena",2003.00, "Ativo"),
(15001,"16031002185","Jana",1399.00, "Ativo"),
(15002,"16410428180","Neville",1767.00, "Aposentado"),
(15003,"16331019907","Mona",921.00, "Ativo"),
(15004,"16010726125","Jesse",2171.00, "Ativo"),
(15005,"16860611628","Rylee",1518.00, "Ativo"),
(15006,"16570825234","Addison",954.00, "Ativo"),
(15007,"16350826538","Dane",3075.00, "Aposentado"),
(15008,"16820918192","Maris",2782.00, "Ativo"),
(15009,"16110206636","Deborah",1915.00, "Ativo"),
(15010,"16320307316","Fleur",1029.00, "Ativo"),
(15011,"16260206416","Ivory",1393.00, "Ativo"),
(15012,"16380316051","Tanek",2394.00, "Aposentado"),
(15013,"16130103389","Neve",1716.00, "Aposentado"),
(15014,"16950520611","Ila",1568.00, "Ativo"),
(15015,"16180229671","Upton",1432.00, "Ativo"),
(15016,"16341219887","Victoria",2016.00, "Ativo"),
(15017,"16650717636","Kristen",1724.00, "Ativo"),
(15018,"16871116290","Kylie",1618.00, "Aposentado"),
(15019,"16590303108","Donna",2822.00, "Ativo"),
(15020,"16811105074","Inga",1721.00, "Ativo"),
(15021,"16461018712","Gavin",2006.00, "Ativo"),
(15022,"16570609827","Jesse",2202.00, "Ativo"),
(15023,"16070707077","Nayda",1667.00, "Ativo"),
(15024,"16410915720","Jonah",3198.00, "Aposentado"),
(15025,"16301114367","Darius",3030.00, "Ativo"),
(15026,"16200702375","Ahmed",2597.00, "Ativo"),
(15027,"16550119693","Nash",1196.00, "Ativo"),
(15028,"16460429217","Riley",925.00, "Ativo"),
(15029,"16351214669","Shelley",1537.00, "Ativo"),
(15030,"16290414335","Andrew",1527.00, "Aposentado"),
(15031,"16071115307","Randall",2965.00, "Ativo"),
(15032,"16590215510","Forrest",2481.00, "Ativo"),
(15033,"16100922159","Moana",2694.00, "Ativo"),
(15034,"16861124660","Cameron",2473.00, "Ativo"),
(15035,"16740927819","Anthony",2239.00, "Ativo");

#A
delimiter $$
	create procedure proc_aumento(mat int)
		begin
		update Funcionario set Salario = Salario + ((Salario / 100) * 11.35) where Status = "Ativo" and Matricula = mat;
		update Funcionario set Salario = Salario + ((Salario / 100) * 12) where Status = "Aposentado" and Matricula = mat;
		end
$$
delimiter ;

#B
call proc_aumento(15000);
call proc_aumento(15015);
call proc_aumento(15023);
call proc_aumento(15030);

#C
drop procedure proc_aumento;

#D
delimiter $$
	create procedure proc_apos(sts varchar(255))
		begin
		update Funcionario set Salario = Salario + ((Salario / 100) * 2) where Status = "Aposentado" and Status = sts;
		update Funcionario set Salario = Salario where Status = "Ativo" and Status = sts;
		end
$$
delimiter ;

#F
#Funcionou

#G
delimiter $$
	create procedure proc_apos(sts varchar(255))
		begin
		update Funcionario set Salario = Salario where Status = "Aposentado" and Status = sts;
		update Funcionario set Salario = Salario + ((Salario / 100) * 5) where Status = "Ativo" and Status = sts;
		end
$$
delimiter ;

#H
create procedure proc_del_cpf(registro bigint) delete from Funcionario where CPF = registro;

#F
call proc_del_cpf(16031002185);
call proc_del_cpf(16380316051);
call proc_del_cpf(16740927819);

#J
#Funcionou

#3
#A
#Uma procedure é executada através do comando CALL.
#Uma procedure pode conter parâmetros do tipo IN, OUT e INOUT.
#Somente as afirmativas I e II estão corretas.

#4
#E
#O uso de Stored procedures pode reduzir o tráfego entre a aplicação e o servidor do banco, quando utilizadas no lugar de comandos SQL extensos contidos na aplicação.