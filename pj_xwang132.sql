SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


CREATE TABLE IF NOT EXISTS `Student` (
  `bannerNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `fName` VARCHAR(45) NOT NULL,
  `lName` VARCHAR(45) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(45) NOT NULL,
  `mobileNo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `gender` enum ('Male', 'Femaile', 'Other') NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `nationality` VARCHAR(45) NOT NULL,
  `specialNeeds` VARCHAR(200) NOT NULL,
  `comments` VARCHAR(200) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `major` VARCHAR(45) NOT NULL,
  `minor` VARCHAR(45) NOT NULL,
  `courseNo` VARCHAR(45) NOT NULL,
  CONSTRAINT Student_Course_courseNo_fk
  FOREIGN KEY (courseNo) REFERENCES Course (courseNo));

CREATE TABLE IF NOT EXISTS `Course` (
  `courseNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `courseTitle` VARCHAR(45) NOT NULL,
  `instructorName` VARCHAR(45) NOT NULL,
  `instructorMobileNo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `roomNo` VARCHAR(45) NOT NULL,
  `deptName` VARCHAR(45) NOT NULL;)
  
CREATE TABLE IF NOT EXISTS `Lease` (
  `leaseNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `duration` VARCHAR(45) NOT NULL,
  `bannerNo` VARCHAR(45) NOT NULL,
  `placeNo` VARCHAR(45) NOT NULL,
  `dateEntry` DATE NOT NULL,
  `dateExit` DATE NOT NULL,
  CONSTRAINT Lease_HallofResidence_fk
  FOREIGN KEY (placeNo) REFERENCES HallofResidence (placeNo)
  CONSTRAINT Lease_Student_bannerNo_fk
  FOREIGN KEY (bannerNo) REFERENCES Student (bannerNo));
 
CREATE TABLE IF NOT EXISTS `Invoice` (
  `invoiceNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `leaseNo` VARCHAR(45) NOT NULL,
  `paymentDue` DATE NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `bannerNo` VARCHAR(45) NOT NULL,
  `datePaid` DATE NOT NULL,
  `paymentMethod` enum('check', 'cash', 'Visa', 'other') NOT NULL,
  `dateReminder1` DATE NOT NULL,
  `dateReminder2` DATE NOT NULL,
  CONSTRAINT Invoice_Student_bannerNo_fk
  FOREIGN KEY  (bannerNo) REFERENCES Student (bannerNo)
  CONSTRAINT Invoice_HallofResidence_fk
  FOREIGN KEY (placeNo) REFERENCES HallofResidence (placeNo)
  CONSTRAINT Invoice_Lease_leaseNo_fk
  FOREIGN KEY  (leaseNo) REFERENCES Lease (leaseNo));

CREATE TABLE IF NOT EXISTS `HallofResidence` (
  `placeNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `phoneNo` VARCHAR(45) NOT NULL,
  `managerNo` VARCHAR(45) NOT NULL,
  CONSTRAINT HallofResidence_Staff_fk
  FOREIGN KEY (managerNo) REFERENCES Staff (staffNo));
  
CREATE TABLE IF NOT EXISTS `Flat` (
  `flatNo` VARCHAR(45) NOT NULL PRIMARY KEY);
  
CREATE TABLE IF NOT EXISTS `Room` (
  `placeNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `roomNo` VARCHAR(45) NOT NULL,
  `bannerNo` VARCHAR(45) NOT NULL,
  `monthlyRentRate` INT,
  CONSTRAINT Room_Student_bannerNo_fk
  FOREIGN KEY (bannerNo) REFERENCES Student (bannerNo)
  CONSTRAINT Room_HallofResidence_fk
  FOREIGN KEY (placeNo) REFERENCES HallofResidence (placeNo));
  
CREATE TABLE IF NOT EXISTS `Staff` (
  `staffNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `fName` VARCHAR(45) NOT NULL,
  `lName` VARCHAR(45) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(45) NOT NULL,
  `mobileNo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `gender` enum ('Male', 'Femaile', 'Other') NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `deptName` VARCHAR(45) NOT NULL,
  `roomNo` VARCHAR(45) NOT NULL,
  CONSTRAINT Staff_HallofResidence_fk
  FOREIGN KEY (location) REFERENCES HallofResidence (placeNo));
  
CREATE TABLE IF NOT EXISTS `Inspection` (
  `staffNo` VARCHAR(45) NOT NULL,
  `inspectDate` DATE NOT NULL,
  `results` enum('Yes', 'No'),
  `comments` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`staffNo`, `inspectDate`, `results`, `comments`)
  CONSTRAINT Inspection_Staff_fk
  FOREIGN KEY (staffNo) REFERENCES Staff (staffNo));
  
CREATE TABLE IF NOT EXISTS `NoK` (
  `bannerNo` VARCHAR(45) NOT NULL PRIMARY KEY,
  `name` VARCHAR(45) NOT NULL,
  `relationship` VARCHAR(45) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(45) NOT NULL,
  `phoneNo` VARCHAR(45) NOT NULL,
  CONSTRAINT NoK_Student_bannerNo_fk
  FOREIGN KEY (bannerNo) REFERENCES Student (bannerNo));
  
    
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
