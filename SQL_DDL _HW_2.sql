--Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);
-- Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
values 
('Артём'),
('Мария'),
('Константин'),
('Владимир'),
('Полина'),
('Александр'),
('Платон'),
('Демид'),
('Вера'),
('София'),
('Наталья'),
('Тимофей'),
('Роберт'),
('Даниил'),
('Антон'),
('Филипп'),
('Милана'),
('Екатерина'),
('Марк'),
('Иван'),
('Тимур'),
('Фёдор'),
('Дарья'),
('Софья'),
('Максим'),
('Ева'),
('Камилла'),
('Валерия'),
('Гордей'),
('Агата'),
('Варвара'),
('Малика'),
('Агния'),
('Елизавета'),
('Глеб'),
('Кира'),
('Ксения'),
('Никита'),
('Таисия'),
('Роман'),
('Анатолий'),
('Матвей'),
('Мирослав'),
('Илья'),
('Амалия'),
('Фатима'),
('Алёна'),
('Ирина'),
('Михаил'),
('Захар'),
('Алексей'),
('Эмилия'),
('Ярослав'),
('Евгений'),
('Владислав'),
('Мирон'),
('Василиса'),
('Степан'),
('Злата'),
('Майя'),
('Сергей'),
('Дмитрий'),
('Кирилл'),
('Станислав'),
('Макар'),
('Егор'),
('Лидия');

--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
create table salary (
	id serial primary key,
	monthly_salary int not null
);

--Наполнить таблицу salary 15 строками:
insert into salary (monthly_salary)
	values (1000),
			(1100),
			(1200),
			(1300),
			(1400),
			(1500),
			(1600),
			(1700),
			(1800),
			(1900),
			(2000),
			(2100),
			(2200),
			(2300),
			(2400),
			(2500);
		
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id) values 
	(10, 40),
(9, 39),
(8, 38),
(7, 37),
(6, 36),
(5, 35),
(4, 34), 
(3, 33),
(2, 32),
(1, 31),
(52, 30),
(51, 29),
(50, 28),
(49, 27),
(48, 26),
(47, 25),
(46, 24), 
(45, 23),
(44, 22),
(43, 21),
(30, 20),
(29, 19),
(28, 18),
(27, 17),
(26, 16),
(25, 15),
(24, 14), 
(23, 13),
(22, 12),
(21, 11),
(20, 10),
(19, 9),
(18, 8),
(17, 7),
(16, 6),
(15, 5),
(14, 4), 
(13, 3),
(12, 2),
(11, 1);

--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
create table roles(
	id serial primary key,
	role_name int not null unique
);

--Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name type varchar(50);

--Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'), 
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'), 
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');			


--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
id serial primary key,
employee_id int unique not null,
role_id int not null,
foreign key(employee_id)references employees(id),
foreign key(role_id)references roles(id)
);
   

--Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id, role_id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7), 
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16), 
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 6), 
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 11),
(32, 12),
(33, 13),
(34, 14),
(35, 15),
(36, 16), 
(37, 17),
(38, 18),
(39, 19),
(40, 20);

select * from roles_employee;
select * from employees;
select * from roles;


