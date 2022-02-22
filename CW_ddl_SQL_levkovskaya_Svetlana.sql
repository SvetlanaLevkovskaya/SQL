-- ddl операции


CREATE TABLE salary (
	id serial PRIMARY KEY,
	monthly_salary int NOT null
);


SELECT * FROM salary;

CREATE TABLE roles(
	id serial PRIMARY KEY,
	role_title varchar (50) UNIQUE NOT null
);

CREATE TABLE roles_salary(
	id serial PRIMARY KEY,
	id_role int NOT NULL,
	id_salary int NOT NULL,
	foreign KEY (id_role)
		REFERENCES roles(id),
	FOREIGN KEY (id_salary)
		REFERENCES salary(id)
);

SELECT * FROM roles_salary;

INSERT INTO salary(id, monthly_salary)
VALUES (DEFAULT, 1450),
	   (DEFAULT, 1650),
	   (DEFAULT, 1000);


	  
SELECT * FROM salary;


INSERT INTO roles(role_title)
VALUES ('QA_Engeenir_junior'),
	   ('QA_Engeenir_middle'),
	   ('QA_Engeenir_senior'),
	   ('QA_Engeenir_automation_junior'),
	   ('QA_Engeenir_automation_middle'),
	   ('QA_Engeenir_automation_senior'),
	   ('Java_developer_junior'),
	   ('Java_developer_middle'),
	   ('Java_developer_senior'),
	   ('Python_developer_junior'),
	   ('Python_developer_middle'),
	   ('Python_developer_senior'),
	   ('Manager'),
	   ('Designer'),
	   ('HR');
	  
	  
SELECT * FROM roles;

INSERT INTO roles_salary(id_role, id_salary)
VALUES (1, 4),
	   (2, 3),
	   (3, 6),
	   (2, 3),
	   (4, 1),
	   (5, 1),
	   (6, 9),
	   (7, 7),
	   (8, 10),
	   (9, 8),
	   (10, 11);
	  
	  
--INSERT INTO roles_salary(id_role, id_salary) шибка, так как есть реляция
--VALUES (1, 105),
	  
 
SELECT * FROM roles;

ALTER TABLE roles
ADD COLUMN parking int;


SELECT * FROM roles;

-- поменять название колонки
ALTER TABLE roles
RENAME COLUMN parking TO taxi;

ALTER TABLE roles
DROP COLUMN taxi;

SELECT * FROM roles;

-- поменять тип данных  

ALTER TABLE roles
ADD COLUMN parking int;

SELECT * FROM roles;

ALTER TABLE roles
ALTER COLUMN parking TYPE varchar (30) USING parking::varchar(30);

SELECT * FROM roles;

ALTER TABLE roles
ALTER COLUMN parking TYPE int USING parking::integer;

SELECT * FROM roles;

-- поменять наименование роли
UPDATE roles
SET role_title = 'HR_Business_partner'
WHERE id = 15;

SELECT * FROM roles;
SELECT * FROM salary;
SELECT * FROM roles_salary;







	   







