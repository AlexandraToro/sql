use productbd;
create table Users
(
id int auto_increment primary key,
UserName varchar(30),
age int,
address varchar(30),
salary int
);

insert Users(UserName, age, address, salary)
values 
("Valera",32,"Moskva",20000),
("Vasa",22,"Moskva",20100),
("Sergey",30,"Moskva",22000),
("Valera",32,"SBP",20500);

select * from Users;

-- commit сохранение и вывод
commit;
delete from Users where age = 32; 


-- rollback
start transaction;
delete from Users where age = 32;
rollback;
select * from Users;

-- savepoint сохранение всей базы
start transaction;
savepoint save;
delete from Users where age = 32;
rollback to save;