-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: JOURNEY_MANAGER
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `customer_bills`
--

DROP TABLE IF EXISTS `customer_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_bills` (
  `customer_id` varchar(255) NOT NULL,
  `bill_number` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`,`bill_number`),
  UNIQUE KEY `UNIQUE_CUSTOMER_BILL_ID` (`customer_id`,`bill_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_substage`
--

DROP TABLE IF EXISTS `customer_substage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_substage` (
  `customer_id` varchar(255) NOT NULL,
  `substage_id` bigint NOT NULL,
  `substage_state` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `UNIQUE_CUSTOMER_SUBSTAGE_ID` (`customer_id`,`substage_id`),
  KEY `FK_SUBSTAGE_ID` (`substage_id`),
  CONSTRAINT `customer_substage_ibfk_1` FOREIGN KEY (`substage_id`) REFERENCES `substage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_substage_data`
--

DROP TABLE IF EXISTS `customer_substage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_substage_data` (
  `customer_id` varchar(255) NOT NULL,
  `value` varchar(2500) DEFAULT NULL,
  `attribute_state` varchar(255) NOT NULL,
  `substage_dataset_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_data` blob,
  `possible_values` varchar(255) DEFAULT NULL,
  UNIQUE KEY `UNIQUE_CUSTOMER_SUBSTAGE_DATASET_ID` (`customer_id`,`substage_dataset_id`),
  KEY `FK_SUBSTAGE_DATASET_ID` (`substage_dataset_id`),
  CONSTRAINT `FK_SUBSTAGE_DATASET_ID` FOREIGN KEY (`substage_dataset_id`) REFERENCES `substage_dataset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_status`
--

DROP TABLE IF EXISTS `document_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_status` (
  `customer_id` varchar(255) NOT NULL,
  `document_status` varchar(255) NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27689 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_sign_document`
--

DROP TABLE IF EXISTS `e_sign_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_sign_document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) NOT NULL,
  `sign_url` varchar(255) NOT NULL,
  `document_key` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) NOT NULL,
  `is_rejected` tinyint(1) DEFAULT NULL,
  `is_signed` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_expired` tinyint(1) DEFAULT NULL,
  `sign_type` varchar(255) DEFAULT NULL,
  `signed_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `yob` varchar(255) DEFAULT NULL,
  `invitee_id` bigint NOT NULL,
  `current_document_version` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_invitee_document` (`document_id`,`invitee_id`),
  KEY `FK_E_SIGN_INVITEE_ID` (`invitee_id`),
  CONSTRAINT `FK_E_SIGN_INVITEE_ID` FOREIGN KEY (`invitee_id`) REFERENCES `e_sign_invitee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_sign_invitee`
--

DROP TABLE IF EXISTS `e_sign_invitee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_sign_invitee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email_id` (`email_id`),
  UNIQUE KEY `unique_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failure_dump`
--

DROP TABLE IF EXISTS `failure_dump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failure_dump` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `request` blob,
  `customer_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gst_seibel_state_mapping`
--

DROP TABLE IF EXISTS `gst_seibel_state_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gst_seibel_state_mapping` (
  `pincode` varchar(50) NOT NULL,
  `gst_state` varchar(50) DEFAULT NULL,
  `seibel_state` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numerical_sequence`
--

DROP TABLE IF EXISTS `numerical_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numerical_sequence` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `value` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pincode`
--

DROP TABLE IF EXISTS `pincode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pincode` (
  `pincode` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pincode_details`
--

DROP TABLE IF EXISTS `pincode_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pincode_details` (
  `pincode` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  UNIQUE KEY `unique_pincode_city_state` (`pincode`,`city`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shedlock`
--

DROP TABLE IF EXISTS `shedlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shedlock` (
  `name` varchar(64) NOT NULL,
  `lock_until` timestamp NOT NULL,
  `locked_at` timestamp NOT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smb_invoice`
--

DROP TABLE IF EXISTS `smb_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smb_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `add_billable_executed` bit(1) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `alternate_email_address` varchar(255) DEFAULT NULL,
  `b2b_contact_id` varchar(255) DEFAULT NULL,
  `ba_billing_account_id` varchar(255) DEFAULT NULL,
  `ba_order_id` varchar(255) DEFAULT NULL,
  `ba_po_number` varchar(255) DEFAULT NULL,
  `bcp_id` varchar(255) DEFAULT NULL,
  `bcp_integration_id` varchar(255) DEFAULT NULL,
  `̉bcp_number` varchar(255) DEFAULT NULL,
  `̉bcp_oraclecrmnr` varchar(255) DEFAULT NULL,
  `billing_account_number` varchar(255) DEFAULT NULL,
  `bp_billing_account_id` varchar(255) DEFAULT NULL,
  `cellular_phone` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `dcp_id` varchar(255) DEFAULT NULL,
  `dcp_integration_id` varchar(255) DEFAULT NULL,
  `dcp_number` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `fax_phone_number` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `lsi` varchar(255) DEFAULT NULL,
  `lsi_random` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `nba2_account_number` varchar(255) DEFAULT NULL,
  `nba2_id` varchar(255) DEFAULT NULL,
  `nba2_short_code` varchar(255) DEFAULT NULL,
  `nba4_account_id` varchar(255) DEFAULT NULL,
  `nba4_account_number` varchar(255) DEFAULT NULL,
  `nba_billing_account_id` varchar(255) DEFAULT NULL,
  `pan_number` varchar(255) DEFAULT NULL,
  `party_id` varchar(255) DEFAULT NULL,
  `party_integration_id` varchar(255) DEFAULT NULL,
  `party_name` varchar(255) DEFAULT NULL,
  `party_number` varchar(255) DEFAULT NULL,
  `phone_area_code` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `stage` int DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `user_phone_number` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `gst` varchar(255) DEFAULT NULL,
  `bill_franchise_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6085 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smb_invoice_transaction`
--

DROP TABLE IF EXISTS `smb_invoice_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smb_invoice_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `amount_without_gst` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `dcap_transaction_id` varchar(255) DEFAULT NULL,
  `fx417_order_id` varchar(255) DEFAULT NULL,
  `stage` int DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `payment_gateway` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substage`
--

DROP TABLE IF EXISTS `substage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `substage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `substage_name` varchar(255) NOT NULL,
  `stage_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_form_field` tinyint(1) DEFAULT NULL,
  `sequence_num` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_SUBSTAGE_STAGE_NAME` (`substage_name`,`stage_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substage_dataset`
--

DROP TABLE IF EXISTS `substage_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `substage_dataset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL,
  `possible_values` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) NOT NULL,
  `substage_id` bigint NOT NULL,
  `is_editable` bit(1) NOT NULL DEFAULT b'0',
  `is_mandatory` bit(1) NOT NULL DEFAULT b'0',
  `validation_regex` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_actionable` tinyint(1) DEFAULT NULL,
  `sequence_num` int DEFAULT NULL,
  `is_form_field` bit(1) NOT NULL DEFAULT b'1',
  `parent_id` bigint DEFAULT NULL,
  `parent_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field_name_substage_id` (`field_name`,`substage_id`),
  KEY `FK_SUBSTAGE_ID` (`substage_id`),
  CONSTRAINT `substage_dataset_ibfk_1` FOREIGN KEY (`substage_id`) REFERENCES `substage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-26 14:22:02
