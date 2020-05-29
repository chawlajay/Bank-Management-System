-- To Print Employees from particular Branch.

DECLARE
counter NUMBER;
code NUMBER;
CURSOR employees IS
SELECT * FROM employee;
BEGIN
code:=555555;
FOR counter IN employees LOOP
if(code=counter.branch_code) THEN
dbms_output.put_line(counter.emp_id ||' '||counter.emp_name||' '||counter.salary||'
'||counter.branch_code);
END IF;
END LOOP;
END;