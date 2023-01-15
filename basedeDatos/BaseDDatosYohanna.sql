-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PortafolioArg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PortafolioArg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PortafolioArg` DEFAULT CHARACTER SET utf8 ;
USE `PortafolioArg` ;

-- -----------------------------------------------------
-- Table `PortafolioArg`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Usuario` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Domicilio` (
  `id` INT NOT NULL,
  `Calle` VARCHAR(45) NULL,
  `Avenida` VARCHAR(45) NULL,
  `Altura` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Persona` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `FechaNac` DATE NULL,
  `Telefono` VARCHAR(12) NULL,
  `Correo` VARCHAR(45) NULL,
  `Sobre_Mi` VARCHAR(200) NULL,
  `Usuario_id` INT NOT NULL,
  `Domicilio_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Usuario_id`, `Domicilio_id`),
  INDEX `fk_Persona_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Persona_Domicilio1_idx` (`Domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `PortafolioArg`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_Domicilio1`
    FOREIGN KEY (`Domicilio_id`)
    REFERENCES `PortafolioArg`.`Domicilio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Tipo_empleo` (
  `id` INT NOT NULL,
  `Nombre_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Experiencia_Laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Experiencia_Laboral` (
  `id` INT NOT NULL,
  `Nombre_Empresa` VARCHAR(45) NULL,
  `Trabajo_Actual` TINYINT NULL,
  `Fecha_Inicio` DATE NULL,
  `Fecha_Fin` DATE NULL,
  `Descripcion` VARCHAR(200) NULL,
  `Persona_id` INT NOT NULL,
  `Tipo_empleo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`, `Tipo_empleo_id`),
  INDEX `fk_Expriencia-Laboral_Persona_idx` (`Persona_id` ASC) VISIBLE,
  INDEX `fk_Expriencia-Laboral_Tipo_empleo1_idx` (`Tipo_empleo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Expriencia-Laboral_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortafolioArg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Expriencia-Laboral_Tipo_empleo1`
    FOREIGN KEY (`Tipo_empleo_id`)
    REFERENCES `PortafolioArg`.`Tipo_empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Proyectos` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Url_img` VARCHAR(45) NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Proyectos_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortafolioArg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Tecnologias` (
  `id` INT NOT NULL,
  `Url_image` VARCHAR(200) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`Tecnologias_has_Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`Tecnologias_has_Persona` (
  `Tecnologias_id` INT NOT NULL,
  `Persona_id` INT NOT NULL,
  `Persona_Usuario_id` INT NOT NULL,
  PRIMARY KEY (`Tecnologias_id`, `Persona_id`, `Persona_Usuario_id`),
  INDEX `fk_Tecnologias_has_Persona_Persona1_idx` (`Persona_id` ASC, `Persona_Usuario_id` ASC) VISIBLE,
  INDEX `fk_Tecnologias_has_Persona_Tecnologias1_idx` (`Tecnologias_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tecnologias_has_Persona_Tecnologias1`
    FOREIGN KEY (`Tecnologias_id`)
    REFERENCES `PortafolioArg`.`Tecnologias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tecnologias_has_Persona_Persona1`
    FOREIGN KEY (`Persona_id` , `Persona_Usuario_id`)
    REFERENCES `PortafolioArg`.`Persona` (`id` , `Usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortafolioArg`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortafolioArg`.`educacion` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Persona_id` INT NOT NULL,
  `Persona_Usuario_id` INT NOT NULL,
  `Persona_Domicilio_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`, `Persona_Usuario_id`, `Persona_Domicilio_id`),
  INDEX `fk_Educacion_Persona1_idx` (`Persona_id` ASC, `Persona_Usuario_id` ASC, `Persona_Domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_id` , `Persona_Usuario_id` , `Persona_Domicilio_id`)
    REFERENCES `PortafolioArg`.`Persona` (`id` , `Usuario_id` , `Domicilio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
