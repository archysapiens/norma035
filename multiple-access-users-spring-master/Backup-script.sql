/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - base
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`base` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `base`;

/*Table structure for table `roles` */

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`id`,`description`,`name`) values (1,'ROLE_ADMIN','ROLE_ADMIN'),(2,'ROLE MEMBER','ROLE_MEMBER');

/*Table structure for table `user_role` */

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values (5,1),(11,1),(9,2),(10,2),(12,2),(13,2),(14,2);

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`is_active`,`email`,`password`,`username`) values (4,'','covertest@mailnesia.com','123456789','covertest'),(5,'\0','MaldonadoMoy@hotmail.com','$2a$10$r3QNR7W/xTgv.yteQlnKI.yr8JRMOHLIvbyFxnHc8I44P1Oywrefe','admin'),(9,'\0','Prueba@hotmail.com','$2a$10$pjHWQifAnJVmnOR.iHMLTOhsa9u8tgi72BM3W3mkG3Q8HIoDeWXXi','Moises'),(10,'\0','Prueba2@hotmail.com','$2a$10$Dj./OiXx3anQgfqwpi25SecKStl7r7C1CKgwkSIHVmuFm8YaFwlEe','Prueba2'),(11,'','Pleasedo01@hotmail.com','$2a$10$ay7ffBavmOFAmqqFyyRqI.Qne4CnMSG2LZo5v007v9XVF1znB.Ab6','Moises Maldonado'),(12,'\0','agmproject01@hotmail.com','$2a$10$YOUMLshiNDvrZSYDEG836e/BxVKkd0EXA3gJ/gkreonhPak6m17Tq','Alex'),(13,'\0','Codigo@hotmail.com','$2a$10$wH4n2ajWYPdDvF8X9kXCCO71IO7BUTpCQl2Vq2Ds.wstzK.PKkH6W','Codigo'),(14,'','Prueba3@hotmail.com','$2a$10$2yPTasUSHl7oX1p5M.v4gu4PfZIFFl7ZZ15x.j3mwYeZFci/rqMym','fddf');

/*Table structure for table `verify_account` */

CREATE TABLE `verify_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `expired_data_token` datetime DEFAULT NULL,
  `token` text,
  `account_id` bigint(20) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `verify_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `verify_account` */

insert  into `verify_account`(`id`,`created_date`,`expired_data_token`,`token`,`account_id`) values (1,'2020-06-11 02:33:36','2020-06-11 02:38:36','BQVV9M',5),(5,'2020-06-11 15:09:13','2020-06-11 15:14:13','FJDBY8',9),(6,'2020-06-11 15:15:09','2020-06-11 15:20:09','6TM3PR',10),(7,'2020-06-11 15:21:23','2020-06-11 15:26:23','HIPI04',11),(8,'2020-06-11 15:25:23','2020-06-11 15:30:23','OBO6KL',12),(9,'2020-06-11 15:59:32','2020-06-11 16:04:32','XNCDZA',13),(10,'2020-06-11 16:09:14','2020-06-11 16:14:14','RH9DU0',14);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
