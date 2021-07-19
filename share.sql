/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.5.49 : Database - share
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`share` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `share`;

/*Table structure for table `business` */

DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `busid` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `rid` int(11) DEFAULT NULL COMMENT '资源ID',
  `busdate` datetime DEFAULT NULL COMMENT '日期时间',
  `state` int(11) DEFAULT NULL COMMENT '状态(0:收藏,1:下载,2:发布资源)',
  `busprice` float DEFAULT NULL COMMENT '积分数',
  PRIMARY KEY (`busid`),
  KEY `userid` (`userid`),
  KEY `rid` (`rid`),
  CONSTRAINT `business_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `business_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `resources` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

/*Data for the table `business` */

/*Table structure for table `resources` */

DROP TABLE IF EXISTS `resources`;

CREATE TABLE `resources` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `rname` varchar(255) NOT NULL COMMENT '资源名',
  `rinformation` varchar(255) NOT NULL COMMENT '资源介绍',
  `update` datetime DEFAULT NULL COMMENT '上传日期时间',
  `browsenum` bigint(255) DEFAULT '0' COMMENT '下载次数',
  `location` varchar(255) DEFAULT NULL COMMENT '资源地址',
  `price` float DEFAULT NULL COMMENT '积分价格',
  `category` int(11) DEFAULT NULL COMMENT '资源类别',
  `label1` varchar(255) DEFAULT NULL COMMENT '标签1',
  `label2` varchar(255) DEFAULT NULL COMMENT '标签2',
  `label3` varchar(255) DEFAULT NULL COMMENT '标签3',
  `img` int(11) DEFAULT '0' COMMENT '是否有图片(0:没有,1:有)',
  `state` int(11) DEFAULT '1' COMMENT '资源状态(1:正常,0:删除)',
  PRIMARY KEY (`rid`),
  KEY `userid` (`userid`),
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Data for the table `resources` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `userpass` varchar(255) NOT NULL COMMENT '用户密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `sex` int(11) DEFAULT '2' COMMENT '性别(0:女,1:男,2:不公开)',
  `balance` float DEFAULT '500' COMMENT '积分余额',
  `state` int(11) DEFAULT '1' COMMENT '状态(0:管理员,1:用户,2:封禁)',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userid`,`username`,`userpass`,`phone`,`email`,`sex`,`balance`,`state`) values (1,'admin','ISMvKXpXpadDiUoOSoAfww==','18625300687','1978249615@qq.com',1,500,0);

/* Trigger structure for table `resources` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insresprice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insresprice` AFTER INSERT ON `resources` FOR EACH ROW BEGIN
	if new.state=1 then
		update `user` set balance=balance+50 where userid=new.`userid`;
		insert business(userid,rid,busdate,state,busprice) values(new.`userid`,new.`rid`,now(),2,50);
	end if;
    END */$$


DELIMITER ;

/* Procedure structure for procedure `insbus` */

/*!50003 DROP PROCEDURE IF EXISTS  `insbus` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insbus`(IN r_userid INT,IN r_rid INT,IN r_state INT)
BEGIN
		DECLARE r_price FLOAT;
	DECLARE r_balance FLOAT;
	SET r_balance=(SELECT balance FROM `user` WHERE userid=r_userid);
	SET r_price=(SELECT price FROM resources WHERE rid=r_rid);
	IF r_state=1 THEN
		if (select count(*) from business where userid=r_userid and rid=r_rid)>0 then
			select 1 as res;
		else
			IF (r_balance>=r_price) THEN
				INSERT business(userid,rid,busdate,busprice,state) VALUES(r_userid,r_rid,NOW(),r_price,r_state);
				UPDATE `user` SET balance=balance-r_price WHERE userid=r_userid;
				UPDATE `user` SET balance=balance+r_price WHERE userid=(SELECT userid FROM resources WHERE rid=r_rid);
				UPDATE resources SET browsenum=browsenum+1 WHERE rid=r_rid;
				SELECT 1 AS res;
			ELSE
				SELECT 0 AS res;
			end if;
		END IF;
	ELSE
		IF (SELECT count(*) FROM business WHERE userid=r_userid AND rid=r_rid AND state=0)<=0 THEN
			INSERT business(userid,rid,busdate,busprice,state) VALUES(r_userid,r_rid,NOW(),r_price,r_state);
			SELECT 3 AS res;
		ELSE
			SELECT 4 AS res;
		END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insres` */

/*!50003 DROP PROCEDURE IF EXISTS  `insres` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insres`(in r_rid int,IN r_userid INT,IN r_rname VARCHAR(255),IN r_rinformation VARCHAR(255),IN r_location VARCHAR(255),IN r_price FLOAT,IN r_category INT,IN r_label1 VARCHAR(255),IN r_label2 VARCHAR(255),IN r_label3 VARCHAR(255))
BEGIN	
		INSERT resources(userid,rname,rinformation,`update`,location,price,category,label1,label2,label3) VALUES(r_userid,r_rname,r_rinformation,NOW(),r_location,r_price,r_category,r_label1,r_label2,r_label3);
		SELECT LAST_INSERT_ID() AS rid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `likelist` */

/*!50003 DROP PROCEDURE IF EXISTS  `likelist` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `likelist`(IN r_userid INT,in star int,in num int)
BEGIN
	SELECT rlist.* FROM rlist,business WHERE `rlist`.`rid`=`business`.`rid` AND `business`.`userid`=r_userid AND `business`.`state`=0 LIMIT star,num;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `selectu` */

/*!50003 DROP PROCEDURE IF EXISTS  `selectu` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `selectu`(IN searchName VARCHAR(255),IN star INT,IN num INT)
BEGIN
	SELECT * FROM `user` ORDER BY userid DESC LIMIT star,num ;
    END */$$
DELIMITER ;

/*Table structure for table `rlist` */

DROP TABLE IF EXISTS `rlist`;

/*!50001 DROP VIEW IF EXISTS `rlist` */;
/*!50001 DROP TABLE IF EXISTS `rlist` */;

/*!50001 CREATE TABLE  `rlist`(
 `rid` int(11) ,
 `userid` int(11) ,
 `rname` varchar(255) ,
 `username` varchar(255) ,
 `rinformation` varchar(255) ,
 `update` datetime ,
 `browsenum` bigint(255) ,
 `price` float ,
 `category` int(11) ,
 `label1` varchar(255) ,
 `label2` varchar(255) ,
 `label3` varchar(255) ,
 `location` varchar(255) ,
 `img` int(11) ,
 `state` int(11) 
)*/;

/*View structure for view rlist */

/*!50001 DROP TABLE IF EXISTS `rlist` */;
/*!50001 DROP VIEW IF EXISTS `rlist` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rlist` AS select `resources`.`rid` AS `rid`,`user`.`userid` AS `userid`,`resources`.`rname` AS `rname`,`user`.`username` AS `username`,`resources`.`rinformation` AS `rinformation`,`resources`.`update` AS `update`,`resources`.`browsenum` AS `browsenum`,`resources`.`price` AS `price`,`resources`.`category` AS `category`,`resources`.`label1` AS `label1`,`resources`.`label2` AS `label2`,`resources`.`label3` AS `label3`,`resources`.`location` AS `location`,`resources`.`img` AS `img`,`resources`.`state` AS `state` from (`resources` join `user`) where (`resources`.`userid` = `user`.`userid`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
