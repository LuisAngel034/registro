/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.23 : Database - bdbecas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdbecas` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bdbecas`;

/*Table structure for table `tblalumnos` */

DROP TABLE IF EXISTS `tblalumnos`;

CREATE TABLE `tblalumnos` (
  `vchMatricula` varchar(10) NOT NULL,
  `vchNombre` varchar(255) DEFAULT NULL,
  `vchAPaterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vchAMaterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `P1` float DEFAULT NULL,
  `P2` float DEFAULT NULL,
  `P3` float DEFAULT NULL,
  PRIMARY KEY (`vchMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tblalumnos` */

insert  into `tblalumnos`(`vchMatricula`,`vchNombre`,`vchAPaterno`,`vchAMaterno`,`P1`,`P2`,`P3`) values 
('2000055','MAURICIA','AQUINO','CEBOLLON',10,8,8),
('2002102','FANNY','LARA','JUÁREZ',6,7,8),
('2003504','LORENZO','HERNÁNDEZ','RAMÍREZ',9,9,9),
('2005051','RAQUEL','PÉREZ','HERNÁNDEZ',9,7,9),
('2005535','GUADALUPE','HERNÁNDEZ','ROSAS',7,10,8),
('2007141','JOSE LUIS','CASTILLO','HERNÁNDEZ',8,8,8),
('2008045','CÉSAR ADRIÁN','HERNÁNDEZ','MARTÍNEZ',8,7,8),
('2008211','PORFIRIO','DE LA CRUZ','DE LA CRUZ',8,9,9),
('2008694','MARISSA','VERGARA','HERNÁNDEZ',8,8,9),
('2009085','LUIS EDUARDO','BAUTISTA','HERNÁNDEZ',9,7,7),
('2009182','JULIAN LEONARDO','BAUTISTA','HERNÁNDEZ',7,8,5),
('2009471','BRICIO','HERNÁNDEZ','VITE',10,9,9),
('2009525','MARTIN','NARANJO','HERNÁNDEZ',9,9,9),
('2009547','PAULINO','RIVERA','GARCIA',10,10,10),
('2009745','ROSA GLORIA','DE LA CRUZ','MARTÍNEZ',10,8,8),
('2009752','IDALIA','HERNÁNDEZ','MARIA',8,8,8),
('2010008','GEYDER','HERNÁNDEZ','DE LA CRUZ',9,9,9),
('2010084','ROOSEMBERT','BAUTISTA','MARCOS',10,6,6),
('2010222','FRANCISCO','ROMERO','HERNÁNDEZ',6,6,7),
('2010232','JUVENTINO','LUNA','HERNANDEZ',8,7,7),
('2010392','RUFINA','MARTINEZ','HERNANDEZ',8,8,6),
('2010437','DANIEL','MARTINEZ','HERNANDEZ',5,10,10),
('2010501','JOSE DE JESUS','ACOSTA','MARTINEZ',8,7,9),
('2010502','WENCESLAO','DE LA CRUZ','DE LA CRUZ',9,9,10),
('2010516','XIHUILT','FLORES','PASTRANA',10,10,10),
('2010526','JHOVANY','HERNANDEZ','HERNANDEZ',6,6,7),
('2011005','LUIS ALBERTO','HERNANDEZ','MARTINEZ',6,5,9),
('2011028','ROMUALDA','ZEFERINO','MARTÍNEZ',9,9,9),
('2011129','REBECA','VALDIVIA','JUAN',8,8,8);

/*Table structure for table `tblbecas` */

DROP TABLE IF EXISTS `tblbecas`;

CREATE TABLE `tblbecas` (
  `idTipoBeca` int NOT NULL AUTO_INCREMENT,
  `vchTipoBeca` varchar(50) DEFAULT NULL,
  `fltMonto` float DEFAULT NULL,
  PRIMARY KEY (`idTipoBeca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tblbecas` */

insert  into `tblbecas`(`idTipoBeca`,`vchTipoBeca`,`fltMonto`) values 
(1,'Alimentación',900),
(2,'Servicio',1200),
(3,'Excelencia',1800),
(4,'Federal',2800),
(5,'Estatal',2000),
(6,'Sin Beca',0);

/*Table structure for table `tblbecasasignadas` */

DROP TABLE IF EXISTS `tblbecasasignadas`;

CREATE TABLE `tblbecasasignadas` (
  `intBeca` int NOT NULL AUTO_INCREMENT,
  `vchMatricula` varchar(10) DEFAULT NULL,
  `promedio` float DEFAULT NULL,
  `idTipoBeca` int DEFAULT NULL,
  PRIMARY KEY (`intBeca`),
  KEY `vchMatricula` (`vchMatricula`),
  KEY `idTipoBeca` (`idTipoBeca`),
  CONSTRAINT `tblbecasasignadas_ibfk_1` FOREIGN KEY (`vchMatricula`) REFERENCES `tblalumnos` (`vchMatricula`),
  CONSTRAINT `tblbecasasignadas_ibfk_2` FOREIGN KEY (`idTipoBeca`) REFERENCES `tblbecas` (`idTipoBeca`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `tblbecasasignadas` */

insert  into `tblbecasasignadas`(`intBeca`,`vchMatricula`,`promedio`,`idTipoBeca`) values 
(26,'2005535',8.33,1),
(27,'2007141',8,1),
(28,'2010222',6.33,6),
(29,'2010516',10,3),
(30,'2010516',10,4);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) DEFAULT NULL,
  `vchpasword` varchar(150) DEFAULT NULL,
  `tipo` enum('Administrador','Normal') DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idUsuario`,`usuario`,`vchpasword`,`tipo`) values 
(9,'gather','gather','Administrador'),
(10,'prueba','123admin','Normal'),
(13,'juan','juan333','Administrador'),
(14,'pepe','pepe98','Normal');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
