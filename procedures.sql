--1. To Print all the details of customers.

CREATE OR REPLACE PROCEDURE view_all_customers
AS
BEGIN
FOR counter IN (SELECT * FROM customer) LOOP
dbms_output.put_line(counter.cust_id ||' '||counter.f_name||' '||counter.l_name||'
'||counter.phone_no||' '||counter.zip_code);
END LOOP;
END;

--2.To Print all the accounts of a Particular Branch.

CREATE OR REPLACE PROCEDURE account_of_particular_branch(b_code IN NUMBER)
AS
BEGIN
FOR counter IN (SELECT * FROM account) LOOP
IF(counter.branch_code=b_code) THEN
dbms_output.put_line(counter.acc_no ||' '||counter.balance||' '||counter.cust_id||'
'||counter.branch_code);
END IF;
END LOOP;
END;