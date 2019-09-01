select * from Employees;
select * from Departments;

1) Таблица Employees. Получить максимальную зарплату из всех сотрудников job_id которыз заканчивается на слово 'CLERK'

select max(salary)
from Employees
where job_id like '%_CLERK';

2) Таблица Employees. Получить максимальную зарплату среди всех средних зарплат по департаменту

SELECT o.*
FROM (select avg(salary), department_id
from Employees
group by department_id
order by avg(salary) DESC
     ) o
WHERE rownum = 1;

3) Таблица Employees, Departments, Locations. Получить город в котором сотрудники в сумме зарабатывают меньше всех.

SELECT city, sum(salary)
FROM Employees e
join departments d on (e.department_id  = d.department_id)
join locations l on (d.location_id = l.location_id)
group by city
having sum(salary) = (SELECT min(sum(salary))
FROM Employees e
join departments d on (e.department_id  = d.department_id)
join locations l on (d.location_id = l.location_id)
group by city);

SELECT city
FROM Employees e
join departments d on (e.department_id  = d.department_id)
join locations l on (d.location_id = l.location_id)
group by city
having sum(salary) = (SELECT min(sum(salary))
FROM Employees e
join departments d on (e.department_id  = d.department_id)
join locations l on (d.location_id = l.location_id)
group by city);

4) Таблица Employees. Показать всех менеджеров которые имеют в подчинении больше 6ти сотрудников

select count(employee_id), manager_id
from Employees
group by manager_id
having count(employee_id)>6;

5) Таблица Employees. Получить список сотрудников менеджеры которых устроились на работу в январе месяце любого года и длина job_title этих сотрудников больше 15ти символов

select first_name
from Employees

where DATE_FORMAT(date, '%c')='01'
where MONTH(hire_date)={$01}
and

length(job_title)>15

