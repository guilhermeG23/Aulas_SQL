create database A;

use A;

create table a1( a1 int(3) zerofill not null auto_increment primary key);
insert into a1 values (default), (default), (default), (default), (default), (default), (default), (default), (default), (default);

create table a2(
	a1 int zerofill not null auto_increment primary key,
	a2 int(3) zerofill not null,
	foreign key (a2) references a1(a1)
);
insert into a2 values (default, 001), (default, 002), (default, 003), (default, 004), (default, 005), (default, 006), (default, 007), (default, 008), (default, 009), (default, 010);