-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ola` ;

-- -----------------------------------------------------
-- Table `ola`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ola`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone_number` VARCHAR(15) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('Passenger', 'Driver') NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 568
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ola`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ola`.`drivers` (
  `driver_id` INT NOT NULL,
  `car_model` VARCHAR(100) NULL DEFAULT NULL,
  `license_number` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  CONSTRAINT `drivers_ibfk_1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `ola`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ola`.`passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ola`.`passengers` (
  `passenger_id` INT NOT NULL,
  `pass_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  CONSTRAINT `passengers_ibfk_1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `ola`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ola`.`riders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ola`.`riders` (
  `ride_id` INT NOT NULL AUTO_INCREMENT,
  `passenger_id` INT NULL DEFAULT NULL,
  `driver_id` INT NULL DEFAULT NULL,
  `start_location` VARCHAR(255) NULL DEFAULT NULL,
  `end_location` VARCHAR(255) NULL DEFAULT NULL,
  `ride_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `ride_status` ENUM('Completed', 'In Progress', 'Cancelled') NULL DEFAULT 'In Progress',
  PRIMARY KEY (`ride_id`),
  INDEX `passenger_id` (`passenger_id` ASC) VISIBLE,
  INDEX `driver_id` (`driver_id` ASC) VISIBLE,
  CONSTRAINT `riders_ibfk_1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `ola`.`passengers` (`passenger_id`),
  CONSTRAINT `riders_ibfk_2`
    FOREIGN KEY (`driver_id`)
    REFERENCES `ola`.`drivers` (`driver_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ola`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ola`.`payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `ride_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `payment_method` ENUM('Cash', 'Card', 'Online') NULL DEFAULT NULL,
  `payment_status` ENUM('Pending', 'Completed', 'Failed') NULL DEFAULT 'Completed',
  `payment_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  INDEX `ride_id` (`ride_id` ASC) VISIBLE,
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`ride_id`)
    REFERENCES `ola`.`riders` (`ride_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
