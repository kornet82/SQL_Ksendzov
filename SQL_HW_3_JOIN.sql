 --1. Вывести всех работников чьи зарплаты есть в базе, 
 --вместе с зарплатами.
 
 select employee_name, monthly_salary
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary on employee_salary.salary_id = salary.id;


 -- 2. Вывести всех работников у которых ЗП меньше 2000.
 select employee_name, monthly_salary
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary on employee_salary.salary_id = salary.id
 where monthly_salary < 2000;
 
 --3. Вывести все зарплатные позиции, 
 --но работник по ним не назначен. 
 --(ЗП есть, но не понятно кто её получает.)
 select employee_name, monthly_salary
 from 
 employee_salary left join employees 
 on employee_salary.employee_id = employees.id
 left join salary 
 on employee_salary.salary_id = salary.id
 where employee_name is null;

 --4. Вывести все зарплатные позиции  меньше 2000 
 --но работник по ним не назначен. 
 --(ЗП есть, но не понятно кто её получает.)
 select employee_name, monthly_salary
 from employee_salary
 left join employees on employee_salary.employee_id = employees.id
 left join salary on employee_salary.salary_id = salary.id
 where employee_name is null and monthly_salary < 2000;

 -- 5. Найти всех работников кому не начислена ЗП.
select employee_name,salary_id
from 
employees left join employee_salary 
on employees.id = employee_salary.employee_id 
where salary_id is null;

 --6. Вывести всех работников с названиями их должности.
select employee_name, role_name
from 
employees left join roles_employee 
on employees.id = roles_employee.employee_id
left join roles on roles_employee.role_id = roles.id;
 
 --7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from
employees left join roles_employee
on employees.id = roles_employee.employee_id 
		  left join roles 
on roles_employee.role_id = roles.id 
where role_name ilike '%Java developer%';

 --8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from
employees left join roles_employee
on employees.id = roles_employee.employee_id 
          left join roles 
on roles_employee.role_id = roles.id 
where role_name ilike '%Python developer%';

 --9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from
employees left join roles_employee
on employees.id = roles_employee.employee_id 
          left join roles 
on roles_employee.role_id = roles.id 
where role_name ilike '%QA%';

 --10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from
employees left join roles_employee
on employees.id = roles_employee.employee_id 
          left join roles 
on roles_employee.role_id = roles.id 
where role_name ilike '%Manual QA%';

 --11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from
employees left join roles_employee
on employees.id = roles_employee.employee_id 
          left join roles 
on roles_employee.role_id = roles.id 
where role_name ilike '%Automation QA%';

 --12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Middle%';

 --14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Senior%';

 --15. Вывести зарплаты Java разработчиков

select monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Java%';

 --16. Вывести зарплаты Python разработчиков
select monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Middle JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Senior JavaScript%';

-- 20. Вывести зарплаты Junior QA инженеров
select  monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where (role_name ilike '%junior%') and (role_name ilike '%qa%');

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) as average_salary_junior
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) as summ_salary_js
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%JavaScript%';

 --23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) as min_salary_QA
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) as min_salary_QA
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%QA%';

-- 25. Вывести количество QA инженеров
select count(*) as "Количество QA инженеров"
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(*) as "Количество Middle специалистов"
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков

select count(*) as "Количество разработчиков"
from employee_salary
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';


 --28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as sum_salary_developers
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where role_name ilike '%developer%';

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name,role_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
order by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию 
--у специалистов у которых ЗП от 1700 до 2300
select employee_name,role_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where (monthly_salary >= 1700) and (monthly_salary <= 2300)
order by monthly_salary;

 --31. Вывести имена, должности и ЗП всех специалистов 
 --по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name,role_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where monthly_salary < 2300
order by monthly_salary;

 --32. Вывести имена, должности и ЗП всех специалистов 
 --по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name,role_name, monthly_salary
from roles_employee 
join employee_salary on roles_employee.employee_id  = employee_salary.employee_id 
join employees on roles_employee.employee_id = employees.id 
join roles on role_id = roles.id 
join salary on salary_id = salary.id 
where (monthly_salary = 1100) or (monthly_salary = 1500) or (monthly_salary = 2000)
--where monthly_salary in (1100, 1500, 2300)
order by monthly_salary;
