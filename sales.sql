/*
    Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
    Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
    Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
    Чем NULL отличается от 0?
*/
-- Задание №1 и №2: 

create database homework;
use homework;
create table sales(
id int primary key auto_increment,
product_name varchar (45),
product_count int,
price float
);

insert sales( product_name, product_count, price)
values
("table", 200, 2000),
("chair", 450, 3000),
("sofa", 50, 4500),
("cupboard", 75, 5000)
;

select product_count,
case 
	when product_count < 100
		then 'спешите, товара мало'
	when product_count > 300
		then 'много товара'
	else 'товар в наличии'
end as count
from sales;

-- Задание №3

create table orders(
id int primary key auto_increment,
customer varchar(45) not null,
createdData date not null,
productCount int not null default 1,
price decimal not null,
statusOrders int not null
);

insert orders( customer, createdData, productCount, price, statusOrders)
values
("Petrov ii", "10.10.2022", 5, 10.10, 1),
("Ivanov FG", "11.10.2022", 9, 200, 2),
("Sereev AA", "08.10.2022", 3, 134, 3);

select customer, createdData, productCount, price, 
case 
	when statusOrders = 1
		then 'Заказ в сборке'
	when statusOrders = 2
		then 'Заказ в доставке'
	else 'Заказ вручен'
end StatusOfOrder
from orders;

-- Задание #4
/*
 Значение NULL соответствует понятию «пустое поле», то есть «поле, не
содержащее никакого значения». "0" же явялется значением, символом.
*/

