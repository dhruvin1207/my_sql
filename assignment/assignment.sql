create database assignment;

use assignment;

/*question 1*/
create table contact(contact_id int primary key ,
company_id int,firstname varchar(45),lastname varchar(45),
street varchar(45),city varchar(45), state varchar(45),
zip varchar(45), ismain  boolean,email varchar(45),
phone varchar(12));

/*question 2*/
create table employee(employee_id int primary key ,
firstname varchar(45),lastname varchar(45),
salary varchar(45),hiredate date, jobtitle varchar(45),
email varchar(45),phone varchar(12));

/*question 3*/
create table contactemployee(contactemployee_id int 
primary key ,employee_id int,contact_id int,
contactdate date, description varchar(100));


use assignment;


/*question 4*/
UPDATE `assignment`.`employee` SET `phone` = '2155558800' 
WHERE (`employee_id` = '234');

use assignment;
/*question 5*/
create table company(company_id int primary key ,
companyname varchar(45),street varchar(45),city varchar(45)
, state varchar(45),zip varchar(45));

UPDATE `assignment`.`company` SET
`companyname` = 'Urban outfitter' 
WHERE (`company_id` = '876');


/*question 6*/

insert into  contact values
('3', '2345', 'Dianne Connor', 'Dianne Connor’s', 
'bal kunj', 'Jaypur', 'RJ', '381010', '1', 
'dianne.connor@urbanoutfiller.com', '9821765430');

insert into employee values
(1616,"Jack Lee", "Jong",
3000.00, '2021-05-01', "UI/UX Design", 
"jacklee10@gmail.com", "9789978789") ;

INSERT INTO contactemployee VALUES 
('3', '3', '1616', '2022-05-10', 'positive');

delete from contactemployee where contact_id =
(select contact_id from contact where firstname = 
"Dianne Connor") and employee_id = 
(select employee_id from employee 
where firstname = 'jack lee') ;

/*question 7*/
select * from employee e,company c ,contactemployee ce
,contact ct
where 
(e.employee_id = ce.employee_id) and
(ce.contact_id = ct.contact_id)
and (c.companyname = "toll brothers");

/*question 8*/
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

The percent sign (%) represents zero, one, or multiple characters
The underscore sign (_) represents one, single character


/*question 9*/

/*
Database Normalization is any systematic process of
organizing a database schema such that no data redundancy
occurs and there is least or no anomaly while performing 
any update operationon data. In other words, it means
dividing a large table into smaller pieces such that data
redundancy should be eliminated. The normalizing procedure 
depends on the functional dependencies among the attributes
inside a table and uses several normal forms to guide the 
design process.

The Normalization Process Begins With the Following:
First Normal Form (1NF): Ensures that each column contains only atomic
						 values that cannot be divided, and each record is 
                         unique.
Second Normal Form (2NF): Includes 1NF and removes subsets of data that 
						  would apply for more than one row and places that 
                          data in a separate table. It deals with a partial 
                          dependency example when a non-key attribute 
                          depends on part of a composite primary key.
Third Normal Form(3NF): This applies further normalization to the schema by 
						removing transitive dependencies, which are where 
                        the non-key attributes depend on other non-key 
                        attributes.
                        
Normalization ensures that databases are structured efficiently, 
reducing redundancy. 
*/

/*question 10*/
 /*
 Join in MySql is used to fetch the data from two or more table 
using related column(foreign key)

example
select * from Order inner join Customer 
on Order.o_id = Customer.or_cu ;

here Order is left table, Custome is right table, 
o_id is primary key in order table 
or_cu is foreign key which reference o_id primary key of Order table.

when we execute above query then it will fetch all the recored which are 
matched(common) in both order and customer table.
*/

/*question 11*/
/*
1. DDL (Data Definition Language)
DDL commands are used to define, modify, or manage the structure of a 
database and its objects, such as tables, schemas, indexes, views, and more.

Key Features:
Deals with schema and structure of the database.
Automatically commits changes (no rollback possible).
Common DDL Commands:
CREATE: Used to create a new database object (e.g., table, index, view).
Example:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);
ALTER: Modifies the structure of an existing database object.
	Example:
		ALTER TABLE Employees ADD DateOfJoining DATE;
DROP: Deletes a database object, such as a table or database.
	Example:
		DROP TABLE Employees;
TRUNCATE: Removes all records from a table but keeps its structure.
	Example:
		TRUNCATE TABLE Employees;

2. DML (Data Manipulation Language)
DML commands are used to manipulate or manage the data within database 
objects (e.g., inserting, updating, deleting, or retrieving data from tables).

Key Features:
Deals with data manipulation inside tables.
Can be rolled back if required (transaction-based).
Common DML Commands:
INSERT: Adds new records into a table.
	Example:
			INSERT INTO Employees (EmployeeID, Name, Position, Salary)
			VALUES (1, 'John Doe', 'Manager', 75000);
UPDATE: Modifies existing records in a table.
	Example:
			UPDATE Employees SET Salary = 80000 WHERE EmployeeID = 1;
DELETE: Removes specific records from a table.
	Example:
		DELETE FROM Employees WHERE EmployeeID = 1;
SELECT: Retrieves data from one or more tables.
	Example:
		SELECT * FROM Employees;

3. DCL (Data Control Language)
DCL commands are used to control access to data and manage user privileges 
in the database.

Key Features:
Manages permissions and security for database objects.
Not transaction-based (effects are immediately applied).
Common DCL Commands:
GRANT: Gives specific permissions to a user or role.
	Example:
		GRANT SELECT, INSERT ON Employees TO 'user123'@'localhost';
REVOKE: Removes specific permissions from a user or role.
	Example:
		REVOKE INSERT ON Employees FROM 'user123'@'localhost';
*/

/*question 12*/
/*
Join in MySql is used to fetch the data from two or more table 
using related column(foreign key)

There is 4 types of joins in MySql
1) inner join - which fetch the data matched in both table.
2) left join - which fetch the data from left table and matched data in both table.
3) right join - which fetch the data from right table and matched data in both table.alter
4) full join - which fetch all the data from left, right table and common in both table.

first table in join query is left table and second table is consider as right table.

example
select * from Order inner join Customer 
on Order.o_id = Customer.or_cu ;

here Order is left table, Custome is right table, 
o_id is primary key in order table 
or_cu is foreign key which reference o_id primary key of Order table.

when we execute above query then it will fetch all the recored which are 
matched(common) in both order and customer table.

*/
