-- MySQL Script generated by MySQL Workbench
-- Fri Dec  8 11:04:20 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema my_projeception
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `my_projeception` ;

-- -----------------------------------------------------
-- Schema my_projeception
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `my_projeception` DEFAULT CHARACTER SET utf8 ;
USE `my_projeception` ;

-- -----------------------------------------------------
-- Table `my_projeception`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_projeception`.`Categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(39) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_projeception`.`Projets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_projeception`.`Projets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(55) NOT NULL,
  `description` TEXT(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_projeception`.`Statuts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_projeception`.`Statuts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_projeception`.`Utilisateurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_projeception`.`Utilisateurs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pseudonyme` NVARCHAR(15) NOT NULL,
  `mail` NVARCHAR(39) NOT NULL,
  `mdp` LONGTEXT NOT NULL,
  `nom` NVARCHAR(39) NULL,
  `prenom` NVARCHAR(39) NULL,
  `telephone` VARCHAR(20) NULL,
  `description` TEXT(2000) NULL,
  `est_banni` TINYINT(1) NOT NULL DEFAULT 0,
  `Statuts_id` INT NOT NULL DEFAULT 1,
  `Categories_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE,
  INDEX `fk_Utilisateurs_Statuts1_idx` (`Statuts_id` ASC) VISIBLE,
  INDEX `fk_Utilisateurs_Categories1_idx` (`Categories_id` ASC) VISIBLE,
  CONSTRAINT `fk_Utilisateurs_Statuts1`
    FOREIGN KEY (`Statuts_id`)
    REFERENCES `my_projeception`.`Statuts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateurs_Categories1`
    FOREIGN KEY (`Categories_id`)
    REFERENCES `my_projeception`.`Categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my_projeception`.`Utilisateurs_du_projet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_projeception`.`Utilisateurs_du_projet` (
  `Utilisateurs_id` INT NOT NULL,
  `Projets_id` INT NOT NULL,
  INDEX `fk_Utilisateurs_du_projet_Utilisateurs_idx` (`Utilisateurs_id` ASC) VISIBLE,
  INDEX `fk_Utilisateurs_du_projet_Projets1_idx` (`Projets_id` ASC) VISIBLE,
  CONSTRAINT `fk_Utilisateurs_du_projet_Utilisateurs`
    FOREIGN KEY (`Utilisateurs_id`)
    REFERENCES `my_projeception`.`Utilisateurs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateurs_du_projet_Projets1`
    FOREIGN KEY (`Projets_id`)
    REFERENCES `my_projeception`.`Projets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
