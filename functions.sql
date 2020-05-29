--1.To calculate total number of Employees.

CREATE OR REPLACE FUNCTION total_employees
RETURN NUMBER IS total_emp NUMBER;
BEGIN
SELECT COUNT(*) INTO total_emp
FROM employee;
RETURN total_emp;
END;

--2.To Calculate Average Salary of Employees.

CREATE OR REPLACE FUNCTION avg_salary
RETURN NUMBER IS average NUMBER;
BEGIN
SELECT AVG(salary) INTO average
FROM employee;
RETURN average;
END;