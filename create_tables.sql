CREATE TABLE city_code(
zip_code NUMBER PRIMARY KEY,
city VARCHAR2(50) NOT NULL
);

CREATE TABLE customer(
cust_id NUMBER PRIMARY KEY,
f_name VARCHAR2(20) NOT NULL,
l_name VARCHAR2(20),
zip_code NUMBER,
phone_no NUMBER,
FOREIGN KEY (zip_code) REFERENCES city_code(zip_code) ON DELETE CASCADE
);

CREATE TABLE branch(
branch_code NUMBER PRIMARY KEY,
branch_name VARCHAR2(30) NOT NULL,
branch_city VARCHAR2(30) NOT NULL
);


CREATE TABLE account(
acc_no NUMBER PRIMARY KEY, 
balance NUMBER, 
cust_id NUMBER, 
branch_code NUMBER, 
FOREIGN KEY (branch_code) REFERENCES branch(branch_code) ON DELETE CASCADE	,
FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);


CREATE TABLE employee(
emp_id NUMBER PRIMARY KEY, 
salary NUMBER, 
emp_name VARCHAR2(50) NOT NULL, 
branch_code NUMBER, 
FOREIGN KEY (branch_code) REFERENCES branch(branch_code) ON DELETE CASCADE
);
