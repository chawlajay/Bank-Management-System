--1. To View Customers having balance>50000.

CREATE VIEW special_customers AS
SELECT * FROM account
WHERE balance>50000;

--2.To View employees having salary > average salary.

CREATE VIEW greater_than_avg_salary_employees AS
SELECT * FROM employee
WHERE salary>(SELECT AVG(salary) FROM employee);
