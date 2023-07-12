use homework;
# Task #1
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/

create view auto25 
as select * from cars
where cost > 25000;

alter view auto25 
as select * from cars
where cost > 30000;

create view some_auto
as select * from cars
where name = "Audi" or name = "Skoda";



# Task #2
Create table train
(
train_id int,
station varchar(20),
station_time time
);

insert train values
(110, "San Francisco", "10:00:00"),
(110, "Redwood City", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "San Francisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

select * from train;

select *,
timediff(lead(station_time) over (partition by train_id), station_time) as time_to_next_train 
from train;
