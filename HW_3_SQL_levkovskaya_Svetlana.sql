CREATE TABLE employees (
	id serial PRIMARY KEY,
	employee_name varchar (50) NOT null
)

CREATE TABLE roles (
	id serial PRIMARY KEY,
	role_name varchar(30) UNIQUE NOT null
)

--serial = unique + not null

CREATE TABLE employee_salary (
	id serial PRIMARY KEY,
	employee_id int UNIQUE NOT null,
	salary_id int NOT NULL
)


CREATE TABLE salary (
	id serial PRIMARY KEY,
	monthly_salary int NOT NULL
)

CREATE TABLE roles_emploee (
	id serial PRIMARY KEY,
	employee_id int UNIQUE NOT NULL,
	role_id int NOT NULL,
	foreign KEY (employee_id)
		REFERENCES employees (id),
	FOREIGN KEY (role_id)
		REFERENCES roles (id)
)

INSERT INTO salary (monthly_salary)
VALUES (1000),
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
	   (2500)

INSERT INTO employees (employee_name)
VALUES ('Miguel William Perry'),
('Michael Sebastian Kelly'),
('Wyatt Ethan Rivera'),
('Christopher Jose Hill'),
('Nathaniel Andrew Rivera'),
('Aiden Jackson Williams'),
('Jackson Isaac Flores'),
('Miguel Ashton Evans'),
('Justin Owen Patterson'),
('Caleb Sean Taylor'),
('Isaac Chase Nelson'),
('Ethan Carter Lopez'),
('Charles Steven Jenkins'),
('Wyatt Jackson Phillips'),
('Benjamin Noah Peterson'),
('Dylan Antonio Martin'),
('Cody Jordan Sanchez'),
('Wyatt Lucas Brooks'),
('Jeremiah Connor Bailey'),
('Adrian Evan Sanchez'),
('Cole Brian Mitchell'),
('Tyler Aidan Walker'),
('Jonathan Mason Anderson'),
('Gabriel Daniel Nelson'),
('Aidan Jesus Johnson'),
('Patrick Nathan Kelly'),
('Hunter John James'),
('Jacob Patrick Peterson'),
('Adrian Jesus Wright'),
('Ryan Aidan Long'),
('Ashton James Roberts'),
('Wyatt Justin Clark'),
('Benjamin Jesse Griffin'),
('Benjamin Kyle Sanchez'),
('Aiden Julian King'),
('Christopher Evan Murphy'),
('Logan Nathan Carter'),
('Richard Jason Hayes'),
('Bryan Jonathan Torres'),
('Luke Austin Griffin'),
('Xavier Jackson Robinson'),
('Alex Evan Powell'),
('Thomas Aaron Roberts'),
('Mason Austin Barnes'),
('Jackson Juan Coleman'),
('Jaden Jaden Phillips'),
('Samuel Thomas Harris'),
('Nathaniel Adam Kelly'),
('Aiden Ashton Lee'),
('Chase Aaron Moore'),
('Jessica Brianna Long'),
('Angelina Riley Peterson'),
('Caroline Taylor Rivera'),
('Taylor Ella Carter'),
('Ariana Danielle Bell'),
('Aaliyah Lauren Alexander'),
('Natalie Leah Gonzales'),
('Sofia Maria Wood'),
('Maya Lauren Walker'),
('Leslie Faith Green'),
('Claire Kaylee Jackson'),
('Caroline Kaylee Gonzales'),
('Samantha Jessica Jones'),
('Jordan Leslie Miller'),
('Amia Elizabeth Barnes'),
('Danielle Sara Perry'),
('Bailey Ashley Cox'),
('Morgan Molly Morgan'),
('Ashley Trinity Rogers'),
('Ashley Morgan Smith')



INSERT INTO roles (role_name)
VALUES ('Junior Python developer'),
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
('Sales Manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer')


INSERT INTO roles_emploee (employee_id, role_id)
VALUES (23,11),
(52,18),
(12,6),
(43,20),
(48,13),
(26,1),
(14,14),
(68,2),
(62,18),
(38,10),
(29,5),
(22,2),
(67,16),
(10,8),
(25,12),
(28,14),
(59,1),
(36,11),
(5,8),
(57,10),
(8,19),
(7,7),
(40,10),
(3,4),
(54,5),
(17,10),
(58,8),
(15,16),
(37,13),
(16,12),
(69,17),
(53,5),
(44,12),
(11,13),
(19,9)

--alter table roles alter column role_name type varchar(30)


INSERT INTO employee_salary (employee_id, salary_id)
VALUES (5,6),
(12,15),
(6,2),
(13,8),
(7,9),
(8,3),
(9,15),
(10,8),
(11,4),
(15,14),
(16,13),
(17,6),
(20,11),
(21,11),
(22,9),
(25,11),
(27,8),
(29,4),
(30,9),
(32,1),
(33,14),
(36,11),
(37,9),
(38,10),
(40,11),
(41,15),
(42,1),
(44,15),
(45,15),
(47,14),
(71,4),
(72,13),
(73,5),
(74,5),
(75,3),
(76,2),
(77,10),
(78,1),
(79,10),
(80,13)



SELECT * FROM employee_salary
ORDER BY (id)

import names

--for i in range(0, 70):
    --user_name = names.get_full_name()
    --print("    ('" + user_name + "'),")



CREATE TABLE salary_2(
	id serial PRIMARY KEY,
	monthly_salary int NOT NULL
)

INSERT INTO salary_2(monthly_salary)
VALUES (1000),
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
	   
ALTER TABLE salary_2 RENAME COLUMN monthly_salary TO m_salary

alter table salary_2 alter column m_salary type varchar(30)

ALTER TABLE salary_2 ALTER COLUMN m_salary TYPE integer USING m_salary::integer

SELECT * FROM salary_2;



--0. полная картина
SELECT employee_name, role_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
full JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id


 --1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.(30 работникам назначена ЗП)

SELECT employee_name, monthly_salary FROM employees 
JOIN employee_salary ON employees.id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id



 --2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employee_name, monthly_salary FROM employees 
JOIN employee_salary ON employees.id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id WHERE monthly_salary < 2000
 
 -- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT employee_id,employee_name, monthly_salary FROM employee_salary
JOIN salary ON employee_salary.salary_id = salary.id
LEFT JOIN employees ON employee_salary.employee_id = employees.id
WHERE employee_name IS NULL


 --4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT employee_id,employee_name, monthly_salary FROM employee_salary
JOIN salary ON employee_salary.salary_id = salary.id
LEFT JOIN employees ON employee_salary.employee_id = employees.id
WHERE employee_name IS NULL AND monthly_salary < 2000
 
 --5. Найти всех работников кому не начислена ЗП.
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN employee_salary ON employees.id = employee_salary.employee_id
LEFT JOIN salary ON employee_salary.salary_id = salary.id
WHERE monthly_salary IS NULL
 
 --6. Вывести всех работников с названиями их должности.
SELECT employee_name, role_name FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name IS NOT NULL
 
 
  --7. Вывести имена и должность только Java разработчиков.
SELECT employee_name, role_name FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name IS NOT NULL AND role_name LIKE '%Java%'

-- 8. Вывести имена и должность только Python разработчиков.
SELECT employee_name, role_name FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name IS NOT NULL AND role_name LIKE '%Python%'


 --9. Вывести имена и должность всех QA инженеров.
SELECT employee_name, role_name FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name IS NOT NULL AND role_name LIKE '%QA engineer'

 
 
 --10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name, role_name FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name IS NOT NULL AND role_name LIKE '%Manual QA engineer'

 
 
 --11. Вывести имена и должность автоматизаторов QA
SELECT employee_name, role_name FROM employees 
JOIN roles_employee ON employees.id = roles_employee.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name IS NOT NULL AND role_name LIKE '%Automation QA engineer'
 
 
 
 --12. Вывести имена и зарплаты Junior специалистов
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name IS NOT NULL AND role_name LIKE 'Junior%'
 
 --13. Вывести имена и зарплаты Middle специалистов
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name IS NOT NULL AND role_name LIKE 'Middle%' 
 
 
 --14. Вывести имена и зарплаты Senior специалистов
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name IS NOT NULL AND role_name LIKE 'Senior%'
 
--15. Вывести зарплаты Java разработчиков
SELECT monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name IS NOT NULL AND monthly_salary IS NOT NULL AND role_name LIKE '%Java%'

 --16. Вывести зарплаты Python разработчиков
SELECT monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%Python%'
 

 --17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE 'Junior Python%'
 
  
 --18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE 'Middle JavaScript%'
 
 
 --19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employee_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE 'Senior Java%'
 
 
 --20. Вывести зарплаты Junior QA инженеров
SELECT employee_name, role_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name like 'Junior% QA engineer' AND role_name NOT LIKE '%Automation%'


--21. Вывести среднюю зарплату всех Junior специалистов
SELECT avg(monthly_salary) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE 'Junior%' AND monthly_salary IS NOT null


 --22. Вывести сумму зарплат JS разработчиков
SELECT sum(monthly_salary) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%JavaScript%' AND monthly_salary IS NOT null
 
 
--23. Вывести минимальную ЗП QA инженеров
SELECT min(monthly_salary) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%QA engineer' AND monthly_salary IS NOT null
 
 --24. Вывести максимальную ЗП QA инженеров
SELECT max(monthly_salary) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%QA engineer' AND monthly_salary IS NOT null


 --25. Вывести количество QA инженеров
SELECT count(role_name) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%QA engineer' 


 --26. Вывести количество Middle специалистов.
SELECT count(role_name) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Middle%' 

--27. Вывести количество разработчиков
SELECT count(role_name) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%developer'  


 --28. Вывести фонд (сумму) зарплаты разработчиков.
 SELECT sum(monthly_salary) FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%developer'
 
 -- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT employee_name, role_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE employee_name IS NOT NULL AND role_name IS NOT NULL AND monthly_salary IS NOT null
ORDER BY employee_name

 --30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 SELECT employee_name, role_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE employee_name IS NOT NULL AND role_name IS NOT NULL AND monthly_salary IS NOT NULL AND monthly_salary BETWEEN 1700 AND 2300
ORDER BY employee_name, role_name, monthly_salary

 
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT employee_name, role_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE employee_name IS NOT NULL AND role_name IS NOT NULL AND monthly_salary IS NOT NULL AND monthly_salary < 2300
ORDER BY employee_name, role_name, monthly_salary
 
--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT employee_name, role_name, monthly_salary FROM employees 
LEFT JOIN roles_employee ON employees.id = roles_employee.employee_id
left JOIN roles ON roles_employee.role_id = roles.id
left JOIN employee_salary ON employees.id = employee_salary.employee_id
left JOIN salary ON employee_salary.salary_id = salary.id
WHERE employee_name IS NOT NULL AND role_name IS NOT NULL AND monthly_salary IS NOT NULL AND monthly_salary IN (1100, 1500, 2000)
ORDER BY employee_name, role_name, monthly_salary

