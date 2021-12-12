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


--alter table myTable alter column vColumn int


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



select*FROM employee_salary
ORDER BY (id)