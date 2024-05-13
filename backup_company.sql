-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `company`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `company`;

--
-- Table structure for table `dep_locations`
--

DROP TABLE IF EXISTS `dep_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dep_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dep_locations`
--

LOCK TABLES `dep_locations` WRITE;
/*!40000 ALTER TABLE `dep_locations` DISABLE KEYS */;
INSERT INTO `dep_locations` VALUES (1,'Curitiba'),(4,'Rio de Janeiro'),(5,'São Paulo');
/*!40000 ALTER TABLE `dep_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`),
  KEY `Mgr_ssn` (`Mgr_ssn`),
  KEY `index_departamento` (`Dnumber`),
  CONSTRAINT `departament_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'783918473','1988-05-19'),('Administration',4,'598237289','1988-05-20'),('Research',5,'123456789','1988-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Ana','F','2000-01-01','Filha'),('123456824','Gustavo','M','1995-08-02','Marido'),('598237289','Bianca','F','1990-08-08','Esposa'),('618364829','Sérgio','M','2009-04-05','Filho'),('638176938','Maurício','M','1980-04-02','Marido');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dependentes_view`
--

DROP TABLE IF EXISTS `dependentes_view`;
/*!50001 DROP VIEW IF EXISTS `dependentes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dependentes_view` AS SELECT 
 1 AS `Nome_Gerente`,
 1 AS `Dependent_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Adress` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `index_funcionarios` (`Ssn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Naiara','G','Alcantara','123454789','1965-01-09','731-Fondren-Houston-TX','M',36000.00,NULL,1),('Trigger','T','Teste','123456759','0198-09-21','Rua Casa da Joana','M',32000.00,'123456789',1),('Trigger','T','Teste','123456784','0198-09-21',NULL,'M',32000.00,'123456789',5),('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,4),('Maria','B','Smith','123456824','1965-08-10','731-Fondren-Houston-TX','F',35000.00,'123456789',1),('Tamaro','H','Silva','598237289','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,4),('Rubens','N','Costa','618364829','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,5),('Jason','J','Silveira','638176938','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,5),('Ana','D','Machado','738172819','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,5),('Gabriel','W','Ferreira','739173927','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,5),('Bianca','E','Rocha','783918473','1965-01-09','731-Fondren-Houston-TX','M',30000.00,NULL,5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `salary_check` BEFORE INSERT ON `employee` FOR EACH ROW -- para cada linhas (for each row
	begin
		case new.Dno
			when 5 then set new.Super_ssn = '123456789';		-- set (setando) é como uma orientação, new indica uma nova informação que será recebida
            when 1 then set new.Super_ssn = null;
		end case;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `endereco_nulo` AFTER INSERT ON `employee` FOR EACH ROW if (new.Adress is Null) then
		insert into tabela_endereco_teste (mensagem, ssn) values (concat('Informe um  endereço', new.Fname), new.ssn);
	end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Atualizacao_salario` BEFORE UPDATE ON `employee` FOR EACH ROW begin
		case new.Dno
			when 1 then set new.Salary = new.Salary * 1.20;
		end case;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Funcionario_demitido` BEFORE DELETE ON `employee` FOR EACH ROW begin
		insert into Tabela_Demitidos (Ssn)
		values (old.Ssn);
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `gerentes_view`
--

DROP TABLE IF EXISTS `gerentes_view`;
/*!50001 DROP VIEW IF EXISTS `gerentes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gerentes_view` AS SELECT 
 1 AS `Nome_Completo`,
 1 AS `Ssn`,
 1 AS `Dname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `localidade_view`
--

DROP TABLE IF EXISTS `localidade_view`;
/*!50001 DROP VIEW IF EXISTS `localidade_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `localidade_view` AS SELECT 
 1 AS `Dlocation`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nomedaview_dependente`
--

DROP TABLE IF EXISTS `nomedaview_dependente`;
/*!50001 DROP VIEW IF EXISTS `nomedaview_dependente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nomedaview_dependente` AS SELECT 
 1 AS `nome_completo`,
 1 AS `dependent_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `nomedaview_salario_26`
--

DROP TABLE IF EXISTS `nomedaview_salario_26`;
/*!50001 DROP VIEW IF EXISTS `nomedaview_salario_26`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nomedaview_salario_26` AS SELECT 
 1 AS `nome_completo`,
 1 AS `salary`,
 1 AS `numero_departamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pdg_view`
--

DROP TABLE IF EXISTS `pdg_view`;
/*!50001 DROP VIEW IF EXISTS `pdg_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pdg_view` AS SELECT 
 1 AS `Nomes_Projetos`,
 1 AS `Nomes_Departamentos`,
 1 AS `Ssn_Gerentes`,
 1 AS `Nomes_Gerentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `Pname` (`Pname`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `projetos_view`
--

DROP TABLE IF EXISTS `projetos_view`;
/*!50001 DROP VIEW IF EXISTS `projetos_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projetos_view` AS SELECT 
 1 AS `Nome_Projeto`,
 1 AS `Quantidade_Funcionarios`,
 1 AS `Numero_Projeto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tabela_demitidos`
--

DROP TABLE IF EXISTS `tabela_demitidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_demitidos` (
  `Ssn` char(9) NOT NULL,
  PRIMARY KEY (`Ssn`),
  CONSTRAINT `Demitidos_FK_Ssn` FOREIGN KEY (`Ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_demitidos`
--

LOCK TABLES `tabela_demitidos` WRITE;
/*!40000 ALTER TABLE `tabela_demitidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabela_demitidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_endereco_teste`
--

DROP TABLE IF EXISTS `tabela_endereco_teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_endereco_teste` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(100) DEFAULT NULL,
  `ssn` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_endereco_teste`
--

LOCK TABLES `tabela_endereco_teste` WRITE;
/*!40000 ALTER TABLE `tabela_endereco_teste` DISABLE KEYS */;
INSERT INTO `tabela_endereco_teste` VALUES (1,'Informe um  endereçoTrigger',123456784);
/*!40000 ALTER TABLE `tabela_endereco_teste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_usuario`
--

DROP TABLE IF EXISTS `tabela_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_usuario`
--

LOCK TABLES `tabela_usuario` WRITE;
/*!40000 ALTER TABLE `tabela_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabela_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123454789',1,10.0),('123456759',2,20.0),('123456784',3,30.0),('123456789',10,11.0),('123456824',20,22.0),('598237289',30,33.0),('618364829',1,15.0),('638176938',10,21.0),('738172819',30,32.0),('739173927',30,29.0),('783918473',1,8.0),('783918473',30,18.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `company`
--

USE `company`;

--
-- Final view structure for view `dependentes_view`
--

/*!50001 DROP VIEW IF EXISTS `dependentes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dependentes_view` AS select concat(`e`.`fname`,' ',`e`.`Lname`) AS `Nome_Gerente`,`x`.`Dependent_name` AS `Dependent_name` from ((`employee` `e` join `dependent` `x` on((`x`.`Essn` = `e`.`Ssn`))) join `departament` `d` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gerentes_view`
--

/*!50001 DROP VIEW IF EXISTS `gerentes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gerentes_view` AS select concat(`e`.`fname`,' ',`e`.`fname`) AS `Nome_Completo`,`e`.`Ssn` AS `Ssn`,`d`.`Dname` AS `Dname` from (`employee` `e` join `departament` `d` on((`e`.`Ssn` = `d`.`Mgr_ssn`))) order by `e`.`fname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `localidade_view`
--

/*!50001 DROP VIEW IF EXISTS `localidade_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `localidade_view` AS select `l`.`Dlocation` AS `Dlocation`,count(0) AS `count(*)` from ((`departament` `d` join `dep_locations` `l` on((`l`.`Dnumber` = `d`.`Dnumber`))) join `employee` `e` on((`e`.`Dno` = `d`.`Dnumber`))) group by `l`.`Dlocation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nomedaview_dependente`
--

/*!50001 DROP VIEW IF EXISTS `nomedaview_dependente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nomedaview_dependente` AS select concat(`employee`.`fname`,`employee`.`Minit`,`employee`.`Lname`) AS `nome_completo`,`dependent`.`Dependent_name` AS `dependent_name` from (`employee` join `dependent` on((`employee`.`Ssn` = `dependent`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nomedaview_salario_26`
--

/*!50001 DROP VIEW IF EXISTS `nomedaview_salario_26`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nomedaview_salario_26` AS select concat(`employee`.`fname`,`employee`.`Minit`,`employee`.`Lname`) AS `nome_completo`,`employee`.`Salary` AS `salary`,`employee`.`Dno` AS `numero_departamento` from `employee` where (`employee`.`Salary` > 26999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pdg_view`
--

/*!50001 DROP VIEW IF EXISTS `pdg_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdg_view` AS select `p`.`Pname` AS `Nomes_Projetos`,`d`.`Dname` AS `Nomes_Departamentos`,`d`.`Mgr_ssn` AS `Ssn_Gerentes`,`e`.`fname` AS `Nomes_Gerentes` from ((`project` `p` join `departament` `d` on((`d`.`Dnumber` = `p`.`Dnum`))) join `employee` `e` on((`e`.`Ssn` = `d`.`Mgr_ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projetos_view`
--

/*!50001 DROP VIEW IF EXISTS `projetos_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projetos_view` AS select `p`.`Pname` AS `Nome_Projeto`,count(0) AS `Quantidade_Funcionarios`,`p`.`Pnumber` AS `Numero_Projeto` from ((`project` `p` join `works_on` `w` on((`p`.`Pnumber` = `w`.`Pno`))) join `employee` `e` on((`e`.`Ssn` = `w`.`Essn`))) group by `p`.`Pname` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-13 15:02:42
