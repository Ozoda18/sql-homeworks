1.select *
from employees
where salary=(select min(salary) as min_salary from employees);
2.select * from products
where price>(select avg(price) from products);
3.select *
from employeess
where id in(
select id from departments
where department_name='Sales');
4.select* from customerss c
where not exists(
select 1
from orderss o
where o.customer_id=c.customer_id );
5.select * from products2 p
where p.price=(
select max(p1.price)
from products2 p1
where p.category_id=p1.category_id);
6.SELECT e.*
FROM employees1 e
WHERE e.department_id = (
    SELECT TOP 1 department_id
    FROM employees1
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);
7.select *
from employees2 em1
where salary>
(select avg(salary) from employees2 em2
where em1.department_id=em2.department_id
group by department_id
);
8.SELECT s.student_id, s.[name], g.course_id, g.grade
FROM students1 s
JOIN grades g ON s.student_id = g.student_id
WHERE g.grade = (
    SELECT MAX(grade)
    FROM grades
    WHERE course_id = g.course_id
    GROUP BY course_id
)
order by student_id;
9.SELECT *
FROM (
    SELECT 
        p.id,
		p.product_name,
        p.price,
        row_number() OVER (PARTITION BY p.category_id ORDER BY p.price DESC) AS price_rank
    FROM products2 p
) AS ranked_prices
WHERE price_rank = 3;
10.select * from employeesss
select id,[name],salary
from employeesss e
where e.salary>(select avg(salary)
from employeesss
) and e.salary<(select max(salary)
from employeesss e1
where e.department_id=e1.department_id)

