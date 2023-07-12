use homework;
CREATE TABLE staff
(     
	id int primary key auto_increment,
    name1 varchar(30),
    surname varchar(30),
    speciality varchar (40),
    seniority int,
    salary int,
    age int
);
insert staff (name1, surname, speciality, seniority, salary, age)
values
("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Катькин", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Петр", "Петров", "рабочий", 40, 30000, 59),
("Сидр", "Сидоров", "рабочий",20, 25000, 40),
("Антон", "Антонов", "рабочий", 10, 20000, 35),
("Юра", "Юркин", "рабочий", 8, 19000, 28),
("Люся", "Люськина", "рабочий", 5, 15000, 25),
("Варя", "Войнова", "рабочий", 2, 11000, 22),
("Ира", "Игорева", "рабочий", 3, 12000, 24),
("Максим", "Максимов", "уборщик", 10, 10000, 19);

-- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
select * from staff
order by salary;

select * from staff
order by salary desc;

-- Выведите 5 максимальных зарплат (salary)
select * from staff
order by salary desc
limit 5;

-- Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
select speciality, sum(salary) from staff
group by speciality;

-- Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
select speciality, count(speciality) as count from staff
where speciality = "рабочий" and age >=24 and age<=42; 

-- Найти количество специальностей
select count(distinct speciality) as Count_speciality from staff;

-- Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
select speciality from staff
group by speciality
having avg(age)<44;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
select * from staff
order by salary
limit 7, 5;


