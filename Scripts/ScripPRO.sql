SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `IE_La_Inmaculada` ;
CREATE SCHEMA IF NOT EXISTS `IE_La_Inmaculada` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `IE_La_Inmaculada` ;

-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Jornada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Jornada` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Jornada` (
  `idJornada` INT NOT NULL ,
  `Jornada` VARCHAR(45) NOT NULL ,
  `Descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idJornada`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Periodo_Lectivo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Periodo_Lectivo` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Periodo_Lectivo` (
  `idPeriodo_Lectivo` INT NOT NULL ,
  `Periodo_Lectivo` VARCHAR(45) NOT NULL ,
  `Incio` DATE NOT NULL ,
  `Final` DATE NOT NULL ,
  `Descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idPeriodo_Lectivo`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Curso` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Curso` (
  `idCurso` INT NOT NULL ,
  `Curso` VARCHAR(20) NOT NULL ,
  `Descripcion` VARCHAR(100) NULL ,
  `FK_idJornada` INT NOT NULL ,
  `Periodo_Lectivo_idPeriodo_Lectivo` INT NOT NULL ,
  PRIMARY KEY (`idCurso`) ,
  CONSTRAINT `fk_Curso_Jornada1`
    FOREIGN KEY (`FK_idJornada` )
    REFERENCES `IE_La_Inmaculada`.`Jornada` (`idJornada` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_Periodo_Lectivo1`
    FOREIGN KEY (`Periodo_Lectivo_idPeriodo_Lectivo` )
    REFERENCES `IE_La_Inmaculada`.`Periodo_Lectivo` (`idPeriodo_Lectivo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Curso_Jornada1_idx` ON `IE_La_Inmaculada`.`Curso` (`FK_idJornada` ASC) ;

CREATE INDEX `fk_Curso_Periodo_Lectivo1_idx` ON `IE_La_Inmaculada`.`Curso` (`Periodo_Lectivo_idPeriodo_Lectivo` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Estudiantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Estudiantes` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Estudiantes` (
  `idEstudiante` INT NOT NULL ,
  `Nombre_E` VARCHAR(100) NOT NULL ,
  `Apellidos_E` VARCHAR(100) NOT NULL ,
  `Telefono_E` INT NOT NULL ,
  `Correo_E` VARCHAR(45) NULL ,
  `FechaNacimiento_E` DATE NOT NULL ,
  `FK_idJornada` INT NOT NULL ,
  `FK_idCurso` INT NOT NULL ,
  PRIMARY KEY (`idEstudiante`) ,
  CONSTRAINT `fk_Estudiantes_Jornada1`
    FOREIGN KEY (`FK_idJornada` )
    REFERENCES `IE_La_Inmaculada`.`Jornada` (`idJornada` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiantes_Curso1`
    FOREIGN KEY (`FK_idCurso` )
    REFERENCES `IE_La_Inmaculada`.`Curso` (`idCurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Estudiantes_Jornada1_idx` ON `IE_La_Inmaculada`.`Estudiantes` (`FK_idJornada` ASC) ;

CREATE INDEX `fk_Estudiantes_Curso1_idx` ON `IE_La_Inmaculada`.`Estudiantes` (`FK_idCurso` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Aula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Aula` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Aula` (
  `idAula` INT NOT NULL ,
  `Aula` VARCHAR(45) NOT NULL ,
  `Descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idAula`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Docente` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Docente` (
  `idDocente` INT NOT NULL ,
  `NombreD` VARCHAR(100) NOT NULL ,
  `ApellidosD` VARCHAR(100) NOT NULL ,
  `TelefonoD` INT NOT NULL ,
  `Profesorcol` VARCHAR(45) NULL ,
  PRIMARY KEY (`idDocente`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Materia` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Materia` (
  `idMateria` INT NOT NULL ,
  `Materia` VARCHAR(45) NOT NULL ,
  `Descripcion` VARCHAR(45) NULL ,
  `FK_idDocente` INT NOT NULL ,
  PRIMARY KEY (`idMateria`) ,
  CONSTRAINT `fk_Materia_Docente1`
    FOREIGN KEY (`FK_idDocente` )
    REFERENCES `IE_La_Inmaculada`.`Docente` (`idDocente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Materia_Docente1_idx` ON `IE_La_Inmaculada`.`Materia` (`FK_idDocente` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Dir_Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Dir_Curso` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Dir_Curso` (
  `FK_idProfesor` INT NOT NULL ,
  `FK_idCurso` INT NOT NULL ,
  `Despción` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`FK_idProfesor`, `FK_idCurso`) ,
  CONSTRAINT `fk_Dir_Curso_Profesor1`
    FOREIGN KEY (`FK_idProfesor` )
    REFERENCES `IE_La_Inmaculada`.`Docente` (`idDocente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dir_Curso_Curso1`
    FOREIGN KEY (`FK_idCurso` )
    REFERENCES `IE_La_Inmaculada`.`Curso` (`idCurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Dir_Curso_Profesor1_idx` ON `IE_La_Inmaculada`.`Dir_Curso` (`FK_idProfesor` ASC) ;

CREATE INDEX `fk_Dir_Curso_Curso1_idx` ON `IE_La_Inmaculada`.`Dir_Curso` (`FK_idCurso` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Aula_Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Aula_Curso` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Aula_Curso` (
  `FK_idCurso` INT NOT NULL ,
  `FK_idAula` INT NOT NULL ,
  PRIMARY KEY (`FK_idCurso`, `FK_idAula`) ,
  CONSTRAINT `fk_Aula_Curso_Curso1`
    FOREIGN KEY (`FK_idCurso` )
    REFERENCES `IE_La_Inmaculada`.`Curso` (`idCurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aula_Curso_Aula1`
    FOREIGN KEY (`FK_idAula` )
    REFERENCES `IE_La_Inmaculada`.`Aula` (`idAula` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Aula_Curso_Curso1_idx` ON `IE_La_Inmaculada`.`Aula_Curso` (`FK_idCurso` ASC) ;

CREATE INDEX `fk_Aula_Curso_Aula1_idx` ON `IE_La_Inmaculada`.`Aula_Curso` (`FK_idAula` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Docente_Jornada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Docente_Jornada` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Docente_Jornada` (
  `FK_idDocente` INT NOT NULL ,
  `FK_idJornada` INT NOT NULL ,
  PRIMARY KEY (`FK_idDocente`, `FK_idJornada`) ,
  CONSTRAINT `fk_Docente_Jornada_Docente1`
    FOREIGN KEY (`FK_idDocente` )
    REFERENCES `IE_La_Inmaculada`.`Docente` (`idDocente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docente_Jornada_Jornada1`
    FOREIGN KEY (`FK_idJornada` )
    REFERENCES `IE_La_Inmaculada`.`Jornada` (`idJornada` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Docente_Jornada_Docente1_idx` ON `IE_La_Inmaculada`.`Docente_Jornada` (`FK_idDocente` ASC) ;

CREATE INDEX `fk_Docente_Jornada_Jornada1_idx` ON `IE_La_Inmaculada`.`Docente_Jornada` (`FK_idJornada` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Materia_Estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Materia_Estudiante` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Materia_Estudiante` (
  `FK_idEstudiante` INT NOT NULL ,
  `FK_idMateria` INT NOT NULL ,
  `Nota_Periodo1` DECIMAL(2) NOT NULL ,
  `Nota_Periodo2` DECIMAL(2) NOT NULL ,
  `Nota_Periodo3` DECIMAL(2) NOT NULL ,
  `Nota_Periodo4` DECIMAL(2) NOT NULL ,
  `Promedio` DECIMAL(2) NOT NULL ,
  `FK_idPeriodo_Lectivo` INT NOT NULL ,
  PRIMARY KEY (`FK_idEstudiante`, `FK_idMateria`) ,
  CONSTRAINT `fk_Materia_Estudiante_Estudiantes`
    FOREIGN KEY (`FK_idEstudiante` )
    REFERENCES `IE_La_Inmaculada`.`Estudiantes` (`idEstudiante` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_Estudiante_Materia1`
    FOREIGN KEY (`FK_idMateria` )
    REFERENCES `IE_La_Inmaculada`.`Materia` (`idMateria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_Estudiante_Periodo_Lectivo1`
    FOREIGN KEY (`FK_idPeriodo_Lectivo` )
    REFERENCES `IE_La_Inmaculada`.`Periodo_Lectivo` (`idPeriodo_Lectivo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE INDEX `fk_Materia_Estudiante_Estudiantes_idx` ON `IE_La_Inmaculada`.`Materia_Estudiante` (`FK_idEstudiante` ASC) ;

CREATE INDEX `fk_Materia_Estudiante_Materia1_idx` ON `IE_La_Inmaculada`.`Materia_Estudiante` (`FK_idMateria` ASC) ;

CREATE INDEX `fk_Materia_Estudiante_Periodo_Lectivo1_idx` ON `IE_La_Inmaculada`.`Materia_Estudiante` (`FK_idPeriodo_Lectivo` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Rol` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Rol` (
  `idRol` INT NOT NULL ,
  `Rol` VARCHAR(20) NOT NULL ,
  `Descripcion` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idRol`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Usuario` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Usuario` (
  `idUsuario` INT NOT NULL ,
  `Password` VARCHAR(45) NOT NULL ,
  `Descripcion` VARCHAR(100) NOT NULL ,
  `Rol_idRol` INT NOT NULL ,
  PRIMARY KEY (`idUsuario`) ,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_idRol` )
    REFERENCES `IE_La_Inmaculada`.`Rol` (`idRol` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Usuario_Rol1_idx` ON `IE_La_Inmaculada`.`Usuario` (`Rol_idRol` ASC) ;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Privigio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Privigio` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Privigio` (
  `idPrivigio` INT NOT NULL ,
  `Privigio` VARCHAR(45) NOT NULL ,
  `Descripcion` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idPrivigio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IE_La_Inmaculada`.`Rol_Privigio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IE_La_Inmaculada`.`Rol_Privigio` ;

CREATE  TABLE IF NOT EXISTS `IE_La_Inmaculada`.`Rol_Privigio` (
  `Rol_idRol` INT NOT NULL ,
  `Privigio_idPrivigio` INT NOT NULL ,
  `C` VARCHAR(1) NOT NULL ,
  `R` VARCHAR(1) NOT NULL ,
  `U` VARCHAR(1) NOT NULL ,
  `D` VARCHAR(1) NOT NULL ,
  `V` VARCHAR(1) NOT NULL ,
  `I` VARCHAR(1) NOT NULL ,
  PRIMARY KEY (`Rol_idRol`, `Privigio_idPrivigio`) ,
  CONSTRAINT `fk_Rol_has_Privigio_Rol1`
    FOREIGN KEY (`Rol_idRol` )
    REFERENCES `IE_La_Inmaculada`.`Rol` (`idRol` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_has_Privigio_Privigio1`
    FOREIGN KEY (`Privigio_idPrivigio` )
    REFERENCES `IE_La_Inmaculada`.`Privigio` (`idPrivigio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Rol_has_Privigio_Privigio1_idx` ON `IE_La_Inmaculada`.`Rol_Privigio` (`Privigio_idPrivigio` ASC) ;

CREATE INDEX `fk_Rol_has_Privigio_Rol1_idx` ON `IE_La_Inmaculada`.`Rol_Privigio` (`Rol_idRol` ASC) ;

USE `IE_La_Inmaculada` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
