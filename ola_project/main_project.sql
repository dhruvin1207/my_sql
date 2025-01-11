INSERT INTO users VALUES
 ('346', 'ravi', 'ravi123@gmail.com', '9508654321', 
 'ravi@234', 'driver', '2025-01-03');
 
INSERT INTO drivers VALUES ( '123','innova', 'GJ01 2345');
INSERT INTO drivers  VALUES ('346', 'swift', 'GJ01 3456');

INSERT INTO passengers VALUES ( '234','het');
INSERT INTO passengers VALUES ( '345','deep');

INSERT INTO riders VALUES
 ('1', '234', '123', 'maninager', 'gota',
 '2024-12-01','Completed');
INSERT INTO riders VALUES
 ('2', '345', '346', 'iskon', 'prahladnager',
 '2025-01-01','Cancelled');
 
 UPDATE users
 SET email = 'ravi12@gmail.com' WHERE user_id = 346;
 
select * from passengers where pass_name like "%h" ;
select * from passengers where pass_name like "h%" ;
select * from passengers where pass_name like "_e%" ;
 
SELECT * FROM riders
 LEFT JOIN passengers ON riders.passenger_id = passengers.passenger_id ;

SELECT * FROM riders
 right JOIN passengers ON riders.passenger_id = passengers.pass_name ;
 
SELECT * FROM users
 LEFT JOIN passengers ON users.user_id = passengers.passenger_id ; 
 
 
 
 
 