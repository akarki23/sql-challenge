-- Table Schema using pgAdmin --

-- Drop tables if they exist
DROP TABLE IF EXISTS departments, dept_manager, dept_emp, employees, salaries, titles CASCADE;

-- Create our empty tables --

-- Create departments table
CREATE TABLE "departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
    -- Adding primary key constraint on dept_no column
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

-- Create department manager table
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

-- Create department employee table
CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

-- Create employees table
CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "gender" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL,
    -- Adding primary key constraint on emp_no column
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

-- Create salaries table
CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

-- Create titles table
CREATE TABLE "titles" (
    "emp_no" INT NOT NULL,
    "title" VARCHAR NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);

-- IMPORT CSV FILES BEFORE PROCEEDING --

-- Adding foreign key constraints on emp_no & dept_no columns after creating tables and importing CSV files --

-- Department employee table
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Department manager table
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Salaries table
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Titles table
ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Query each table in order to confirm the data --

-- Display departments data
SELECT *
FROM departments;

-- Display department employees data
SELECT *
FROM dept_emp;

-- Display department manager data
SELECT *
FROM dept_manager;

-- Display employees data
SELECT *
FROM employees;

-- Display salaries data
SELECT *
FROM salaries;

-- Display titles data
SELECT *
FROM titles;