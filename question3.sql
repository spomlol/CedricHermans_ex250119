-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema examquestion3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema examquestion3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `examquestion3` ;
USE `examquestion3` ;

-- -----------------------------------------------------
-- Table `examquestion3`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examquestion3`.`Syndrome` (
  `idSyndrome` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` TEXT NULL,
  PRIMARY KEY (`idSyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examquestion3`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examquestion3`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` ENUM("Male", "Female", "Other") NULL,
  `Age of diagnosis` INT NULL,
  `idSyndrome` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_Patient_Syndrome_idx` (`idSyndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Syndrome`
    FOREIGN KEY (`idSyndrome`)
    REFERENCES `examquestion3`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examquestion3`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examquestion3`.`Gene` (
  `idGene` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `start` INT UNSIGNED NULL,
  `end` INT UNSIGNED NULL,
  `Chromosome` CHAR(2) NULL,
  `Description` TEXT NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examquestion3`.`Gene_Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examquestion3`.`Gene_Syndrome` (
  `Index` INT NOT NULL AUTO_INCREMENT,
  `idGene` INT NOT NULL,
  `idSyndrome` INT NOT NULL,
  PRIMARY KEY (`Index`),
  INDEX `fk_Gene_has_Syndrome_Syndrome1_idx` (`idSyndrome` ASC) VISIBLE,
  INDEX `fk_Gene_has_Syndrome_Gene1_idx` (`idGene` ASC) VISIBLE,
  CONSTRAINT `fk_Gene_has_Syndrome_Gene1`
    FOREIGN KEY (`idGene`)
    REFERENCES `examquestion3`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gene_has_Syndrome_Syndrome1`
    FOREIGN KEY (`idSyndrome`)
    REFERENCES `examquestion3`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
