/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.7.21-log : Database - deer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`deer` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `deer`;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `isfrozen` int(1) DEFAULT '0' COMMENT '0为没有冻结，1为冻结',
  `head_portrait` varchar(256) DEFAULT NULL COMMENT '头像地址',
  `bank_card` varchar(20) DEFAULT NULL COMMENT '银行卡号',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `user_name` varchar(16) DEFAULT NULL COMMENT '用户名，不能重复',
  `user_pass` varchar(16) DEFAULT NULL COMMENT '密码',
  `gender` int(1) DEFAULT '0' COMMENT '0是男 1是女',
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`isfrozen`,`head_portrait`,`bank_card`,`phone`,`email`,`birthday`,`user_name`,`user_pass`,`gender`,`user_id`) values 
(0,'../img/headPortrait/1521726351734_test_36.jpg',NULL,'15757126146','410142560@qq.com',NULL,'test','1234',0,36);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
