-- MySQL Script generated by MySQL Workbench
-- Tue Mar 28 11:20:37 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id_User` INT NOT NULL AUTO_INCREMENT,
  `Last_name` VARCHAR(50) NOT NULL,
  `Surname_name` VARCHAR(45) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_User`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Insurance case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Insurance case` (
  `id_Insurance_case` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Description` TEXT NOT NULL,
  `Count_Revers` INT(10) NOT NULL,
  `User_id_User` INT NOT NULL,
  PRIMARY KEY (`id_Insurance_case`),
  INDEX `fk_Insurance case_User_idx` (`User_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Insurance case_User`
    FOREIGN KEY (`User_id_User`)
    REFERENCES `mydb`.`User` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Auto` (
  `id_Auto` INT NOT NULL AUTO_INCREMENT,
  `Mark` VARCHAR(50) NOT NULL,
  `Model` VARCHAR(50) NOT NULL,
  `Year` INT NOT NULL,
  `Enngine_V` DECIMAL(5,2) NOT NULL,
  `license_plate` VARCHAR(20) NOT NULL,
  `Engine` TEXT NOT NULL,
  `Cost` DECIMAL(10,2) NOT NULL,
  `Insurance case_id_Insurance_case` INT NOT NULL,
  PRIMARY KEY (`id_Auto`),
  UNIQUE INDEX `license_plate_UNIQUE` (`license_plate` ASC) VISIBLE,
  INDEX `fk_Auto_Insurance case1_idx` (`Insurance case_id_Insurance_case` ASC) VISIBLE,
  CONSTRAINT `fk_Auto_Insurance case1`
    FOREIGN KEY (`Insurance case_id_Insurance_case`)
    REFERENCES `mydb`.`Insurance case` (`id_Insurance_case`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Insurance policy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Insurance policy` (
  `id_Insurance_policy` INT NOT NULL AUTO_INCREMENT,
  `Date_on` DATE NOT NULL,
  `Date_off` DATE NOT NULL,
  `Cost` INT(10) NOT NULL,
  PRIMARY KEY (`id_Insurance_policy`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Insurance case_has_Insurance policy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Insurance case_has_Insurance policy` (
  `Insurance case_id_Insurance_case` INT NOT NULL,
  `Insurance policy_id_Insurance_policy` INT NOT NULL,
  PRIMARY KEY (`Insurance case_id_Insurance_case`, `Insurance policy_id_Insurance_policy`),
  INDEX `fk_Insurance case_has_Insurance policy_Insurance policy1_idx` (`Insurance policy_id_Insurance_policy` ASC) VISIBLE,
  INDEX `fk_Insurance case_has_Insurance policy_Insurance case1_idx` (`Insurance case_id_Insurance_case` ASC) VISIBLE,
  CONSTRAINT `fk_Insurance case_has_Insurance policy_Insurance case1`
    FOREIGN KEY (`Insurance case_id_Insurance_case`)
    REFERENCES `mydb`.`Insurance case` (`id_Insurance_case`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Insurance case_has_Insurance policy_Insurance policy1`
    FOREIGN KEY (`Insurance policy_id_Insurance_policy`)
    REFERENCES `mydb`.`Insurance policy` (`id_Insurance_policy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
