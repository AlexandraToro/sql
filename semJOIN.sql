create database Idonly;
use Idonly;
create table id1
(id_1 int primary key,
name1 varchar(30));

insert id1(id_1, name1)
values
(1, 'mango'),
(2,'kiwi'),
(5, 'млотаволэ'),
(6, 'bgf');

create table id2
(id_2 int primary key,
name2 varchar(30));

insert id2(id_2, name2)
values
(3, 'mango'),
(4,'kiwi');

select* from id1 
left join id2 
on id1.name1=id2.name2
union
select* from id1 
right join id2 
on id1.name1=id2.name2;

select* from id1 
left join id2 
on id1.name1=id2.name2
union
select* from id1 
right join id2 
on id1.name1=id2.name2
order by id_1;

select * from id1
union
select * from id2;


