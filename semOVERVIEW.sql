use homework;
create table academic_record (
	name varchar(45),
	quartal  varchar(45),
    subject varchar(45),
	grade int
);

insert into academic_record
values
	('Александр','1 четверть', 'математика', 4),
	('Александр','2 четверть', 'русский', 4),
	('Александр', '3 четверть','физика', 5),
	('Александр', '4 четверть','история', 4),
	('Антон', '1 четверть','математика', 4),
	('Антон', '2 четверть','русский', 3),
	('Антон', '3 четверть','физика', 5),
	('Антон', '4 четверть','история', 3),
    ('Петя', '1 четверть', 'физика', 4),
	('Петя', '2 четверть', 'физика', 3),
	('Петя', '3 четверть', 'физика', 4),
	('Петя', '4 четверть', 'физика', 5);

select * 
from academic_record;

/*
Получить с помощью оконных функции:

1. Средний балл ученика

2. Наименьшую оценку ученика

3. Наибольшую оценку ученика 

*/

select name, avg(grade) from academic_record group by name;

SELECT name, AVG(grade)
OVER (partition by name)
FROM academic_record;

SELECT name, min(grade)
OVER (partition by name),
max(grade)
OVER (partition by name)
FROM academic_record;

SELECT name, max(grade)
OVER (partition by name)
FROM academic_record;

-- текущая успеваемость по физике Петипо четверти
select name, grade, subject FROM academic_record
where name = "Петя" and quartal = "4 четверть";


select name, grade, subject, lead (quartal) over (partition by subject)
from academic_record
where name = "Петя" and subject = "физика";


select name, grade, subject, lag (quartal) over (partition by subject)
from academic_record
where name = "Петя" and subject = "физика";


CREATE TABLE summer_medals 
(
	year INT,
    city VARCHAR(45),
    sport VARCHAR(45),
    discipline VARCHAR(45),
    athlete VARCHAR(45),
    country VARCHAR(45),
    gender VARCHAR(45),
    event VARCHAR(45),
    medal VARCHAR(45)
);

SELECT *
FROM summer_medals;
INSERT summer_medals
VALUES
	(1896, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle", "Gold"),
	(1896, "Athens", "Archery", "Swimming", "HERSCHMANN Otto", "AUT", "Men","100M Freestyle", "Silver"),
    (1896, "Athens", "Athletics", "Swimming", "DRIVAC Dimitros", "GRE", "Men","100M Freestyle For Saliors", "Bronze"),
    (1900, "Athens", "Badminton", "Swimming", "MALOKINIS Ioannis", "GRE", "Men","100M Freestyle For Saliors", "Gold"),
    (1896, "Athens", "Aquatics", "Swimming", "CHASAPIS Spiridon", "GRE", "Men","100M Freestyle For Saliors", "Silver"),
    (1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","1200M Freestele", "Bronze"),
    (1905, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle For Saliors", "Gold"),
    (1896, "Athens", "Aquatics", "Swimming", "ANDREOU Joannis", "GRE", "Men","1200M Freestyle", "Silver"),
    (1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","400M Freestyle", "Bronze");

/*Выберите имеющиеся виды спорта и пронумеруем их в алфавитном порядке
Создайте представление, в которое попадает информация о спортсменах
Создайте представление,в котором будет храниться информация о спортсменах по конкретному виду спорта (Aquatics)
*/

select sport, dense_rank () over (order by sport) as number
from summer_medals;

create view Sportmans 
as select athlete, country, gender, sport
from summer_medals
where sport= "Aquatics";

create view sports 
as select athlete, country, gender, sport
from summer_medals
where sport= "Aquatics";

