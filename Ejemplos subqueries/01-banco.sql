CREATE DATABASE `banco`;
USE `banco` ;
-- -----------------------------------------------------
-- Table `banco`.`cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`cuenta` (
  `id_cuenta` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` VARCHAR(50) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`));

-- -----------------------------------------------------
-- Table `banco`.`depositos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`depositos` (
  `id_deposito` INT(11) NOT NULL AUTO_INCREMENT,
  `id_cuenta` INT(11) NULL DEFAULT NULL,
  `monto` FLOAT NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_deposito`));

-- -----------------------------------------------------
-- Table `banco`.`extracciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`extracciones` (
  `id_extraccion` INT(11) NOT NULL AUTO_INCREMENT,
  `id_cuenta` INT(11) NULL DEFAULT NULL,
  `monto` FLOAT NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_extraccion`));

-- -----------------------------------------------------
-- Table `banco`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`personas` (
  `id_persona` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`));
  
