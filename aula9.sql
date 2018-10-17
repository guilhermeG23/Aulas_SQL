#Aula 9
#Criar index

#Funcão: acelerar a pesquisa com o pre carregamento do select já feito no server o qual sempre se atualiza

#create index <indece> on <table>(<coluna>); 

use TechStore;

#Criando indeces nas tabelas já existentes
create index Jogos add index idx_Name_Jogos(Nome);

#Adicionando Indece
alter table Jogos add index idx_Name_J(Nome);

#pode usar com mais de um indece de uma vez
alter table Jogos add index idx_Name_J(Nome, ProdutosCodigo);

#Podemos fazer um select com base no index
select Nome from Jogos where Nome = "Fut2018";

#O index é opcional
select Nome from Jogos use index (idx_Name_J) where Nome = "Fut2018";

#Com o index a procura pela o resultado fica mais rapido, porém o tempo de inserção aumenta por que toda a vez que a tabela atualizar o index é recriado

#Deletar um index
#drop index <index> on <tabela>
drop index idx_Name_J on Jogos;

#Mostrar index de uma tabela
#show index from <tabela>
show index from Jogos;

#Dump dos index
create database Gibiteca;

use Gibiteca;

CREATE table Categoria(
Cod int(3) primary key not null,
Nome varchar(25) not null
);

insert Categoria values 
(1, "Infantil Meninos"),
(2, "Infantil Meninas"),
(3, "Manga"),
(4, "Comic/Marvel");

CREATE table HQ (
Num int(3) primary key auto_increment,
Nome varchar(40) not null,
Localizacao varchar(10) not null,
Ano int(4) not null,
CategoriaCod int(3) not null,
foreign key (CategoriaCod) references Categoria(Cod));

insert HQ values 
(0, "Cascao - O inicio", "A-1", 2010, 1),
(0, "Arco do Shogun - N.3", "B-1", 2011, 3),
(0, "DC: A Nova Fronteira", "C-1", 2005, 4),
(0, "Cascao - Apenas amigos", "A-1", 2015, 1),
(0, "Arco do Shogun - N.9", "B-1", 2002, 3),
(0, "Arco do Shogun - N.10", "B-1", 2012, 3),
(0, "SJA: A Era de Ouro", "C-1", 2011, 4),
(0, "Luluzinha - Muda de cara", "A-1", 2014, 2),
(0, "Magali - Fome de falar", "A-1", 2014, 2),
(0, "Chico Bento - Na madrugada", "A-1", 2005, 1),
(0, "Cebolinha - Noite de terror", "A-1", 2009, 1),
(0, "Cebolinha - Sempre amigos", "A-1", 2013, 1),
(0, "Monica - Que susto!", "A-1", 2012, 2),
(0, "Monica - Amiga da onça", "A-1", 2010, 2),
(0, "Power Girls - Mais que um desafio", 2008, 2),
(0, "Ansatsu Kyoushitsu - N.2", "B-1", 2007, 3),
(0, "Tio Patinhas - Um dia de Trabalho", "A-1", 2016, 1),
(0, "Arco do Shogun - N.5", "B-1", 2015, 3),
(0, "Demolidor Vol. 1", "C-1", 2014, 4),
(0, "Gintama - Desafio Mortal", "B-1", 2011, 3),
(0, "Tales of Demons and Gods - Longas noites", "B-1", 2010, 3),
(0, "Demolidor Vol. 2", "C-1", 2001, 4),
(0, "Demolidor Vol. 3", "C-1", 2012, 4),
(0, "Arco do Shogun - N.6", "B-1", 2010, 3),
(0, "Arco do Shogun - N.7", "B-1", 2009, 3),
(0, "Tio Patinhas - Saida de Mestre", "A-1", 2008, 1),
(0, "Chico Bento - seu Juca?", "A-1", 2005, 1),
(0, "Ansatsu Kyoushitsu - N.1", "B-1", 2011, 3),
(0, "Os Novos Titãs: O Contrato de Judas", "C-1", 2009, 4),
(0, "Batman: A Piada Mortal", "C-1", 2004, 4),
(0, "Luluzinha - Linda flor", "A-1" , 1999, 2),
(0, "Magali - Familia de verdade", "A-1", 2010, 2),
(0, "Asilo Arkham", "C-1", 2014, 4),
(0, "Arco do Shogun - N.4", "B-1", 2013, 3),
(0, "Arco do Shogun - N.8", "B-1", 2011, 3),
(0, "Batman: o Longo Dia das Bruxas", "C-1", 2012, 4),
(0, "Grandes Astros Superman", "C-1", 2013, 4),
(0, "Chico Bento - Sempre atrasado", "A-1", 2014, 1),
(0, "Ansatsu Kyoushitsu - Super", "B-1", 2015, 3),
(0, "Os Novos Titãs: Lutas e mais nada", "C-1", 2015, 4),
(0, "Batman: A escolha", "C-1", 2010, 4),
(0, "Luluzinha - Manha gelada", "A-1", 2010, 2),
(0, "Magali - A plantacao", "A-1", 2008, 2),
(0, "Chico Bento - Meu pesoar", "C-1", 2009, 1),
(0, "Arco do Shogun - Master", "B-1", 2010, 3),
(0, "Batman: amanhecer de verao", "C-1", 2011, 4),
(0, "Power Girls - Ameaçadas", "A-1", 2012, 2),
(0, "Ansatsu Kyoushitsu - N.3", "B-1", 2013, 3),
(0, "Ansatsu Kyoushitsu - N.4", "B-1", 2014, 3),
(0, "Gintama - Uniao", "B-1", 2002, 3),
(0, "Arco do Shogun - N.1", "B-1", 2003, 3),
(0, "Arco do Shogun - N.2", "B-1", 2005, 3),
(0, "Batman: Ano Um", "C-1", 2010, 4),
(0, "O Reino do Amanhã", "C-1", 2016, 4),
(0, "Saga dos Clones", "C-1", 2016, 4),
(0, "Homem de Ferro: A Cruzada", "C-1", 2016, 4),
(0, "Os X-Men de Chuck Austen", "C-1", 2015, 4),
(0, "Os Supremos – Millenium", "C-1", 2013, 4),
(0, "Demolidor Vol. 4", "C-1", 2013, 4),
(0, "Demolidor Vol. 5", "C-1", 2011, 4);