-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FlightBooking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FlightBooking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FlightBooking` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `FlightBooking` ;

-- -----------------------------------------------------
-- Table `FlightBooking`.`Passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightBooking`.`Passengers` (
  `idPassengers` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Phone1` INT NOT NULL,
  `Phone2` INT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NULL,
  `Passengerscol` VARCHAR(45) NULL,
  `security_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPassengers`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Phone1_UNIQUE` (`Phone1` ASC) VISIBLE,
  UNIQUE INDEX `security_number_UNIQUE` (`security_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightBooking`.`Airplane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightBooking`.`Airplane` (
  `idAirplane` INT NOT NULL AUTO_INCREMENT,
  `Airplane_Name` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  `capacity` INT NOT NULL,
  `Airplan_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAirplane`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightBooking`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightBooking`.`Flight` (
  `idFlight` INT NOT NULL AUTO_INCREMENT,
  `Airline_Name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `City_of_departure` VARCHAR(45) NOT NULL,
  `City_of arrival` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Price` INT NOT NULL,
  `Flight_type` VARCHAR(45) NOT NULL,
  `idAirplane` INT NOT NULL,
  PRIMARY KEY (`idFlight`),
  INDEX `CapacityF_idx` (`idAirplane` ASC) VISIBLE,
  CONSTRAINT `CapacityF`
    FOREIGN KEY (`idAirplane`)
    REFERENCES `FlightBooking`.`Airplane` (`idAirplane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightBooking`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightBooking`.`Ticket` (
  `idTicket` INT NOT NULL,
  `idPassengers` INT NOT NULL,
  `idFlight` INT NOT NULL,
  `seats_number` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `Flight_idx` (`idFlight` ASC) VISIBLE,
  INDEX `passenger_idx` (`idPassengers` ASC) VISIBLE,
  CONSTRAINT `Flight`
    FOREIGN KEY (`idFlight`)
    REFERENCES `FlightBooking`.`Flight` (`idFlight`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `passenger`
    FOREIGN KEY (`idPassengers`)
    REFERENCES `FlightBooking`.`Passengers` (`idPassengers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
