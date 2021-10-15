----Employee Database_challenge.sql

-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
CREATE Table employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
CREATE TABLE dept_employee(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
 );
 

-----Employee Database_challenge.sql

SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

--Retrieve emp_no, first_name, last_name, title
SELECT rt.emp_no, rt.first_name, rt.last_name, rt.title, to_date
INTO fred_table
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, title
INTO unique_titles
FROM fred_table as rt
ORDER BY rt.emp_no;

SELECT * FROM unique_titles

SELECT COUNT(title), title
INTO retiring_table
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_table


--Deliverable 2

SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   e.birth_date,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO mentor3
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM mentor3;

SELECT DISTINCT ON (m3.emp_no) m3.emp_no, m3.first_name, m3.last_name, m3.birth_date, m3.title, m3.from_date, m3.to_date
INTO mentorship_eligibility
FROM mentor3 as m3
ORDER BY m3.emp_no;

SELECT * FROM mentorship_eligibility;










