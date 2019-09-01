select * from Employees;
select * from Departments;

1) ������� Employees. �������� ������������ �������� �� ���� ����������� job_id ������� ������������� �� ����� 'CLERK'

select max(salary)
from Employees
where job_id like '%_CLERK';

2) ������� Employees. �������� ������������ �������� ����� ���� ������� ������� �� ������������

SELECT o.*
FROM (select avg(salary), department_id
from Employees
group by department_id
order by avg(salary) DESC
     ) o
WHERE rownum = 1;

3) ������� Employees, Departments, Locations. �������� ����� � ������� ���������� � ����� ������������ ������ ����.

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

4) ������� Employees. �������� ���� ���������� ������� ����� � ���������� ������ 6�� �����������

select count(employee_id), manager_id
from Employees
group by manager_id
having count(employee_id)>6;

5) ������� Employees. �������� ������ ����������� ��������� ������� ���������� �� ������ � ������ ������ ������ ���� � ����� job_title ���� ����������� ������ 15�� ��������

select first_name
from Employees

where DATE_FORMAT(date, '%c')='01'
where MONTH(hire_date)={$01}
and

length(job_title)>15

