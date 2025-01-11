create database ola;

use ola;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL, 
    phone_number VARCHAR(15), 
    password VARCHAR(255) NOT NULL, 
    role ENUM('Passenger', 'Driver') NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY, 
    car_model VARCHAR(100), 
    license_number VARCHAR(50),
    FOREIGN KEY (driver_id) REFERENCES Users(user_id)
);


CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY, 
    pass_name varchar(50),
    FOREIGN KEY (passenger_id) REFERENCES Users(user_id)
);

CREATE TABLE Riders (
    ride_id INT PRIMARY KEY AUTO_INCREMENT, 
    passenger_id INT, 
    driver_id INT, 
    start_location VARCHAR(255), 
    end_location VARCHAR(255), 
    ride_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ride_status ENUM('Completed', 'In Progress', 'Cancelled') DEFAULT 'In Progress',
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id), 
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT, 
    ride_id INT, 
    amount DECIMAL(10, 2), 
    payment_method ENUM('Cash', 'Card', 'Online '), 
    payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Completed',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ride_id) REFERENCES Riders(ride_id)
);


