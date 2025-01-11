CREATE DATABASE try; 

use try;

CREATE TABLE employees (
Employee_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (100),
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE
); 

CREATE TABLE employee_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT,
name VARCHAR
(100),
position VARCHAR (100), salary DECIMAL (10, 2), hire_date DATE,
action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 


INSERT INTO employees (name, position, salary, hire_date) VALUES ('John Doe',
'Software Engineer', 80000.00, '2022-01-15'),
('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01'); 


delimiter //
 create trigger try_insert after insert on employees
 for each row
 begin
       
       insert into employee_audit(employee_id,name,position,
          salary,hire_date,action_date) values
       (New.employee_id,New.name,New.position,New.salary,New.hire_date,current_timestamp);

end //

delimiter ;

#PROCEDURE

delimiter //
create procedure ad_em (
    IN emp_name VARCHAR(100),
    IN emp_position VARCHAR(100),
    IN emp_salary DECIMAL(10, 2),
    IN emp_hire_date DATE
)
begin 
    INSERT INTO employees (name, position, salary, hire_date)
    VALUES (emp_name, emp_position, emp_salary, emp_hire_date);
end//

delimiter ;





