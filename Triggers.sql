--1. To Show Customer Detail After Insert or Update

CREATE OR REPLACE TRIGGER show_customer
AFTER INSERT OR UPDATE
ON customer
FOR EACH ROW
WHEN(NEW.cust_id>0)
DECLARE
cust_city VARCHAR2(30);
BEGIN
dbms_output.put_line('Customer with ID ' || :NEW.cust_id);
dbms_output.put_line('Name of Customer is ' || :NEW.f_name || ' ' || :NEW.l_name);
dbms_output.put_line('Customer Contact ' || :NEW.phone_no);
SELECT city INTO cust_city
FROM city_code
WHERE zip_code=:NEW.zip_code;
dbms_output.put_line('Customer City ' || cust_city);
END;

--2. To Show Account Detail After Insert or Update

CREATE OR REPLACE TRIGGER show_account_details
AFTER INSERT OR UPDATE
ON account
FOR EACH ROW
WHEN(NEW.acc_no>0)
DECLARE
cust_name VARCHAR2(30);
name_of_branch VARCHAR2(30);
BEGIN
dbms_output.put_line('Account Number is ' || :NEW.acc_no);
dbms_output.put_line('Total Balance :' || :NEW.balance);
dbms_output.put_line('Account owner ID : ' || :NEW.cust_id);
SELECT f_name INTO cust_name
FROM customer
WHERE cust_id=:NEW.cust_id;
dbms_output.put_line('Account owner Name : ' || cust_name);
SELECT branch_name INTO name_of_branch
FROM branch
WHERE branch_code=:NEW.branch_code;
dbms_output.put_line('Branch Name of Account : ' || name_of_branch);
dbms_output.put_line(' ');
END;

--3.To Show Warning if Balance < 5000 After Insert or Update

CREATE OR REPLACE TRIGGER account_balance_warning
AFTER INSERT OR UPDATE
ON account
FOR EACH ROW
WHEN(NEW.balance<5000)
BEGIN
if(:NEW.balance<5000) THEN
dbms_output.put_line('Your Account balance is : ' || :NEW.balance || ' which is less than
5000.');
dbms_output.put_line('NOTICE :- Please Deposit Amount and keep your balance more than
5000');
END IF;
END;

-- 4. To Print Branch Details on Insert or Update

CREATE OR REPLACE TRIGGER show_branch_details
AFTER INSERT OR UPDATE
ON branch
FOR EACH ROW
WHEN(NEW.branch_code>0)
BEGIN
dbms_output.put_line('Branch Code : ' || :NEW.branch_code);
dbms_output.put_line('Branch Name :' || :NEW.branch_name);
dbms_output.put_line('Branch City : ' || :NEW.branch_city);

END;

-- 5. To Print Employee Details on Insert or Update

CREATE OR REPLACE TRIGGER show_employee_details
AFTER INSERT OR UPDATE
ON employee
FOR EACH ROW
WHEN(NEW.emp_id>0)
DECLARE
name_of_branch VARCHAR2(30);
BEGIN
dbms_output.put_line('Employee ID : ' || :NEW.emp_id);
dbms_output.put_line('Employee Name : ' || :NEW.emp_name);
dbms_output.put_line('Salary : ' || :NEW.salary);

SELECT branch_name INTO name_of_branch
FROM branch
WHERE branch_code=:NEW.branch_code;
dbms_output.put_line('Employee works in Branch named : ' || name_of_branch);
dbms_output.put_line('  ');
END;
