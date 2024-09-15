-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `customer_id` CHAR(11) NOT NULL,
  `customer_first_name` VARCHAR(15) NULL,
  `customer_last_name` VARCHAR(15) NULL,
  `postcode` VARCHAR(10) NULL,
  `country_code` CHAR(2) NULL,
  `street_nb` INT NULL,
  `street_type` VARCHAR(10) NULL,
  `street_name` VARCHAR(30) NULL,
  `state_code` CHAR(2) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`tables`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`tables` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`tables` (
  `table_no` INT NOT NULL AUTO_INCREMENT,
  `max_nb_guests` INT NULL,
  PRIMARY KEY (`table_no`),
  UNIQUE INDEX `table_no_UNIQUE` (`table_no` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `staff_first_name` VARCHAR(15) NULL,
  `staff_last_name` VARCHAR(15) NULL,
  `staff_role` VARCHAR(20) NULL,
  `staff_salary` DECIMAL(8,2) NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `table_no` INT NULL,
  `booking_staff_id` INT NULL,
  `booking_date` DATE NULL,
  `booking_customer_id` CHAR(11) NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE INDEX `booking_id_UNIQUE` (`booking_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`booking_customer_id` ASC) VISIBLE,
  INDEX `table_no_idx` (`table_no` ASC) VISIBLE,
  INDEX `staff_id_idx` (`booking_staff_id` ASC) VISIBLE,
  CONSTRAINT `booking_customer_id`
    FOREIGN KEY (`booking_customer_id`)
    REFERENCES `LittleLemonDB`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `table_no`
    FOREIGN KEY (`table_no`)
    REFERENCES `LittleLemonDB`.`tables` (`table_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `booking_staff_id`
    FOREIGN KEY (`booking_staff_id`)
    REFERENCES `LittleLemonDB`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`starters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`starters` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`starters` (
  `name` VARCHAR(20) NOT NULL,
  `cost` DECIMAL(5,2) NULL,
  `prep_time` TIME NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`courses` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`courses` (
  `name` VARCHAR(20) NOT NULL,
  `cost` DECIMAL(5,2) NULL,
  `prep_time` TIME NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`desserts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`desserts` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`desserts` (
  `name` VARCHAR(20) NOT NULL,
  `cost` DECIMAL(5,2) NULL,
  `prep_time` TIME NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`sides`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`sides` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`sides` (
  `name` VARCHAR(20) NOT NULL,
  `cost` DECIMAL(5,2) NULL,
  `prep_time` TIME NULL,
  `sidescol` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`drinks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`drinks` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`drinks` (
  `name` VARCHAR(20) NOT NULL,
  `cost` DECIMAL(5,2) NULL,
  `prep_time` TIME NULL,
  `drinkscol` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menus` (
  `menu_name` VARCHAR(10) NOT NULL,
  `cuisine` VARCHAR(10) NULL,
  `starter` VARCHAR(20) NULL,
  `course` VARCHAR(20) NULL,
  `dessert` VARCHAR(20) NULL,
  `drink` VARCHAR(20) NULL,
  `side` VARCHAR(20) NULL,
  PRIMARY KEY (`menu_name`),
  UNIQUE INDEX `menu_name_UNIQUE` (`menu_name` ASC) VISIBLE,
  INDEX `starter_idx` (`starter` ASC) VISIBLE,
  INDEX `course_idx` (`course` ASC) VISIBLE,
  INDEX `dessert_idx` (`dessert` ASC) VISIBLE,
  INDEX `side_idx` (`side` ASC) VISIBLE,
  INDEX `drink_idx` (`drink` ASC) VISIBLE,
  CONSTRAINT `starter`
    FOREIGN KEY (`starter`)
    REFERENCES `LittleLemonDB`.`starters` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course`
    FOREIGN KEY (`course`)
    REFERENCES `LittleLemonDB`.`courses` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dessert`
    FOREIGN KEY (`dessert`)
    REFERENCES `LittleLemonDB`.`desserts` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `side`
    FOREIGN KEY (`side`)
    REFERENCES `LittleLemonDB`.`sides` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `drink`
    FOREIGN KEY (`drink`)
    REFERENCES `LittleLemonDB`.`drinks` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `order_id` CHAR(11) NOT NULL,
  `order_date` DATE NULL,
  `cost` DECIMAL(5,2) NULL,
  `sales` DECIMAL(5,2) NULL,
  `quantity` INT NULL,
  `discount` DECIMAL(5,2) NULL,
  `order_staff_id` INT NULL,
  `order_customer_id` CHAR(11) NULL,
  `menu_name` VARCHAR(10) NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `staff_id_idx` (`order_staff_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`order_customer_id` ASC) VISIBLE,
  INDEX `menu_name_idx` (`menu_name` ASC) VISIBLE,
  CONSTRAINT `order_staff_id`
    FOREIGN KEY (`order_staff_id`)
    REFERENCES `LittleLemonDB`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_customer_id`
    FOREIGN KEY (`order_customer_id`)
    REFERENCES `LittleLemonDB`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_name`
    FOREIGN KEY (`menu_name`)
    REFERENCES `LittleLemonDB`.`menus` (`menu_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`deliveries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`deliveries` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`deliveries` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_date` DATE NULL,
  `delivery_status` VARCHAR(10) NULL,
  `delivery_cost` DECIMAL(5,2) NULL,
  `order_id` CHAR(11) NULL,
  `delivery_staff_id` INT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE INDEX `delivery_id_UNIQUE` (`delivery_id` ASC) VISIBLE,
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `delivery_staff_id_idx` (`delivery_staff_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `LittleLemonDB`.`orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `delivery_staff_id`
    FOREIGN KEY (`delivery_staff_id`)
    REFERENCES `LittleLemonDB`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
