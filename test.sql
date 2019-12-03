-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS 'test' DEFAULT CHARACTER SET utf8 ;
USE 'test' ;

-- -----------------------------------------------------
-- Table 'test'.'user'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'test'.'user' (
  'UserID' INT(11) UNSIGNED NOT NULL,
  'Identify' VARCHAR(45) NOT NULL,
  'Password' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('UserID'))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table 'test'.'classfication'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'test'.'classfication' (
  'ClassficationID' INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  'UserID' INT(11) UNSIGNED NOT NULL,
  'Address' VARCHAR(45) NOT NULL,
  'Name' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('ClassficationID'),
  INDEX 'classfication_idx' ('UserID' ASC),
  CONSTRAINT 'fk_classfication_user1'
    FOREIGN KEY ('UserID')
    REFERENCES 'test'.'user' ('UserID')
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table 'test'.'profile'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'test'.'profile' (
  'ProfileID' INT(10) UNSIGNED NOT NULL,
  'UserID' INT(11) UNSIGNED NOT NULL,
  'Name' VARCHAR(45) NOT NULL,
  'Age' INT(10) UNSIGNED NOT NULL,
  'Address' VARCHAR(45) NOT NULL,
  'JoinDay' DATE NOT NULL,
  PRIMARY KEY ('ProfileID'),
  INDEX 'fk_profile_idx' ('UserID' ASC) ,
  CONSTRAINT 'fk_profile_user1'
    FOREIGN KEY ('UserID')
    REFERENCES 'test'.'user' ('UserID')
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table 'test'.'review'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'test'.'review' (
  'ReviewID' INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  'ClassficationID' INT(10) UNSIGNED NOT NULL,
  'Score' INT(10) UNSIGNED NOT NULL,
  'Post' VARCHAR(150) NOT NULL,
  PRIMARY KEY ('ReviewID'),
  INDEX 'fk_review_idx' ('ClassficationID' ASC) ,
  CONSTRAINT 'fk_review_classfication1'
    FOREIGN KEY ('ClassficationID')
    REFERENCES 'test'.'classfication' ('ClassficationID')
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table 'test'.'tag'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'test'.'tag' (
  'TagID' INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  'ClassficationID' INT(10) UNSIGNED NOT NULL,
  'Visitor' INT(10) UNSIGNED NOT NULL,
  'Purpose' VARCHAR(45) NOT NULL,
  'Type' VARCHAR(45) NOT NULL,
  'Environment' VARCHAR(100) NOT NULL,
  PRIMARY KEY ('TagID'),
  INDEX 'fk_tag_idx' ('ClassficationID' ASC) ,
  CONSTRAINT 'fk_tag_classfication1'
    FOREIGN KEY ('ClassficationID')
    REFERENCES 'test'.'classfication' ('ClassficationID')
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
