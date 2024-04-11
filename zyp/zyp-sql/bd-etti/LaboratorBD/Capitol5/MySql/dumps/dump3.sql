CREATE DATABASE  IF NOT EXISTS `lab52` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lab52`;
-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: lab52
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `AFS`
--

DROP TABLE IF EXISTS `AFS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AFS` (
  `IdAngajat` int(11) NOT NULL,
  `Nume` varchar(20) NOT NULL,
  `Prenume` varchar(20) NOT NULL,
  `DataNasterii` datetime DEFAULT NULL,
  `Adresa` varchar(50) DEFAULT NULL,
  `Functie` varchar(50) DEFAULT NULL,
  `Salariu` decimal(10,0) DEFAULT '2800',
  PRIMARY KEY (`IdAngajat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AFS`
--

LOCK TABLES `AFS` WRITE;
/*!40000 ALTER TABLE `AFS` DISABLE KEYS */;
INSERT INTO `AFS` VALUES (1,'Nume1','Prenume1',NULL,NULL,'Inginer',3000),(2,'Nume2','Prenume2',NULL,NULL,'Inginer',3000),(3,'Nume3','Prenume3',NULL,NULL,'Tehnician',2000),(4,'Nume4','Prenume4',NULL,NULL,'Tehnician',2000),(5,'Nume5','Prenume5',NULL,NULL,'Secretara',1500),(6,'Nume1x','Prenume1x',NULL,NULL,'Inginer',3000),(7,'Nume1a','Prenume1a','0000-00-00 00:00:00','NULL','Inginer',3000),(8,'Nume1a','Prenume1a','2010-01-01 00:00:00','Bucuresti','Inginer',3000),(9,'Nume1ab','Prenume1ab','2010-01-01 00:00:00','Bucuresti','Inginer',3000),(10,'Nume1sa','Prenume1sa','2010-01-01 00:00:00','Bucuresti','Inginer',3000),(11,'Nume1fa','Prenume1fa','2010-01-01 00:00:00','Bucuresti','Inginer',3000);
/*!40000 ALTER TABLE `AFS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AP`
--

DROP TABLE IF EXISTS `AP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AP` (
  `IdAngajat` int(11) NOT NULL DEFAULT '0',
  `Nume` varchar(20) NOT NULL,
  `Prenume` varchar(20) NOT NULL,
  `Adresa` varchar(20) DEFAULT NULL,
  `IdProiect` varchar(20) NOT NULL DEFAULT '',
  `Ore` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`IdAngajat`,`IdProiect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AP`
--

LOCK TABLES `AP` WRITE;
/*!40000 ALTER TABLE `AP` DISABLE KEYS */;
INSERT INTO `AP` VALUES (1,'Nume1','Prenume1','Adresa1','P1',100),(1,'Nume1','Prenume1','Adresa1','P123',100),(1,'Nume1','Prenume1','Adresa1','P2',200),(1,'Nume1','Prenume1','Adresa1','P5',500),(2,'Nume2','Prenume2','Adresa2','P1',300),(2,'Nume2','Prenume2','Adresa2','P2',400);
/*!40000 ALTER TABLE `AP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDP`
--

DROP TABLE IF EXISTS `EDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EDP` (
  `IdElev` char(10) NOT NULL DEFAULT '',
  `IdDisciplina` char(10) NOT NULL DEFAULT '',
  `IdProfesor` char(10) DEFAULT NULL,
  PRIMARY KEY (`IdElev`,`IdDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDP`
--

LOCK TABLES `EDP` WRITE;
/*!40000 ALTER TABLE `EDP` DISABLE KEYS */;
INSERT INTO `EDP` VALUES ('E1','D1','P1'),('E1','D2','P2'),('E2','D1','P1'),('E2','D2','P2'),('E3','D3','P3');
/*!40000 ALTER TABLE `EDP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EP`
--

DROP TABLE IF EXISTS `EP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EP` (
  `IdElev` char(10) NOT NULL DEFAULT '',
  `IdProfesor` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdElev`,`IdProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EP`
--

LOCK TABLES `EP` WRITE;
/*!40000 ALTER TABLE `EP` DISABLE KEYS */;
INSERT INTO `EP` VALUES ('E1','P1'),('E1','P3'),('E2','P1'),('E2','P2'),('E3','P3');
/*!40000 ALTER TABLE `EP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PD`
--

DROP TABLE IF EXISTS `PD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PD` (
  `IdProfesor` char(10) NOT NULL DEFAULT '',
  `IdDisciplina` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdProfesor`,`IdDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PD`
--

LOCK TABLES `PD` WRITE;
/*!40000 ALTER TABLE `PD` DISABLE KEYS */;
INSERT INTO `PD` VALUES ('P1','D1'),('P2','D2'),('P3','D3');
/*!40000 ALTER TABLE `PD` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-12 17:51:52
CREATE DATABASE  IF NOT EXISTS `lab5` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lab5`;
-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: lab5
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `AFS`
--

DROP TABLE IF EXISTS `AFS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AFS` (
  `IdAngajat` int(11) NOT NULL,
  `Nume` varchar(20) NOT NULL,
  `Prenume` varchar(20) NOT NULL,
  `DataNasterii` datetime DEFAULT NULL,
  `Adresa` varchar(50) DEFAULT NULL,
  `Functie` varchar(50) DEFAULT NULL,
  `Salariu` decimal(10,0) DEFAULT '2800',
  PRIMARY KEY (`IdAngajat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AFS`
--

LOCK TABLES `AFS` WRITE;
/*!40000 ALTER TABLE `AFS` DISABLE KEYS */;
INSERT INTO `AFS` VALUES (1,'Nume1','Prenume1',NULL,NULL,'Inginer',3000),(2,'Nume2','Prenume2',NULL,NULL,'Inginer',3000),(3,'Nume3','Prenume3',NULL,NULL,'Tehnician',2000),(4,'Nume4','Prenume4',NULL,NULL,'Tehnician',2000),(5,'Nume5','Prenume5',NULL,NULL,'Secretara',1500),(6,'Nume1x','Prenume1x',NULL,NULL,'Inginer',3000);
/*!40000 ALTER TABLE `AFS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lab5`.`tg_AFS`
AFTER INSERT ON `lab5`.`AFS`
FOR EACH ROW
BEGIN
DECLARE v_functia varchar(20);
DECLARE v_salariu decimal;
DECLARE n_functia varchar(20);
DECLARE n_salariu decimal;
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Crearea unui cursor 
DECLARE cursor_AFS CURSOR
FOR
SELECT Functie, Salariu FROM AFS;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

SET n_functia = new.Functie, n_salariu = new.Salariu;

OPEN Cursor_AFS;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_AFS INTO v_functia, v_salariu;
	IF n_functia = v_functia AND n_salariu != v_salariu THEN
			set mesaj = "Eroare DF";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mesaj;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_AFS;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `AP`
--

DROP TABLE IF EXISTS `AP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AP` (
  `IdAngajat` int(11) NOT NULL DEFAULT '0',
  `Nume` varchar(20) NOT NULL,
  `Prenume` varchar(20) NOT NULL,
  `Adresa` varchar(20) DEFAULT NULL,
  `IdProiect` varchar(20) NOT NULL DEFAULT '',
  `Ore` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`IdAngajat`,`IdProiect`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AP`
--

LOCK TABLES `AP` WRITE;
/*!40000 ALTER TABLE `AP` DISABLE KEYS */;
INSERT INTO `AP` VALUES (1,'Nume1','Prenume1','Adresa1','P1',100),(1,'Nume1','Prenume1','Adresa1','P123',100),(1,'Nume1','Prenume1','Adresa1','P2',200),(2,'Nume2','Prenume2','Adresa2','P1',300),(2,'Nume2','Prenume2','Adresa2','P2',400);
/*!40000 ALTER TABLE `AP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lab5`.`tg_AP`
AFTER INSERT ON `lab5`.`AP`
FOR EACH ROW
BEGIN
DECLARE v_angajat int;
DECLARE v_nume varchar(20);
DECLARE v_prenume varchar(20);
DECLARE v_adresa varchar(20);
DECLARE n_angajat int;
DECLARE n_proiect varchar(20) ;
DECLARE n_nume varchar(20);
DECLARE n_prenume varchar(20);
DECLARE n_adresa varchar(20);
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Crearea unui cursor
DECLARE cursor_AP CURSOR
FOR
SELECT AP.IdAngajat,AP.Nume,AP.Prenume,AP.Adresa FROM AP;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

-- Memorarea valorilor atributelor liniei nou inserate
SET n_angajat = new.IdAngajat, n_proiect = new.IdProiect,
	n_nume = new.Nume, n_prenume = new.Prenume,n_adresa = new.Adresa;

-- Deschiderea cursorului
OPEN cursor_AP;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_AP INTO v_angajat, v_nume, v_prenume, v_adresa;
	IF n_angajat = v_angajat AND(n_nume != v_nume OR n_prenume != v_prenume 
			OR n_adresa != v_adresa) THEN
			set mesaj = "Eroare DF";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mesaj;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_AP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EDP`
--

DROP TABLE IF EXISTS `EDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EDP` (
  `IdElev` char(10) NOT NULL DEFAULT '',
  `IdDisciplina` char(10) NOT NULL DEFAULT '',
  `IdProfesor` char(10) DEFAULT NULL,
  PRIMARY KEY (`IdElev`,`IdDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDP`
--

LOCK TABLES `EDP` WRITE;
/*!40000 ALTER TABLE `EDP` DISABLE KEYS */;
INSERT INTO `EDP` VALUES ('E1','D1','P1'),('E1','D2','P2'),('E2','D1','P1'),('E2','D2','P2'),('E3','D3','P3');
/*!40000 ALTER TABLE `EDP` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lab5`.`tg_EDP`
AFTER INSERT ON `lab5`.`EDP`
FOR EACH ROW
BEGIN
DECLARE n_disciplina char(10);
DECLARE n_profesor char(10);
DECLARE v_disciplina char(10);
DECLARE v_profesor char(10);
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Creare si deschidere cursor
DECLARE cursor_EDP CURSOR 
FOR
SELECT IdDisciplina, IdProfesor FROM EDP;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

SET n_disciplina = new.IdDisciplina, n_profesor = new.IdProfesor;

OPEN cursor_EDP;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_EDP INTO v_disciplina, v_profesor;
	IF n_profesor=v_profesor AND n_disciplina!= v_disciplina THEN
			set mesaj = "Eroare DF";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mesaj;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_EDP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EP`
--

DROP TABLE IF EXISTS `EP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EP` (
  `IdElev` char(10) NOT NULL DEFAULT '',
  `IdProfesor` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdElev`,`IdProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EP`
--

LOCK TABLES `EP` WRITE;
/*!40000 ALTER TABLE `EP` DISABLE KEYS */;
INSERT INTO `EP` VALUES ('E1','P1'),('E1','P3'),('E2','P1'),('E2','P2'),('E3','P3');
/*!40000 ALTER TABLE `EP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PD`
--

DROP TABLE IF EXISTS `PD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PD` (
  `IdProfesor` char(10) NOT NULL DEFAULT '',
  `IdDisciplina` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdProfesor`,`IdDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PD`
--

LOCK TABLES `PD` WRITE;
/*!40000 ALTER TABLE `PD` DISABLE KEYS */;
INSERT INTO `PD` VALUES ('P1','D1'),('P2','D2'),('P3','D3');
/*!40000 ALTER TABLE `PD` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-12 17:51:52
