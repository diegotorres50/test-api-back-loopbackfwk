
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
DROP TABLE IF EXISTS `Subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscriptions` (
  `id` int(11) NOT NULL,
  `subscription_name` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Subscriptions` WRITE;
/*!40000 ALTER TABLE `Subscriptions` DISABLE KEYS */;
INSERT INTO `Subscriptions` (`id`, `subscription_name`, `price`) VALUES (1,'Periodico El Tiempo',2000),(2,'Periodico ADN',0),(3,'Revista ALO',4500);
/*!40000 ALTER TABLE `Subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SubscriptionsByUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionsByUsers` (
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `payment_state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`subscription_id`),
  KEY `fk_SubscriptionsByUsers_2_idx` (`subscription_id`),
  CONSTRAINT `fk_SubscriptionsByUsers_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SubscriptionsByUsers_2` FOREIGN KEY (`subscription_id`) REFERENCES `Subscriptions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SubscriptionsByUsers` WRITE;
/*!40000 ALTER TABLE `SubscriptionsByUsers` DISABLE KEYS */;
INSERT INTO `SubscriptionsByUsers` (`user_id`, `subscription_id`, `payment_state`) VALUES (80123858,1,'Okay'),(80123858,2,'Pending'),(98545522,2,'Okay'),(98545522,3,'Okay');
/*!40000 ALTER TABLE `SubscriptionsByUsers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` (`id`, `user_name`, `phone`) VALUES (80123858,'Diego','318987452'),(98545522,'Grace','312548754');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `viewallsubscriptions`;
/*!50001 DROP VIEW IF EXISTS `viewallsubscriptions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewallsubscriptions` (
  `user_id` tinyint NOT NULL,
  `subscription_id` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `subscription_name` tinyint NOT NULL,
  `payment_state` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!50001 DROP TABLE IF EXISTS `viewallsubscriptions`*/;
/*!50001 DROP VIEW IF EXISTS `viewallsubscriptions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewallsubscriptions` AS select `Users`.`id` AS `user_id`,`Subscriptions`.`id` AS `subscription_id`,`Users`.`user_name` AS `user_name`,`Subscriptions`.`subscription_name` AS `subscription_name`,`SubscriptionsByUsers`.`payment_state` AS `payment_state` from ((`Users` join `Subscriptions`) join `SubscriptionsByUsers`) where ((`Users`.`id` = `SubscriptionsByUsers`.`user_id`) and (`SubscriptionsByUsers`.`subscription_id` = `Subscriptions`.`id`)) order by `Users`.`id` */;
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

