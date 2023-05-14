--create tables in order of dependency: first no foreign keys, then the one that provides the most foreign keys, then those that rely on the most foreign keys

CREATE TABLE departments
(
dept_no varchar PRIMARY KEY NOT NULL,
dept_name varchar NOT NULL
);

CREATE TABLE titles
(
title_id varchar PRIMARY KEY NOT NULL,
title varchar NOT NULL
);

CREATE TABLE employees
(
emp_no INT NOT NULL,
emp_title_id varchar NOT NULL,
birth_date DATE NOT NULL,
first_name varchar NOT NULL,
last_name varchar NOT NULL,
sex varchar(1) NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no)
);

CREATE TABLE salaries 
(
emp_no INT PRIMARY KEY NOT NULL,
salary INT NOT NULL
);

CREATE TABLE dept_emp
(
emp_no INT NOT NULL,
dept_no varchar NOT NULL,
PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_manager
(
dept_no varchar NOT NULL,
emp_no INT PRIMARY KEY UNIQUE NOT NULL
); 

ALTER TABLE employees ADD CONSTRAINT employees_title_id FOREIGN KEY (emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

SELECT *
FROM departments;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;