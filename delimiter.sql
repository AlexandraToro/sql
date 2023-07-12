/*
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, 
часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

*/
use homework;
delimiter //
create procedure reformatting(sec int)
-- returns text
begin
set @days = sec div 86400;
set @hours = (sec mod 86400) div 3600;
set @minutes = ((sec mod 86400) mod 3600) div 60;
set @seconds = ((sec mod 86400) mod 3600) mod 60;
select concat(sec, ' -> ', @days,' days ', @hours, ' hours ', @minutes, ' minutes ', @seconds, ' seconds')
as seconds_equals;
end//
delimiter ;
call reformatting(4521254);
drop procedure reformatting;


/*
2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/
delimiter //
create procedure even_num()
begin
declare i int default 2;
while i<=10 do
	set @text = concat(@text,' ', i);
	set i=i+2;
	end while;
select @text;
set @text='';
end//
delimiter ;
call even_num;
drop procedure even_num;