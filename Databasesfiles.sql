-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: Parliament_Elections
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `ID` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('ayush','ayush12345');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ayush`
--

DROP TABLE IF EXISTS `Ayush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ayush` (
  `Name` varchar(40) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ayush`
--

LOCK TABLES `Ayush` WRITE;
/*!40000 ALTER TABLE `Ayush` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ayush` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Candidate`
--

DROP TABLE IF EXISTS `Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidate` (
  `Candidate_ID` int(10) unsigned NOT NULL,
  `Voter_ID` int(10) unsigned NOT NULL,
  `Election_ID` int(10) unsigned NOT NULL,
  `status` enum('Verified','NotVerified','Rejected') DEFAULT 'NotVerified',
  `resume` varchar(50) DEFAULT 'No Resume Uploaded',
  `CPI` decimal(4,2) unsigned DEFAULT NULL,
  `sports` text,
  `technical` text,
  `cultural` text,
  `pre_position_of_responsibility` tinytext,
  `no_of_votes_received` int(11) DEFAULT '0',
  PRIMARY KEY (`Candidate_ID`),
  KEY `fk_candidate_voter` (`Voter_ID`),
  KEY `fk_candidate_election` (`Election_ID`),
  CONSTRAINT `fk_candidate_election` FOREIGN KEY (`Election_ID`) REFERENCES `Election` (`Election_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_candidate_voter` FOREIGN KEY (`Voter_ID`) REFERENCES `Voter` (`Voter_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate`
--

LOCK TABLES `Candidate` WRITE;
/*!40000 ALTER TABLE `Candidate` DISABLE KEYS */;
INSERT INTO `Candidate` VALUES (201610001,201610001,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,3),(201610002,201610002,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,3),(201610003,201610003,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,3),(201610004,201610004,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610005,201610005,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,3),(201610006,201610006,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610007,201610007,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610008,201610008,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610009,201610009,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610010,201610010,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,4),(201610011,201610011,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610012,201610012,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,4),(201610013,201610013,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610014,201610014,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610015,201610015,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610016,201610016,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610017,201610017,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610018,201610018,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610019,201610019,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610020,201610020,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,2),(201610021,201610021,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610022,201610022,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610023,201610023,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610024,201610024,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610025,201610025,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610026,201610026,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610027,201610027,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,1),(201610028,201610028,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610029,201610029,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610030,201610030,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610031,201610031,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610032,201610032,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610033,201610033,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610034,201610034,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610035,201610035,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0),(201610036,201610036,20161,'Verified','No Resume Uploaded',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Candidates_won`
--

DROP TABLE IF EXISTS `Candidates_won`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidates_won` (
  `Result_ID` int(10) unsigned NOT NULL,
  `Candidate_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Result_ID`,`Candidate_ID`),
  KEY `fk_cw_candidate` (`Candidate_ID`),
  CONSTRAINT `fk_cw_candidate` FOREIGN KEY (`Candidate_ID`) REFERENCES `Candidate` (`Candidate_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cw_result` FOREIGN KEY (`Result_ID`) REFERENCES `Result` (`Result_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidates_won`
--

LOCK TABLES `Candidates_won` WRITE;
/*!40000 ALTER TABLE `Candidates_won` DISABLE KEYS */;
INSERT INTO `Candidates_won` VALUES (20161,201610010),(20161,201610012),(20161,201610014),(20161,201610015),(20161,201610019),(20161,201610020),(20161,201610021),(20161,201610022),(20161,201610023),(20161,201610024),(20161,201610025),(20161,201610026),(20161,201610027),(20161,201610028),(20161,201610032),(20161,201610033),(20161,201610034),(20161,201610035),(20161,201610036);
/*!40000 ALTER TABLE `Candidates_won` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact` (
  `Roll_No` int(10) unsigned NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  PRIMARY KEY (`Roll_No`,`contact_no`),
  CONSTRAINT `fk_contact` FOREIGN KEY (`Roll_No`) REFERENCES `Student` (`Roll_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Election`
--

DROP TABLE IF EXISTS `Election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Election` (
  `Election_ID` int(10) unsigned NOT NULL,
  `year` year(4) DEFAULT NULL,
  `prof_incharge` varchar(60) NOT NULL DEFAULT 'NoProfAssigned',
  `election_start` tinyint(1) DEFAULT NULL,
  `voting` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Election_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Election`
--

LOCK TABLES `Election` WRITE;
/*!40000 ALTER TABLE `Election` DISABLE KEYS */;
INSERT INTO `Election` VALUES (20161,2016,'Prof A',1,1);
/*!40000 ALTER TABLE `Election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Result`
--

DROP TABLE IF EXISTS `Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Result` (
  `Result_ID` int(10) unsigned NOT NULL,
  `Election_ID` int(10) unsigned NOT NULL,
  `no_of_candi_stood` int(10) unsigned DEFAULT '0',
  `no_of_candi_won` int(10) unsigned DEFAULT '0',
  `girl_candi_stood` int(10) unsigned DEFAULT '0',
  `girl_candi_won` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Result_ID`),
  KEY `fk_result_election` (`Election_ID`),
  CONSTRAINT `fk_result_election` FOREIGN KEY (`Election_ID`) REFERENCES `Election` (`Election_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Result`
--

LOCK TABLES `Result` WRITE;
/*!40000 ALTER TABLE `Result` DISABLE KEYS */;
INSERT INTO `Result` VALUES (20161,20161,36,19,16,5);
/*!40000 ALTER TABLE `Result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Roll_No` int(8) unsigned zerofill NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT '',
  `last_name` varchar(20) DEFAULT '',
  `gender` enum('Male','Female') DEFAULT NULL,
  `course` enum('B.Tech.','M.Tech.','IDD','IMD','Ph.D.','B.Pharm.','M.Pharm.') DEFAULT NULL,
  `branch` enum('Biochemical Engineering','Biomedical Engineering','Ceramic Engineering','Chemical Engineering','Civil Engineering','Computer Science And Engineering','Electrical Engineering','Electronics Engineering','Engineering Physics','Industrial Chemistry','Industrial Management','Mathematics And Computing','Mechanical Engineering','Metallurgical Engineering','Mining Engineering','Pharmaceutics','Materials Science And Technology','Systems Engineering') DEFAULT NULL,
  `year_of_admission` year(4) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Roll_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (11075001,'Ayush','Singh','Pal','Female','IDD','Mining Engineering',2011,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(11075002,'Ayushi','Singh','Sharma','Female','IDD','Mining Engineering',2011,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(11075003,'Akshay','Singh','Bam','Female','IDD','Mining Engineering',2011,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(11075004,'Akash','Singh','Paul','Female','IDD','Mining Engineering',2011,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(11075005,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2011,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075001,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075002,'Arjun','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075003,'Diksha','Singh','Kapoor','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075004,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075005,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075006,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075007,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(12075008,'Diksha','Singh','Pal','Female','IDD','Mining Engineering',2012,'1994-04-04','Room No. 10B,GSMC Extension Hostel, IIT BHU, Varanasi','diksha.pal.min12@iitbhu.ac.in'),(13075001,'Arjun','','Kapoor','Male','IDD','Civil Engineering',2013,'1994-10-11','Room No. 68, Limbdi Hostel, IIT BHU, Varanasi','arjun.kapoor.civ12@iitbhu.ac.in'),(13075002,'Shivam','Kumar','Jadon','Male','IDD','Chemical Engineering',2013,'1993-04-23','Room No. 29, Limbdi Hostel, IIT BHU, Varanasi','shivam.jadon.che12@iitbhu.ac.in'),(13075003,'Shivam','Kumar','Jadon','Male','IDD','Chemical Engineering',2013,'1993-04-23','Room No. 29, Limbdi Hostel, IIT BHU, Varanasi','shivam.jadon.che12@iitbhu.ac.in'),(13075004,'Manish','Kumar','Singh','Male','IDD','Metallurgical Engineering',2013,'1993-07-16','Room No. 6, Limbdi Hostel, IIT BHU, Varanasi','manish.singh.met12@iitbhu.ac.in'),(13075005,'Manish','Kumar','Singh','Male','IDD','Metallurgical Engineering',2013,'1993-07-16','Room No. 6, Limbdi Hostel, IIT BHU, Varanasi','manish.singh.met12@iitbhu.ac.in'),(13075006,'Akarsh','Kumar','Mirsha','Male','IMD','Mechanical Engineering',2013,'1995-05-23','Room No. 100, Aryabhatta Hostel, IIT BHU, Varanasi','akarsh.mishra.mec13@iitbhu.ac.in'),(13075007,'Shubham','','Singh','Male','IDD','Metallurgical Engineering',2013,'1995-04-29','Room No. 45, Dhanraj Giri Hostel, IIT BHU, Varanasi','shubham.singh.met13@iitbhu.ac.in'),(13075008,'Akarsh','Kumar','Mirsha','Male','IMD','Mechanical Engineering',2013,'1995-05-23','Room No. 100, Aryabhatta Hostel, IIT BHU, Varanasi','akarsh.mishra.mec13@iitbhu.ac.in'),(14075001,'Akishta','','Agarwal','Female','IDD','Computer Science And Engineering',2014,'1995-11-18','Room No. 51A, GSMC Extension Hostel, IIT BHU, Varanasi','akshita.agarwal.cse13@iitbhu.ac.in'),(14075002,'Shubham','','Singh','Male','IDD','Metallurgical Engineering',2014,'1995-04-29','Room No. 45, Dhanraj Giri Hostel, IIT BHU, Varanasi','shubham.singh.met13@iitbhu.ac.in'),(14075003,'Ayush','','Kedia','Male','B.Tech.','Ceramic Engineering',2014,'1994-03-19','Room No. 207, Vishveshwaraiya Hostel, IIT BHU, Varanasi','ayush.kedia.cer13@iitbhu.ac.in'),(14075004,'Shubham','','Singh','Male','IDD','Metallurgical Engineering',2014,'1995-04-29','Room No. 45, Dhanraj Giri Hostel, IIT BHU, Varanasi','shubham.singh.met13@iitbhu.ac.in'),(14075005,'Devang','Singh','Kulshretha','Male','IMD','Biochemical Engineering',2014,'1996-12-28','Room No. 10, Vishwakarma Hostel, IIT BHU, Varanasi','devang.kulshretha.bce14@iitbhu.ac.in'),(15075001,'Abhiram','','Ravindran','Male','IMD','Mathematics And Computing',2015,'1996-04-21','Room No. 29, Morvi Hostel, IIT BHU, Varanasi','abhiram.ravindran.mat14@iitbhu.ac.in'),(15075002,'Devang','Singh','Kulshretha','Male','IMD','Biochemical Engineering',2015,'1996-12-28','Room No. 10, Vishwakarma Hostel, IIT BHU, Varanasi','devang.kulshretha.bce14@iitbhu.ac.in'),(15075003,'Devang','Singh','Kulshretha','Male','IMD','Biochemical Engineering',2015,'1996-12-28','Room No. 10, Vishwakarma Hostel, IIT BHU, Varanasi','devang.kulshretha.bce14@iitbhu.ac.in'),(16075001,'Babloo','','Kumar','Male','IDD','Computer Science And Engineering',2016,'1996-06-11','Room No. 8, Ramanujan Hostel, IIT BHU, Varanasi','babloo.kumar.cse14@iitbhu.ac.in'),(16075002,'Arpit','Kumar','Chaudhary','Male','B.Tech.','Electrical Engineering',2016,'1996-01-30','Room No. 126, C.V. Hostel, IIT BHU, Varanasi','arpit.chaudhary.eee14@iitbhu.ac.in'),(16075003,'Babloo','','Kumar','Male','IDD','Computer Science And Engineering',2016,'1996-06-11','Room No. 8, Ramanujan Hostel, IIT BHU, Varanasi','babloo.kumar.cse14@iitbhu.ac.in'),(16075004,'Deveshi','','Deveshi','Female','B.Pharm.','Pharmaceutics',2016,'1997-02-19','Room No. 121,Room No. 20, GSMC Hostel, IIT BHU, Varanasi','deveshi.deveshi.phr15@iitbhu.ac.in'),(16075005,'Deepak','Kumar','Manjhi','Male','B.Tech.','Engineering Physics',2016,'1997-12-31','Room No. 19, S.N. Bose Hostel, IIT BHU, Varanasi','deepak.manjhi.phy15@iitbhu.ac.in'),(16075006,'Bharat','Singh','Kumar','Male','IDD','Materials Science And Technology',2016,'1997-08-20','Room No. 14, S.N. Bose Hostel, IIT BHU, Varanasi','bharat.kumar.mst15@iitbhu.ac.in'),(16075007,'Shivani','','Shrivastava','Female','IDD','Mining Engineering',2016,'1998-10-19','Room No. 92, GSMC Hostel, IIT BHU, Varanasi','shivani.shrivastava.min16@iitbhu.ac.in'),(16075008,'Vivek','','Agarwal','Male','B.Tech.','Computer Science And Engineering',2016,'1998-02-12','Room No. 98, Vishveshwaraiya Hostel, IIT BHU, Varanasi','vivek.agarwal.cse16@iitbhu.ac.in');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vote`
--

DROP TABLE IF EXISTS `Vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vote` (
  `Vote_ID` bigint(20) unsigned NOT NULL,
  `Voter_ID` int(10) unsigned NOT NULL,
  `Election_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Vote_ID`),
  KEY `fk_vote_voter` (`Voter_ID`),
  KEY `fk_vote_election` (`Election_ID`),
  CONSTRAINT `fk_vote_election` FOREIGN KEY (`Election_ID`) REFERENCES `Election` (`Election_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vote_voter` FOREIGN KEY (`Voter_ID`) REFERENCES `Voter` (`Voter_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vote`
--

LOCK TABLES `Vote` WRITE;
/*!40000 ALTER TABLE `Vote` DISABLE KEYS */;
INSERT INTO `Vote` VALUES (20161000001,201610009,20161),(20161000002,201610010,20161),(20161000003,201610011,20161),(20161000004,201610012,20161),(20161000005,201610001,20161),(20161000006,201610002,20161),(20161000007,201610003,20161),(20161000008,201610015,20161),(20161000009,201610018,20161),(20161000010,201610024,20161),(20161000011,201610028,20161);
/*!40000 ALTER TABLE `Vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Voted_Candidate_Id`
--

DROP TABLE IF EXISTS `Voted_Candidate_Id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Voted_Candidate_Id` (
  `Vote_ID` bigint(20) unsigned NOT NULL,
  `Candidate_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Vote_ID`,`Candidate_ID`),
  KEY `fk_voted_candidate` (`Candidate_ID`),
  CONSTRAINT `fk_voted_candidate` FOREIGN KEY (`Candidate_ID`) REFERENCES `Candidate` (`Candidate_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voted_vote` FOREIGN KEY (`Vote_ID`) REFERENCES `Vote` (`Vote_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Voted_Candidate_Id`
--

LOCK TABLES `Voted_Candidate_Id` WRITE;
/*!40000 ALTER TABLE `Voted_Candidate_Id` DISABLE KEYS */;
INSERT INTO `Voted_Candidate_Id` VALUES (20161000005,201610001),(20161000006,201610001),(20161000007,201610001),(20161000005,201610002),(20161000006,201610002),(20161000007,201610002),(20161000005,201610003),(20161000006,201610003),(20161000007,201610003),(20161000006,201610004),(20161000007,201610004),(20161000005,201610005),(20161000006,201610005),(20161000007,201610005),(20161000005,201610006),(20161000007,201610006),(20161000006,201610007),(20161000001,201610009),(20161000002,201610009),(20161000001,201610010),(20161000002,201610010),(20161000003,201610010),(20161000004,201610010),(20161000001,201610011),(20161000002,201610011),(20161000001,201610012),(20161000002,201610012),(20161000003,201610012),(20161000004,201610012),(20161000001,201610013),(20161000003,201610013),(20161000008,201610014),(20161000009,201610014),(20161000008,201610015),(20161000009,201610015),(20161000008,201610016),(20161000009,201610017),(20161000008,201610018),(20161000009,201610019),(20161000008,201610020),(20161000009,201610020),(20161000010,201610021),(20161000010,201610022),(20161000010,201610024),(20161000010,201610025),(20161000011,201610026),(20161000011,201610027);
/*!40000 ALTER TABLE `Voted_Candidate_Id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Voter`
--

DROP TABLE IF EXISTS `Voter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Voter` (
  `Voter_ID` int(10) unsigned NOT NULL,
  `Roll_No` int(10) unsigned NOT NULL,
  `Election_ID` int(10) unsigned NOT NULL,
  `voted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Voter_ID`),
  KEY `fk_voter_roll` (`Roll_No`),
  KEY `fk_voter_election` (`Election_ID`),
  CONSTRAINT `fk_voter_election` FOREIGN KEY (`Election_ID`) REFERENCES `Election` (`Election_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voter_roll` FOREIGN KEY (`Roll_No`) REFERENCES `Student` (`Roll_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Voter`
--

LOCK TABLES `Voter` WRITE;
/*!40000 ALTER TABLE `Voter` DISABLE KEYS */;
INSERT INTO `Voter` VALUES (201610001,12075001,20161,1),(201610002,12075002,20161,1),(201610003,12075003,20161,1),(201610004,12075004,20161,0),(201610005,12075005,20161,0),(201610006,12075006,20161,0),(201610007,12075007,20161,0),(201610008,12075008,20161,0),(201610009,11075001,20161,1),(201610010,11075002,20161,1),(201610011,11075003,20161,1),(201610012,11075004,20161,1),(201610013,11075005,20161,0),(201610014,13075001,20161,0),(201610015,13075003,20161,1),(201610016,13075004,20161,0),(201610017,13075005,20161,0),(201610018,13075006,20161,1),(201610019,13075007,20161,0),(201610020,13075008,20161,0),(201610021,14075001,20161,0),(201610022,14075002,20161,0),(201610023,14075003,20161,0),(201610024,14075004,20161,1),(201610025,14075005,20161,0),(201610026,15075001,20161,0),(201610027,15075002,20161,0),(201610028,15075003,20161,1),(201610029,16075001,20161,0),(201610030,16075002,20161,0),(201610031,16075003,20161,0),(201610032,16075004,20161,0),(201610033,16075005,20161,0),(201610034,16075006,20161,0),(201610035,16075007,20161,0),(201610036,16075008,20161,0);
/*!40000 ALTER TABLE `Voter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$30000$aSZ7q43vsxBR$S3jTXLFxHQ0yyJdqKzQ3BQnu/7TZExVMX/KiRrDisMY=','2016-10-22 10:50:43.550952',1,'ayush','Ayush','Shrivastava','shrivastava.ayush1996@gmail.com',1,1,'2016-10-18 15:33:16.000000'),(42,'pbkdf2_sha256$30000$4c6dq6zQQcBH$gj/RYnWZ4LjiG75+bWKHkk5FmYzWJz/+FNjcgdqz8bA=','2016-10-22 08:41:47.871160',0,'12023001','Diksha','Pal','diksha.pal.min12@iitbhu.ac.in',0,1,'2016-10-21 14:48:43.289928'),(43,'pbkdf2_sha256$30000$HjupLs7lQIBc$pEdy2TM9p1lVBnxR7F7S7MD2GC4bXQI9QTL6mlhegdU=','2016-10-21 15:49:22.694844',0,'12028021','Arjun','Kapoor','arjun.kapoor.civ12@iitbhu.ac.in',0,1,'2016-10-21 14:48:43.517783'),(44,'pbkdf2_sha256$30000$cXNlHCCNxZAF$4KiiaabKpdiE0j8rJhuXOCi+MdfxN3V2L6AwgJVRr7s=','2016-10-21 15:49:40.792810',0,'12074013','Shivam','Jadon','shivam.jadon.che12@iitbhu.ac.in',0,1,'2016-10-21 14:48:43.682780'),(45,'pbkdf2_sha256$30000$Ubd0Fp5WwmuD$xDgVtPxq5TjpPme3rkK2NDeaVHMHgrqKQYgctbwfJgY=','2016-10-21 15:49:50.975447',0,'12088026','Manish','Singh','manish.singh.met12@iitbhu.ac.in',0,1,'2016-10-21 14:48:43.807664'),(46,'pbkdf2_sha256$30000$L2ueDJznw4Zn$Lfqn34CJUdY+sIjC0rLXfrkgVwl0EBWoxDGRc5syjpw=','2016-10-21 15:51:00.911968',0,'13026031','Akarsh','Mirsha','akarsh.mishra.mec14@iitbhu.ac.in',0,1,'2016-10-21 14:48:43.927638'),(47,'pbkdf2_sha256$30000$YtXUW40y2ajC$l9OYa12v/ruUgujGW5Nv0TlZz8r0aeBxILN77Is3+w8=','2016-10-21 15:51:13.563762',0,'13072038','Shubham','Singh','shubham.singh.met13@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.039621'),(48,'pbkdf2_sha256$30000$Vzigwsn96vol$QF17oEwOGgGXYegzbfxt15ty9iNbw5h/1QC/bqFLvYY=','2016-10-21 15:51:37.007430',0,'13074028','Akishta','Agarwal','akshita.agarwal.cse13@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.152580'),(49,'pbkdf2_sha256$30000$UHt0eFA6ROny$6E4lupdVpoCjyYqvmqZDqo5iUKHSOlOY3oCVHTDiD4o=','2016-10-21 15:51:48.112708',0,'13082110','Ayush','Kedia','ayush.kedia.cer13@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.272694'),(50,'pbkdf2_sha256$30000$h7rgBQJTMzzM$fwWgPPZZN2Zal9fWy2cQgn+E0y5RFKhHg5bcL4oyiU0=','2016-10-21 16:09:40.338313',0,'14024091','Devang','Kulshretha','devang.kulshretha.bce14@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.385832'),(51,'pbkdf2_sha256$30000$C3yI1oZp40YO$wPWmm8WlnTYFt2GLlx7QpabHvIL8h18Eprku2Zl7cKw=','2016-10-22 08:40:43.972471',0,'14025029','Abhiram','Ravindran','abhiram.ravindran.mat14@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.508079'),(52,'pbkdf2_sha256$30000$PBFHwAbUDS50$tYDtnkuVo+Wp249A8S+m7Y0BrbbgWPkY0GRwcI25njo=','2016-10-21 15:52:29.391128',0,'14068035','Arpit','Chaudhary','arpit.chaudhary.eee14@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.617978'),(53,'pbkdf2_sha256$30000$UYOy8IHIc3St$XjMgc0lKySyI5b8tmgWOv5gZPGwPzgBykVqWxhgV9Pg=','2016-10-21 15:52:40.665478',0,'14074005','Babloo','Kumar','babloo.kumar.cse14@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.744319'),(54,'pbkdf2_sha256$30000$4moxU1bPIDJp$INCb3o7Vw/4Li9L6XOZa5u1XmSlCmM6CIZnz90VH3Aw=','2016-10-22 09:04:12.181564',0,'14075014','Ayush','Shrivastava','ayush.shrivastava.cse14@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.876548'),(55,'pbkdf2_sha256$30000$AL1mpL1EiQ63$p1jirdT9+ojQet5GCCcTtGGy+rMV4b+7MUqJ+8O8y+E=','2016-10-21 17:09:03.169533',0,'15023092','Deepak','Manjhi','deepak.manjhi.phy15@iitbhu.ac.in',0,1,'2016-10-21 14:48:44.997270'),(56,'pbkdf2_sha256$30000$Pm2bl8N1Zl3Z$uqxF59vyZvq3q61PSosE/ezRIcRt5HsCuWL5y1A0xT8=','2016-10-21 15:53:17.285194',0,'15024001','Deveshi','Deveshi','deveshi.deveshi.phr15@iitbhu.ac.in',0,1,'2016-10-21 14:48:45.132077'),(57,'pbkdf2_sha256$30000$3YZZeMbCC9wM$U9+jn9jPKh1QGUxRqnra/A998KUQJY+njd7cSxSjMxM=','2016-10-21 15:53:30.397415',0,'15075021','Bharat','Kumar','bharat.kumar.mst15@iitbhu.ac.in',0,1,'2016-10-21 14:48:45.264522'),(58,'pbkdf2_sha256$30000$idTCITnlvjkW$LsoPCTgnlvhmdh1V0esfNA3IdPpTFdm/liuQTC4cIRw=','2016-10-21 15:53:38.969347',0,'16023083','Shivani','Shrivastava','shivani.shrivastava.min16@iitbhu.ac.in',0,1,'2016-10-21 14:48:45.400208'),(59,'pbkdf2_sha256$30000$SXIJ80zIwGnY$kcaTZ9HZA0dLRi1Cq3rWvXU89Izhh6YF51N8I5XknuA=','2016-10-21 15:53:48.476272',0,'16045013','Vivek','Agarwal','vivek.agarwal.cse16@iitbhu.ac.in',0,1,'2016-10-21 14:48:45.532675'),(60,'pbkdf2_sha256$30000$bY4KNINph80M$2Mj0CHD8hp5xip8Dr6hOYDo9cWpoGAgcBYYUQQxxNBA=','2016-10-21 15:53:57.240209',0,'16075014','Prakhar','Doongarwal','prakhar.doongarwal.ich16@iitbhu.ac.in',0,1,'2016-10-21 14:48:45.666614'),(61,'pbkdf2_sha256$30000$p73plfIs9rAt$n7uv5S+v7xA6Mmjw36dy1Zutq1hQ3QYCpMeC37SY1yw=',NULL,0,'98765432','Ayush','Shrivastava','ayush.shrivastava.cse14@iitbhu.ac.in',0,1,'2016-10-22 08:27:23.395899'),(63,'pbkdf2_sha256$30000$eTuQfF2iVOK6$kCGthlNrYwQthq83ncawvGpRfNiBkOboF/6uXpNEGZI=',NULL,0,'45678912','dasdas','dsds','ayush.shrivastava.cse14@iitbhu.ac.in',0,1,'2016-10-22 08:35:15.650367'),(64,'pbkdf2_sha256$30000$CyCtCmdsiDto$f0CPH13XrbhdlCLHGz/8VAg+nWs34mHw7hvV+62Vmm4=',NULL,0,'45678911','dasdas','dsds','ayush.shrivastava.cse14@iitbhu.ac.in',0,1,'2016-10-22 08:37:18.127870'),(65,'pbkdf2_sha256$30000$MI0K0EQjT7Bs$H1g9s8QVLBiuLHwajeRitnMfuqkEcGKkDi++ztY9lU4=','2016-10-22 10:36:20.175903',0,'11075001','Ayush','Pal','diksha.pal.min11@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.013241'),(66,'pbkdf2_sha256$30000$AMcfYJdIhUsa$q96Y2n+AEX9Uc9dcxOn0Z42QnBnrVM6gUXTRiXfC13U=','2016-10-22 10:38:06.140063',0,'11075002','Ayushi','Sharma','ayushi.sharma.min11@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.202365'),(67,'pbkdf2_sha256$30000$FjURKtW79FTx$0TkozWYit3NhoQ4lwDQ0y4kdPWEefHcOA4cfkiWYTx8=','2016-10-22 10:38:40.651579',0,'11075003','Akshay','Bam','akshay.bam.min11@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.325167'),(68,'pbkdf2_sha256$30000$GXpbHjhCwwEK$YV51Uib/x9qV08IWkR3F1/Oam4ewhQJQ9OioDSwrEA4=','2016-10-22 10:38:52.603097',0,'11075004','Akash','Paul','akash.paul.min11@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.466557'),(69,'pbkdf2_sha256$30000$BOQVB8zy1i1M$odm7QyOqttt2UbM6/qlJlX30tp9p8KDgw6jeODRyJVE=','2016-10-22 10:39:05.646116',0,'11075005','Diksha','Pal','diksha.pal.min11@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.639247'),(70,'pbkdf2_sha256$30000$NMEn350H7mXO$FQMn+dtPpRuLu5j7s7Yu527mserE02yHz2uqvihkDzQ=','2016-10-22 10:39:15.928080',0,'12075001','Diksha','Pal','diksha.pal.min12@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.769994'),(71,'pbkdf2_sha256$30000$dgTh5Jg9t7jd$JHHymafPFTPOnICIq+mR6Mv/rwLRdAJs1DhUVlaRxEI=','2016-10-22 10:39:30.951466',0,'12075002','Arjun','Kapoor','arjun.kapoor.civ12@iitbhu.ac.in',0,1,'2016-10-22 10:23:47.904082'),(72,'pbkdf2_sha256$30000$UZbHeJv86zIp$EwqWdWRpetddsyOOZ5MaSILfMPxdcwVHzasziri8YGE=','2016-10-22 10:41:59.445903',0,'12075003','Shivam','Jadon','shivam.jadon.che12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.037555'),(73,'pbkdf2_sha256$30000$ZB4MhnRpiA1c$R6R6YK48rLNPNU3nMW2x1uCtBL7q/e3ct1vrTsk7Irk=','2016-10-22 10:26:32.079606',0,'12075004','Manish','Singh','manish.singh.met12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.171744'),(74,'pbkdf2_sha256$30000$bSXHujK8qHpZ$ga1QDjU2C4J5tsYs/tnbsloleHKrFDhhNuNdZCrRWRw=','2016-10-22 10:26:42.121665',0,'12075005','Akarsh','Mirsha','akarsh.mishra.mec12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.316806'),(75,'pbkdf2_sha256$30000$HfxpKeWCT9a1$/lCNqkfJT0Hy13qMqknaUE1dIXuwNndGqxhGtJc1vog=','2016-10-22 10:26:51.905152',0,'12075006','Akshay','Bam','akshay.bam.min12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.450377'),(76,'pbkdf2_sha256$30000$CVsgp7uO4ax6$sfPEWZVngExjcAY31XLo4P30NJVEW/vicn+qWRpSsOc=','2016-10-22 10:27:03.548793',0,'12075007','Deepak','Manjhi','deepak.manjhi.phy12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.628919'),(77,'pbkdf2_sha256$30000$ntPI8cJjM91y$ucncxn/zDeFdlMyJ4HBeK6C9b84r+L2XZoDyvK0duoo=','2016-10-22 10:32:46.778186',0,'12075008','Bharat','Kumar','bharat.kumar.mst12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.762410'),(78,'pbkdf2_sha256$30000$HaZEa85fxGsf$jQ69XsUWhs/LiLvoHqMXsA/SNs25o+GTlNTHSkqRP1w=','2016-10-22 10:28:24.405548',0,'13075001','Shubham','Singh','shubham.singh.met12@iitbhu.ac.in',0,1,'2016-10-22 10:23:48.896361'),(79,'pbkdf2_sha256$30000$ZeoWrIgjDwzI$fDi6ULlu7suXoioxFqw6mayYghobCeCr6YCshsvnRy8=',NULL,0,'13075002','Shivam','Jadon','shivam.jadon.che12@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.029981'),(80,'pbkdf2_sha256$30000$tUr7buRl2w0B$7qWLydjlHkOBs7oLrrl2py5HKrzYbACMvYFjQl6AK1U=','2016-10-22 10:44:05.797342',0,'13075003','Manish','Singh','manish.singh.met12@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.163469'),(81,'pbkdf2_sha256$30000$GtAG5g6ue2zo$3UTLpnVGUswnq+cQ+P/ZzlzMde+tKPrtyUjQMUPfMMM=','2016-10-22 10:28:50.169372',0,'13075004','Akarsh','Mirsha','akarsh.mishra.mec12@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.297273'),(82,'pbkdf2_sha256$30000$oqxM2ChRy0ZJ$/nXPYwiX5O+y+z8DGKwezz7tztWgTw6y+tC0eKn3Mh4=','2016-10-22 10:32:27.686677',0,'13075005','Akshay','Bam','akshay.bam.min12@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.409536'),(83,'pbkdf2_sha256$30000$p2n6dmxV5uBT$tMvPADyhulAtCD2AEfARGYFbR2r4xz9a2eukfBjK0zk=','2016-10-22 10:44:27.666310',0,'13075006','Deepak','Manjhi','deepak.manjhi.phy13@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.576335'),(84,'pbkdf2_sha256$30000$CytgeHnM5Rpf$uepl93L6y3lZQ9toRgCgPNxTjISHP2koQf8/YB+A5FA=','2016-10-22 10:29:25.346208',0,'13075007','Akishta','Agarwal','akshita.agarwal.cse13@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.688041'),(85,'pbkdf2_sha256$30000$OyO7cOedthGd$yJ4b0JIXUZyzmwJ6C0sqjZPr9CCABBWK6pSbhEVCO2I=','2016-10-22 10:29:35.563193',0,'13075008','Ayush','Kedia','ayush.kedia.cer13@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.799070'),(86,'pbkdf2_sha256$30000$FneWUjEeRmHz$u5JDGP1b7d8EfqurfBEWxdqYwvnu/wXwFrY9kKr+mmA=','2016-10-22 11:01:21.966177',0,'14075001','Devang','Kulshretha','devang.kulshretha.bce14@iitbhu.ac.in',0,1,'2016-10-22 10:23:49.910482'),(87,'pbkdf2_sha256$30000$Yzm9Kpd5Vnhw$g/HReZ8y7Gk3/UWnub5T8BPSpzBL26eXhl9gHrp7dgA=','2016-10-22 10:30:05.984162',0,'14075002','Abhiram','Ravindran','abhiram.ravindran.mat14@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.023028'),(88,'pbkdf2_sha256$30000$qYlNH7Fpt3uy$giVBgQ8VrZ29JkKnwg5CP3dUM6m8TdZD8ohMzvOZVq8=','2016-10-22 10:30:15.737194',0,'14075003','Arpit','Chaudhary','arpit.chaudhary.eee14@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.133515'),(89,'pbkdf2_sha256$30000$D8erW920mxV3$jhioLgAyLWX7QHs9lv5L9Jkjxn8JRXq+I0Iz/su1/DU=','2016-10-22 10:44:40.629899',0,'14075004','Babloo','Kumar','babloo.kumar.cse14@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.244929'),(90,'pbkdf2_sha256$30000$V0KzFv3aqGYW$ZVBI0VMf/nSS0RezPy1paH3AZPRQIJILs2XKNBBOKG4=','2016-10-22 10:30:39.136696',0,'14075005','Ayush','Shrivastava','ayush.shrivastava.cse14@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.356200'),(91,'pbkdf2_sha256$30000$WcSYgq4c2z1p$zm4H3qCCsgp85OyVVcv5QEYzNBzF2NEAoBguAtN+lKE=','2016-10-22 10:30:50.026012',0,'15075001','Deepak','Manjhi','deepak.manjhi.phy15@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.467782'),(92,'pbkdf2_sha256$30000$MqfZVqKil9kx$UjeE5S7C4w6y/kJymTvbyJpXMDiv0kX4kjoASqYTIWI=','2016-10-22 10:31:01.071543',0,'15075002','Deveshi','Deveshi','deveshi.deveshi.phr15@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.589851'),(93,'pbkdf2_sha256$30000$60WnuuJ7SlIB$bGEYQHAkO+eLj1pT/3nGRY0hrEewpS9Kx/XINzHdEdk=','2016-10-22 10:44:53.685308',0,'15075003','Bharat','Kumar','bharat.kumar.mst15@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.712430'),(94,'pbkdf2_sha256$30000$hkFNZ5VDu3xu$6tgbaAvJbDGWNEP7PiEmOQXdetCiO7dliGXBFtfrIY0=','2016-10-22 10:31:24.722120',0,'16075001','Shivani','Shrivastava','shivani.shrivastava.min16@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.823868'),(95,'pbkdf2_sha256$30000$XVBezzWvFH3u$hq7pi/eY127Az2OVbnqMy92Dm/EGGt+B1lS6/Nfh94U=','2016-10-22 10:33:12.983556',0,'16075002','Vivek','Agarwal','vivek.agarwal.cse16@iitbhu.ac.in',0,1,'2016-10-22 10:23:50.946203'),(96,'pbkdf2_sha256$30000$cE5viiDDMDx3$XEwiin+Mq6G5ZiCzToyQYMFg0b5FJ2FU3RdlaUYLJIA=','2016-10-22 10:31:46.013531',0,'16075003','Prakhar','Doongarwal','prakhar.doongarwal.ich16@iitbhu.ac.in',0,1,'2016-10-22 10:23:51.070676'),(97,'pbkdf2_sha256$30000$GRIyfWbhj3LV$HqhJYG80Lk9NlHgd+9EWLXDIdeNvDQwG+VmMYX2Ox5U=','2016-10-22 10:33:44.696752',0,'16075004','Manish','Singh','manish.singh.met12@iitbhu.ac.in',0,1,'2016-10-22 10:23:51.208782'),(98,'pbkdf2_sha256$30000$jxWKVxq6oOL6$EblQ/+NMFiO2T04Kn0mI4RZAJN+G9g64FiZvBrApCUg=','2016-10-22 10:33:53.508330',0,'16075005','Akarsh','Mirsha','akarsh.mishra.mec12@iitbhu.ac.in',0,1,'2016-10-22 10:23:51.371407'),(99,'pbkdf2_sha256$30000$IqouAdifSOI8$0FUKjWKgVmYGlLquMvjrzNBy4Hw/A5nTKObTZKJE26A=','2016-10-22 10:34:08.560565',0,'16075006','Akshay','Bam','akshay.bam.min12@iitbhu.ac.in',0,1,'2016-10-22 10:23:51.504975'),(100,'pbkdf2_sha256$30000$39xMIl13Ciim$ITsXeDaln7u4RjPlp/Pdlqc72Km2r5x+5wU6/k21bcU=','2016-10-22 10:34:21.220275',0,'16075007','Deepak','Manjhi','deepak.manjhi.phy13@iitbhu.ac.in',0,1,'2016-10-22 10:23:51.640175'),(101,'pbkdf2_sha256$30000$4Xwz67EuI4j3$eGsevwrSR3MX7hOdG6XYdJL8I5hxv6RZAGsqm8XxWG8=','2016-10-22 10:34:32.731626',0,'16075008','Akishta','Agarwal','akshita.agarwal.cse13@iitbhu.ac.in',0,1,'2016-10-22 10:23:51.772322');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (2,'2016-10-18 15:34:03.188149','2','ayush',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',3,2),(3,'2016-10-18 15:34:21.137885','1','interritus',3,'',3,2),(4,'2016-10-20 16:22:04.804744','3','12345678',3,'',3,2),(5,'2016-10-20 16:22:04.943814','5','98765432',3,'',3,2),(6,'2016-10-21 07:24:10.544943','6','12345678',3,'',3,2),(7,'2016-10-21 07:24:10.588039','7','14075014',3,'',3,2),(8,'2016-10-21 14:06:23.862847','11','00000001',3,'',3,2),(9,'2016-10-21 14:06:23.902297','12','00000002',3,'',3,2),(10,'2016-10-21 14:06:23.981932','13','00000003',3,'',3,2),(11,'2016-10-21 14:06:24.050066','14','00000004',3,'',3,2),(12,'2016-10-21 14:06:24.082598','9','14075014',3,'',3,2),(13,'2016-10-21 14:06:24.115983','10','14075015',3,'',3,2),(14,'2016-10-21 14:20:46.120182','15','12023001',3,'',3,2),(15,'2016-10-21 14:20:46.204118','16','12028021',3,'',3,2),(16,'2016-10-21 14:20:46.248946','17','12074013',3,'',3,2),(17,'2016-10-21 14:20:46.371155','18','12088026',3,'',3,2),(18,'2016-10-21 14:21:16.953405','19','12023001',1,'[{\"added\": {}}]',3,2),(19,'2016-10-21 14:21:51.784418','19','12023001',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,2),(20,'2016-10-21 14:22:19.286492','20','12028021',1,'[{\"added\": {}}]',3,2),(21,'2016-10-21 14:22:33.081809','21','12074013',1,'[{\"added\": {}}]',3,2),(22,'2016-10-21 14:23:08.173297','22','12088026',1,'[{\"added\": {}}]',3,2),(23,'2016-10-21 14:37:24.736871','19','12023001',3,'',3,2),(24,'2016-10-21 14:37:24.776056','20','12028021',3,'',3,2),(25,'2016-10-21 14:37:24.898606','21','12074013',3,'',3,2),(26,'2016-10-21 14:37:24.943809','22','12088026',3,'',3,2),(27,'2016-10-21 14:48:04.284406','23','12023001',3,'',3,2),(28,'2016-10-21 14:48:04.330793','24','12028021',3,'',3,2),(29,'2016-10-21 14:48:04.464704','25','12074013',3,'',3,2),(30,'2016-10-21 14:48:04.498032','26','12088026',3,'',3,2),(31,'2016-10-21 14:48:04.532416','27','13026031',3,'',3,2),(32,'2016-10-21 14:48:04.576117','28','13072038',3,'',3,2),(33,'2016-10-21 14:48:04.609662','29','13074028',3,'',3,2),(34,'2016-10-21 14:48:04.644867','30','13082110',3,'',3,2),(35,'2016-10-21 14:48:04.676846','31','14024091',3,'',3,2),(36,'2016-10-21 14:48:04.710156','32','14025029',3,'',3,2),(37,'2016-10-21 14:48:04.743618','33','14068035',3,'',3,2),(38,'2016-10-21 14:48:04.777153','34','14074005',3,'',3,2),(39,'2016-10-21 14:48:04.811534','35','14075014',3,'',3,2),(40,'2016-10-21 14:48:04.844051','36','15023092',3,'',3,2),(41,'2016-10-21 14:48:04.877514','37','15024001',3,'',3,2),(42,'2016-10-21 14:48:04.910968','38','15075021',3,'',3,2),(43,'2016-10-21 14:48:04.966779','39','16023083',3,'',3,2),(44,'2016-10-21 14:48:05.008793','40','16045013',3,'',3,2),(45,'2016-10-21 14:48:05.078402','41','16075014',3,'',3,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-10-18 14:22:48.265238'),(2,'auth','0001_initial','2016-10-18 14:22:58.531011'),(3,'admin','0001_initial','2016-10-18 14:23:00.713922'),(4,'admin','0002_logentry_remove_auto_add','2016-10-18 14:23:00.826977'),(5,'contenttypes','0002_remove_content_type_name','2016-10-18 14:23:02.082731'),(6,'auth','0002_alter_permission_name_max_length','2016-10-18 14:23:02.206075'),(7,'auth','0003_alter_user_email_max_length','2016-10-18 14:23:02.407301'),(8,'auth','0004_alter_user_username_opts','2016-10-18 14:23:02.494448'),(9,'auth','0005_alter_user_last_login_null','2016-10-18 14:23:03.148314'),(10,'auth','0006_require_contenttypes_0002','2016-10-18 14:23:03.248430'),(11,'auth','0007_alter_validators_add_error_messages','2016-10-18 14:23:03.296398'),(12,'auth','0008_alter_user_username_max_length','2016-10-18 14:23:03.617588'),(13,'sessions','0001_initial','2016-10-18 14:23:04.643863');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('uexluhjz9i0ouci79mbtnout6jsp2n55','N2NiMjZkMWE4MWNkNWJiMDY1MGY2YzU4NWQ1MGIzMjI0MDJlZmJkMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5MDcwZDlhNTNkNzI5NWI0YjIyYmIzOWY2ODEzMzgzNDZlN2JjMTciLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-11-04 06:25:56.421334');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-22 16:32:13
