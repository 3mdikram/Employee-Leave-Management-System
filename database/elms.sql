/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.23 : Database - elms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`elms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `elms`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`UserName`,`Password`,`updationDate`) values 
(1,'admin','21232f297a57a5a743894a0e4a801fc3','2021-04-12 02:54:12');

/*Table structure for table `tbldepartments` */

DROP TABLE IF EXISTS `tbldepartments`;

CREATE TABLE `tbldepartments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbldepartments` */

insert  into `tbldepartments`(`id`,`DepartmentName`,`DepartmentShortName`,`DepartmentCode`,`CreationDate`) values 
(1,'Human Resource','HR','HR001','2017-11-01 12:46:25'),
(2,'Information Technology','IT','IT001','2017-11-01 12:49:37'),
(3,'Operations','OP','OP1','2017-12-03 02:58:56');

/*Table structure for table `tblemployees` */

DROP TABLE IF EXISTS `tblemployees`;

CREATE TABLE `tblemployees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tblemployees` */

insert  into `tblemployees`(`id`,`EmpId`,`FirstName`,`LastName`,`EmailId`,`Password`,`Gender`,`Dob`,`Department`,`Address`,`City`,`Country`,`Phonenumber`,`Status`,`RegDate`) values 
(1,'EMP10806121','Johnny','doe','johnny@gmail.com','f925916e2754e5e03f75dd58a5733251','Male','3 February, 1990','Human Resource','N NEPO','NEPO','IRE','9857555555',1,'2017-11-10 16:59:59'),
(2,'DEMP2132','James','doe','james@gmail.com','f925916e2754e5e03f75dd58a5733251','Male','3 February, 1990','Information Technology','N NEPO','NEPO','IRE','8587944255',1,'2017-11-10 19:10:02');

/*Table structure for table `tblleaves` */

DROP TABLE IF EXISTS `tblleaves`;

CREATE TABLE `tblleaves` (
  `id` int NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int NOT NULL,
  `IsRead` int NOT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserEmail` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tblleaves` */

insert  into `tblleaves`(`id`,`LeaveType`,`ToDate`,`FromDate`,`Description`,`PostingDate`,`AdminRemark`,`AdminRemarkDate`,`Status`,`IsRead`,`empid`) values 
(7,'Casual Leave','30/11/2017','29/10/2017','test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description','2017-11-19 18:41:21','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.\r\n','2017-12-02 23:26:27 ',2,1,1),
(8,'Medical Leave test','21/10/2017','25/10/2017','test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description','2017-11-20 16:44:14','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2017-12-02 23:24:39 ',1,1,1),
(9,'Medical Leave test','08/12/2017','12/12/2017','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.\r\n','2017-12-02 23:56:01',NULL,NULL,0,1,2),
(10,'Restricted Holiday(RH)','25/12/2017','25/12/2017','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.','2017-12-03 13:59:07','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.','2017-12-03 14:06:12 ',1,1,1);

/*Table structure for table `tblleavetype` */

DROP TABLE IF EXISTS `tblleavetype`;

CREATE TABLE `tblleavetype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tblleavetype` */

insert  into `tblleavetype`(`id`,`LeaveType`,`Description`,`CreationDate`) values 
(1,'Casual Leave','Casual Leave ','2017-11-01 17:37:56'),
(2,'Medical Leave test','Medical Leave  test','2017-11-06 18:46:09'),
(3,'Restricted Holiday(RH)','Restricted Holiday(RH)','2017-11-06 18:46:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
