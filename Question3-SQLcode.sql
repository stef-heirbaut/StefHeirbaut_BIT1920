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
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `idgene` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `gene_description` TEXT(250) NULL,
  PRIMARY KEY (`idgene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutation` (
  `idmutation` INT NOT NULL,
  `chromosome` INT NULL,
  `start_position` INT NULL,
  `end_position` INT NULL,
  `idgene` INT NULL,
  PRIMARY KEY (`idmutation`),
  INDEX `fk_mutation_1_idx` (`idgene` ASC) VISIBLE,
  CONSTRAINT `fk_mutation_1`
    FOREIGN KEY (`idgene`)
    REFERENCES `mydb`.`gene` (`idgene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `syndrome_description` TEXT(250) NULL,
  `idmutation` INT NULL,
  PRIMARY KEY (`idsyndrome`),
  INDEX `fk_syndrome_1_idx` (`idmutation` ASC) VISIBLE,
  CONSTRAINT `fk_syndrome_1`
    FOREIGN KEY (`idmutation`)
    REFERENCES `mydb`.`mutation` (`idmutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` INT NOT NULL,
  `patientname` VARCHAR(45) NULL,
  `patientage` INT NULL,
  `patient_gender` ENUM("MALE", "FEMALE") NULL,
  `patient_start_syndrom` DATE NULL,
  `id_syndrom` INT NULL,
  PRIMARY KEY (`idpatient`),
  INDEX `fk_patient_1_idx` (`id_syndrom` ASC) VISIBLE,
  CONSTRAINT `fk_patient_1`
    FOREIGN KEY (`id_syndrom`)
    REFERENCES `mydb`.`syndrome` (`idsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
