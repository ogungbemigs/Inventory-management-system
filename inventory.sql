-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 23, 2022 at 05:26 PM
-- Server version: 5.7.36
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(4, 'Bill Gates', 'bill@microsoft.com', 993737, 772484884, '45, Palo Alto House, Marine Drive', 'South Carolina', 'Microsoft', 'Kurunegala', 'Active', '2018-04-30 15:14:02'),
(14, 'Steve Jobs', 'sjobs@apple.com', 333829832, 0, '1st Floor, Apple House, ', 'Las Vegas Street', 'Las Vegas', 'Monaragala', 'Disabled', '2018-05-01 12:03:10'),
(18, 'Asitha Silva', 'asitha@gmail.com', 777987654, 0, 'No. 3, Radcliff Avenue, School Lane', 'Kalutara South', 'Kalutara', 'Kalutara', 'Active', '2018-05-02 09:52:28'),
(24, 'Sunil Perera', 'Sunil@gypsies.sound', 338393932, 413837293, '67/7, Perera Villa, Jayasekara Avenue', 'Mount Lavinia', 'Ratmalana', 'Colombo', 'Active', '2018-05-02 10:48:37'),
(25, 'Theresa May', 'may34@uk.gov.com', 329393903, 777833737, '12, Downing Street', 'London', 'London', 'Matale', 'Active', '2018-05-03 02:28:07'),
(26, 'Sachin Tendulkar', 'sachintendulkar@icc.com', 444958303, 84792838, '789-4, Apartment 3, ', 'Cric Complex', 'New Delhi', 'Puttalam', 'Active', '2018-05-03 02:28:38'),
(38, 'Nuwan Perara', 'nuwan@yahoo.com', 839378202, 0, 'Nuwan Villa, Lower Street,', 'North Mulativu', 'Mullaitivu', 'Mullaitivu', 'Active', '2018-05-05 11:17:49'),
(39, 'Amal Silverton', 'amals452@yahoo.com', 232345676, 0, 'Amal\'s House, Amal\'s Street,', 'Amal Road', 'Ambalangoda', 'Galle', 'Active', '2018-05-05 13:27:06'),
(40, 'Andrew Symonds', 'symonds@cricket.au.com', 123, 0, '23, Oak View Avenue', 'Western Australia', 'Melbourne', 'Colombo', 'Disabled', '2018-05-13 01:20:23'),
(41, 'Mark Taylor', '', 111, 0, '111', '', '', 'Colombo', 'Active', '2018-05-13 01:24:54'),
(42, 'Nelson Mandela', 'sjobs@apple.com', 333829832, 0, '1st Floor, Apple House, ', 'Las Vegas Street', 'Las Vegas', 'Kalutara', 'Disabled', '2018-05-13 02:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `device_code` varchar(255) NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `branchOffice` varchar(56) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `device_type` varchar(15) NOT NULL DEFAULT '0',
  `device_ram` varchar(15) NOT NULL DEFAULT '0',
  `device_storage` varchar(15) NOT NULL,
  `os` varchar(15) NOT NULL,
  `os_status` varchar(15) NOT NULL DEFAULT '0',
  `mac_address` varchar(30) NOT NULL,
  `eset_status` varchar(15) NOT NULL,
  `ad_status` varchar(15) NOT NULL,
  `printer` varchar(50) NOT NULL,
  `scanner` varchar(50) NOT NULL,
  `imageURL` varchar(255) NOT NULL DEFAULT 'imageNotAvailable.jpg',
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`productID`),
  UNIQUE KEY `device_code` (`device_code`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`productID`, `device_code`, `staff_name`, `branchOffice`, `dept`, `device_type`, `device_ram`, `device_storage`, `os`, `os_status`, `mac_address`, `eset_status`, `ad_status`, `printer`, `scanner`, `imageURL`, `status`) VALUES
(1, 'CC01', 'ISAH, LAWAL K/SAURI', 'Head Office', 'Corporate Comms', 'Laptop', '8GB', '500GB', 'Windows 10', 'Activated', '2C-41-38-B0-02-45', 'No', 'No', 'HP LASERJET PRO MFP M180N', '', 'imageNotAvailable.jpg', 'Active'),
(2, 'CC03', 'MUSTAPHA, ABUBAKAR', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'F4-39-09-40-B0-C2', 'No', 'No', 'Hp laserjet 1320', '', 'imageNotAvailable.jpg', 'Active'),
(3, 'CC05', 'EBOH CLARA CHINYERE', 'Head Office', 'Corporate Comms', 'Desktop', '2GB', '500GB', 'Windows 7', 'Activated', 'D8-D3-85-7F-5D-03', 'No', 'No', 'HP laserjet pro M502dne', '', 'imageNotAvailable.jpg', 'Active'),
(4, 'CC06', 'UMAR, NURA SANI', 'Head Office', 'Corporate Comms', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '80-E8-2C-C8-6A-C0', 'No', 'No', 'HP LASERJET 1320', '', 'imageNotAvailable.jpg', 'Active'),
(5, 'CC07', 'ANAS RABIU', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'â€Ž8C-DC-D4-2A-78-73', 'No', 'No', 'LASER JET M402n', '', 'imageNotAvailable.jpg', 'Active'),
(6, 'CC08', 'JULIET ISAWODE', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'â€ŽC4-65-16-27-E9-41', 'Yes', 'NO', 'LASER JET M402n', '', 'imageNotAvailable.jpg', 'Active'),
(7, 'CC09', 'ABBAS, AMINU SALIHU', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'B0-5A-DA-D9-17-58', 'Yes', 'No', 'Laserjet M402n', '', 'imageNotAvailable.jpg', 'Active'),
(8, 'CC010', 'MOHAMMED, AHMED KAOJE', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'A0-8C-FD-C6-CE-E0', 'Yes', 'No', 'HP LASERJET 1320', '', 'imageNotAvailable.jpg', 'Active'),
(9, 'CC011', 'AMINU SABO', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'F4-39-09-3F-D5-57', 'Yes', 'Yes', 'LASER JET M402n', '', 'imageNotAvailable.jpg', 'Active'),
(10, 'CC012', 'GARBA, NAFISA BUWAI', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'â€Ž64-51-06-2E-1C-F7', 'No', 'No', 'LASER JET M402n', '', 'imageNotAvailable.jpg', 'Active'),
(11, 'CC013', 'ODIA ABIODUN ANDY', 'Head Office', 'Corporate Comms', 'Desktop', '8GB', '500GB', 'Windows 10', 'Activated', '80-E8-2C-CC-1D-E7', 'Yes', 'No', 'LASERJET PRO MFP M180N', '', 'imageNotAvailable.jpg', 'Active'),
(12, 'CC014', 'BELLO NASIRU MUHAMMAD', 'Head Office', 'Corporate Comms', 'Desktop', '8GB', '1TB', 'Windows 10', 'Not Activated', 'â€Ž3C-52-82-74-80-99', 'Yes', 'Yes', 'LASERJET PRO M402', '', 'imageNotAvailable.jpg', 'Active'),
(13, 'CC015', 'YUSUF FAIZA ALIYU', 'Head Office', 'Corporate Comms', 'Desktop', '8GB', '500GB', 'Windows 10', 'Not Activated', '3C-52-82-72-5C-0D', 'No', 'No', 'LASERJET PRO M402dne', '', 'imageNotAvailable.jpg', 'Active'),
(14, 'CC016', 'HALIRU SARKI, RILWANU', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-20-BB-DC', 'No', 'No', 'HP laserjet p2055', '', 'imageNotAvailable.jpg', 'Active'),
(15, 'CC017', 'OJUKWU CHINELO', 'Head Office', 'Corporate Comms', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-27-E9-19', 'No', 'No', 'LASERJET PRO M402n', '', 'imageNotAvailable.jpg', 'Active'),
(16, 'IA9', 'SALIHU, BASHARI', 'Head Office', 'Internal Audit', 'Laptop', '4GB', '500GB', 'Windows 10', 'Activated', 'â€Ž00-1F-29-51-9A-8C', 'Yes', 'No', 'LASERJET PRO M402DNE', '', 'imageNotAvailable.jpg', 'Active'),
(17, 'IA7', 'NWOKOCHA, HERBERT CHUKWUMA', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'â€ŽF4-39-09-3F-D6-F5', 'Yes', 'No', 'HP LASERJET 1320', '', 'imageNotAvailable.jpg', 'Active'),
(18, 'IA2', 'HAMISU, ABUBAKAR B', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '10-62-E5-14-2C-9A', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(19, 'IA4', 'OGBEKHIULU, PETER OMOIKE', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'F4-39-09-3F-D8-B7', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(20, 'IA3', 'SULEIMAN, DANLADI AHMADU', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '10-62-E5-13-78-68', 'Yes', 'No', 'LASERJET PRO M402DN', '', 'imageNotAvailable.jpg', 'Active'),
(21, 'IA6', 'BALOGUN O. SEIDAT FUNMI (MRS)', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 8.1', 'Activated', 'B0-83-FE-55-D1-FA', 'Yes', 'No', 'HP LASERJET 2014', '', 'imageNotAvailable.jpg', 'Active'),
(22, 'IA8', 'GABRIEL-ATTEH, RHODA MODUPE (NEE OMASAYIN)', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'â€ŽA0-48-1C-8B-96-5E', 'Yes', 'No', 'HP LASERJET P2055', '', 'imageNotAvailable.jpg', 'Active'),
(23, 'IA10', 'YINUSA OMOTAYO KEHINDE', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '10-62-E5-14-28-B1', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(24, 'IA12', 'MOHAMMED IBRAHIM ABDULKARIM', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-29-DC-F0', 'Yes', 'No', 'NO', '', 'imageNotAvailable.jpg', 'Active'),
(25, 'IA15', 'ABUBAKAR, MOHAMMED SULAIMAN', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'â€Ž10-62-E5-14-2D-82', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(26, 'IA16', 'BENEDICT JUAN UFUOMA', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'â€ŽF4-39-09-40-B7-A9', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(27, 'IA14', 'MUSA HAUWA ADAMU', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'C4-65-16-29-DC-7D', 'Yes', 'No', 'NO', '', 'imageNotAvailable.jpg', 'Active'),
(28, 'IA13', 'AJAO TILEWA KOREDE', 'Head Office', 'Internal Audit', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(29, 'IA5', 'ALIYU, ABDULKADIR FARUK', 'Head Office', 'Internal Audit', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', 'â€ŽC8-D3-FF-BA-18-F3', 'Yes', 'No', 'LASERJET PRO M402DNE', '', 'imageNotAvailable.jpg', 'Active'),
(30, 'IA1', 'LAARO, ABDULMUTALIB AGBOOLA', 'Head Office', 'Internal Audit', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '', 'Yes', 'No', 'LASERJET PRO M402N', '', 'imageNotAvailable.jpg', 'Active'),
(31, 'IA17', 'AKIBU SANUSI MAHMOUD', 'Head Office', 'Internal Audit', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '80-E8-2C-CC-1C-F6', 'Yes', 'No', 'HP LASERJET P2055', '', 'imageNotAvailable.jpg', 'Active'),
(32, '3BS8', 'ABBA ZAINAB SHEHU', 'Head Office', 'Board Secretary', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '4C-72-B9-71-F0-74', 'Yes', 'No', 'HP LASERJET PRO M402', '', 'imageNotAvailable.jpg', 'Active'),
(33, '3BS7', 'AYEGH, TERNENGE CALEB', 'Head Office', 'Board Secretary', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'â€ŽF4-39-09-40-64-5F', 'Yes', 'No', 'HP LASERJET 1320', '', 'imageNotAvailable.jpg', 'Active'),
(34, '3BS12', 'MARYAM, LUKMAN', 'Head Office', 'Board Secretary', 'Desktop', '2GB', '500GB', 'Windows 10', 'Activated', '4C-72-B9-73-03-78', 'Yes', 'No', '', '', 'imageNotAvailable.jpg', 'Active'),
(35, '3BS9', 'YANGE, GODWIN', 'Head Office', 'Board Secretary', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'B0-83-FE-55-D5-A4', 'Yes', 'No', 'HP LASERJET PRO M402', '', 'imageNotAvailable.jpg', 'Active'),
(36, 'BS01', 'AFIAGH, TERYILA MANASSEH', 'Head Office', 'Board Secretary', 'Laptop', '16GB', '500GB', 'Windows 10', 'Activated', '18-1D-EA-D6-62-27', 'Yes', 'No', 'HP COLOR LASERJET PRO MFP M283fdn', '', 'imageNotAvailable.jpg', 'Active'),
(37, 'BS02', 'BISHI, FEMI NOAH', 'Head Office', 'Board Secretary', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '48-9E-BD-75-75-87', 'No', 'No', 'LASERJET PRO 400', '', 'imageNotAvailable.jpg', 'Active'),
(38, 'BS03', 'DAHIRU, AUWALU GAMA', 'Head Office', 'Board Secretary', 'Desktop', '2GB', '500GB', 'Windows 10', 'Activated', 'E8-39-35-56-51-E6', 'No', 'No', 'HP LASERJET PRO M402n', '', 'imageNotAvailable.jpg', 'Active'),
(39, 'BS04', 'BAYERE TAIWO LYDIA', 'Head Office', 'Board Secretary', 'Desktop', '4GB', '1TB', 'Windows 11', 'Activated', '18-60-24-A6-58-E1', 'No', 'No', '', '', 'imageNotAvailable.jpg', 'Active'),
(40, 'BS05', 'ETIENAM UWE ISANGEDIGH', 'Head Office', 'Board Secretary', 'Laptop', '12 GB', '1TB', 'Windows 12', 'Activated', '5C-BA-EF-A3-12-4E', 'Yes', 'No', 'HP COLOR LASERJET PRO MFP M282nw', '', 'imageNotAvailable.jpg', 'Active'),
(41, 'BS06', 'Board Sec Corper 1', 'Head Office', 'Board Secretary', 'Laptop', '4GB', '1TB', 'Windows 13', 'Activated', '48-9E-BD-75-74-B8', 'Yes', 'No', '', '', 'imageNotAvailable.jpg', 'Active'),
(42, 'BS07', 'Board Sec Corper 2', 'Head Office', 'Board Secretary', 'Laptop', '4GB', '500GB', 'Windows 14', 'Activated', '00-68-EB-5C-2E-30', 'No', 'No', '', '', 'imageNotAvailable.jpg', 'Active'),
(43, 'BS08', 'Board Sec Corper 3', 'Head Office', 'Board Secretary', 'Laptop', '8GB', '1TB', 'Windows 15', 'Activated', '48-9E-BD-DD-66-35', 'No', 'No', '', '', 'imageNotAvailable.jpg', 'Active'),
(44, 'BS09', 'Board Sec Corper 4', 'Head Office', 'Board Secretary', 'Desktop', '4GB', '1TB', 'Windows 16', 'Activated', '9C-7B-EF-56-DF-E8', 'No', 'No', 'HP COLOR LASERJET PRO MFP M283fdn', '', 'imageNotAvailable.jpg', 'Active'),
(89, 'Fincon001', 'ABDALLAH MAMMAN ALI', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-20-E2-3D', 'YES', 'NO', 'LASERJETP5050', '', 'imageNotAvailable.jpg', 'Active'),
(90, 'Fincon002', 'ABIDOYE, SEGUN RAPHEAL', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B4-6F', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', 'Active'),
(91, 'Fincon003', 'ABUBAKAR MUAZU', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '00-00-00-00-00-00-00-0E', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', 'Active'),
(92, 'Fincon005', 'ADAMU, ABDULLAHI GIDARE', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', 'EC-0E-C4-33-22-9E', 'yes', 'no', 'laserjet pro M402dne', '', 'imageNotAvailable.jpg', ''),
(93, 'Fincon006', 'AGADA, ZAINAB', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '10-62-E5-14-30-27', 'YES', 'no', 'laserjetproM402n', '', 'imageNotAvailable.jpg', ''),
(94, 'Fincon007', 'AGUOLU, KENECHUKWU CHIZOBA', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B2-25', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(95, 'Fincon008', 'AHMAD SAAD', 'Head Office', 'FINCON', 'Desktop', '2GB', '500GB', 'Windows 7', 'Not Activated', '00-00-00-00-00-00-0E', 'YES', 'NO', 'HPLASERJETP2055', '', 'imageNotAvailable.jpg', ''),
(96, 'Fincon009', 'AUMAR ADAMU', 'Head Office', 'FINCON', 'Desktop', '2GB', '500GB', 'Windows 7', 'Activated', '10-E7-C6-44-B4-55', 'YES', 'YES', 'LJP M402ene', '', 'imageNotAvailable.jpg', ''),
(97, 'Fincon010', 'AUTA, AMINU', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-20-E4-DD', 'YES', 'NO', 'LASERJETPROM402n', '', 'imageNotAvailable.jpg', ''),
(98, 'Fincon011', 'AVONG, JAMES HANNAH', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-2A-43-A3', 'YES', 'NO', 'HLJ 1320', '', 'imageNotAvailable.jpg', ''),
(99, 'Fincon012', 'bamayi isah', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-34-6B-6F-79-B7', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(100, 'Fincon013', 'BELLO, HAMIDU', 'Head Office', 'FINCON', 'Desktop', '2GB', '320GB', 'Windows 7', 'Not Activated', '78-AC-C0-BD-65-20', 'YES', 'NO', 'LASERJETPROM402dne', '', 'imageNotAvailable.jpg', ''),
(101, 'Fincon014', 'christy j asuqua', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Not Activated', '10-E7-C6-44-B1-97', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(102, 'Fincon015', 'COOMASSIE, UMMA IBRAHIM', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '00-00-00-00-00-00-0E', 'YES', 'NO', 'HPLASERJETP2015', '', 'imageNotAvailable.jpg', ''),
(103, 'Fincon016', 'Fincon Corp Member 1', 'Head Office', 'FINCON', 'Desktop', '1GB', '250GB', 'Windows 7', 'Activated', '40-61-86-08-0C-E2', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(104, 'Fincon017', 'Fincon Corp Member 2', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-45-6E-6F', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(105, 'Fincon018', 'Fincon Corp Member 3', 'Head Office', 'FINCON', 'Desktop', '2GB', '500GB', 'Windows 7', 'Not Activated', '00-00-00-00-00-00-00-0E', 'YES', 'YES', 'HP SJ G2410', '', 'imageNotAvailable.jpg', ''),
(106, 'Fincon019', 'Fincon Corp Member 4', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-2B-8B-7B', 'YES', 'NO', 'HP SJE FLOW 7000s3', '', 'imageNotAvailable.jpg', ''),
(107, 'Fincon020', 'Fincon Corp Member 5', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', '84-A9-3E-72-4C-0C', 'YES', 'NO', 'SJE FLOW N7000 SNW 1', '', 'imageNotAvailable.jpg', ''),
(108, 'Fincon021', 'Fincon Corp Member 6', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', '', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(109, 'Fincon022', 'Fincon Corp Member 7', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B5-3E', 'yes', 'yes', 'n/a', '', 'imageNotAvailable.jpg', ''),
(110, 'Fincon023', 'DANLADI GARBA', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '00-68-EB-AF-A1-14', 'YES', 'NO', 'LJP 400 M401d', '', 'imageNotAvailable.jpg', ''),
(111, 'Fincon024', 'EDOSOMWAN DAISY', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '40-B0-34-3B-FE-E1', 'YES', 'NO', 'LJP M402n', '', 'imageNotAvailable.jpg', ''),
(112, 'Fincon025', 'EGUAMON, FESTUS EDUKPE', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C7-2F-D0', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(113, 'Fincon026', 'FESTUS EGUAOMON', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C7-2F-D0', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(114, 'Fincon027', 'GIDEON, MSONTER MOSES', 'Head Office', 'FINCON', 'Desktop', '2GB', '250GB', 'Windows 7', 'Not Activated', '00-00-00-00-00-00-0E', 'YES', 'NO', 'laserjet proP2055d', '', 'imageNotAvailable.jpg', ''),
(115, 'Fincon028', 'GONO LANRE REBECA', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-13-7F-D5', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(116, 'Fincon029', 'HAFSATU JOSHUA', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'A0-4A-1C-95-66-40', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(117, 'Fincon030', 'HANA AVONG', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-2A-43-A3', 'YES', 'NO', 'JJP M402n', '', 'imageNotAvailable.jpg', ''),
(118, 'Fincon031', 'HARUNA USMAN', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-27-F1-ED', 'YES', 'YES', '', '', 'imageNotAvailable.jpg', ''),
(119, 'Fincon032', 'HARUNA USMAN', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-27-F1-ED', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(120, 'Fincon033', 'IBRAHIM MAIMUNA KASSIM', 'Head Office', 'FINCON', 'Desktop', '6GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B5-3E', 'YES', 'NO', 'laserjetpro P2050', '', 'imageNotAvailable.jpg', ''),
(121, 'Fincon034', 'IKPAAHINDI AONDOVER', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'F4-30-09-2A-A1-25', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(122, 'Fincon035', 'ISAAC GONO, REBECCA NANRE', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-13-7F-D5', 'YES', 'NO', 'LJP M402NE', '', 'imageNotAvailable.jpg', ''),
(123, 'Fincon036', 'ISAH, SHAIBU ZAKARI', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 11', 'Activated', '84-A9-3E-85-F5-07', 'YES', 'NO', 'LJP MFP M183FW', '', 'imageNotAvailable.jpg', ''),
(124, 'Fincon037', 'ISSA SHUAIBU', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', '84-A9-3E-85-F5-07', 'NO', 'NO', 'COL. LAS.PRO M283 FDW', '', 'imageNotAvailable.jpg', ''),
(125, 'Fincon038', 'JAFAR YAKUBU', 'Head Office', 'FINCON', 'Desktop', '3GB', '500GB', 'Windows 10', 'Activated', 'A0-D3-C1-0D-43C8', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(126, 'Fincon039', 'JAFARU, YAKUBU', 'Head Office', 'FINCON', 'Desktop', '3GB', '500GB', 'Windows 10', 'Activated', 'A0-D3-C1-0D-43-C8', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(127, 'Fincon040', 'JEMIDE WEYINMI', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '3C-52-82-62-A2-CA', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(128, 'Fincon041', 'JOSEPH, ASUQUO CHRISTY (MRS)', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', ': 10-E7-C6-44-B1-97', 'YES', 'NO', 'LPJ M402N', '', 'imageNotAvailable.jpg', ''),
(129, 'Fincon042', 'JOSHUA, HANSATU ODAZIRI', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'A0-48-1C-95-66-40', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(130, 'Fincon043', 'JUSTINA OKOLI', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '70-5A-0F-3C-6C-94', 'YES', 'NO', 'HP SJP 2500 FI', '', 'imageNotAvailable.jpg', ''),
(131, 'Fincon044', 'KABIRU BAMAIYI ISAH', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 7', 'Activated', 'C4-34-6B-6F-79-B7', 'YES', 'NO', 'LJP2015', '', 'imageNotAvailable.jpg', ''),
(132, 'Fincon045', 'KELECHUKU AGUOLO', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B2-25', 'YES', 'YES', '', '', 'imageNotAvailable.jpg', ''),
(133, 'Fincon046', 'LASHEN, YUSUF DANIEL', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', 'EC-0E-C4-0F-69-83', 'yes', 'no', 'HPLASERJETP2015', '', 'imageNotAvailable.jpg', ''),
(134, 'Fincon047', 'MAIMINA IBRAHIM', 'Head Office', 'FINCON', 'Desktop', '2GB', '320GB', 'Windows 7', 'Not Activated', '00-00-00-00-00-0E', 'YES', 'NO', 'N/A', '', 'imageNotAvailable.jpg', ''),
(135, 'Fincon048', 'NASIRU KADO', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', 'C4-65-16-27-E9-0F', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(136, 'Fincon049', 'NOR, MSENDOO MERCY', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '00-00-00-00-00-00-0E', 'YES', 'NO', 'LASERJETPRO402dn', '', 'imageNotAvailable.jpg', ''),
(137, 'Fincon050', 'NUBI OLUWATOSIN MERCY', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Not Activated', '3C-52-82-6A-9E-59', 'yes', 'NO', 'N/A', '', 'imageNotAvailable.jpg', ''),
(138, 'Fincon052', 'OKOLI, JUSTINA CHUKS', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '70-5A-0F-3C-6C-94', 'YES', 'NO', 'LPJ M402N', '', 'imageNotAvailable.jpg', ''),
(139, 'Fincon053', 'SHEGUN ABIDOYE', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Not Activated', '10-E7-C6-44-B4-6F', 'NO', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(140, 'Fincon054', 'SIAKA HALIMAT TAIYE', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', 'C8-D9-D2-23-00-5E', 'yes', 'no', 'LASERJETPRO402dn', '', 'imageNotAvailable.jpg', ''),
(141, 'Fincon055', 'SULEIMAN, AMINU YABAGI', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '18-60-24-9D-94-C4', 'YES', 'NO', 'N/A', '', 'imageNotAvailable.jpg', ''),
(142, 'Fincon056', 'SWEM NGO SCHOLATICS', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-29-DC-F6', 'YES', 'NO', 'N/A', '', 'imageNotAvailable.jpg', ''),
(143, 'Fincon057', 'TAIWO OSENI', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C7-2F-66', 'NO', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(144, 'Fincon058', 'TAIWO OSENI', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C7-2F-66', 'YES', 'NO', 'LJP 402N', '', 'imageNotAvailable.jpg', ''),
(145, 'Fincon059', 'TAJUDEEN SHAMSUDEEN', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C6-CE-76', 'YES', 'NO', 'LPJ M402N', '', 'imageNotAvailable.jpg', ''),
(146, 'Fincon060', 'UCHENDU IJEOMAEUPHEMIA (NEE EZE EUPHEMIA)', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 8', 'Activated', '00-00-00-00-00-00-0E', 'YES', 'no', 'N/A', '', 'imageNotAvailable.jpg', ''),
(147, 'Fincon061', 'UMAR ADAMU', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B4-55', 'YES', 'NO', 'LJP M402 DNE', '', 'imageNotAvailable.jpg', ''),
(148, 'Fincon062', 'UMAR ADAMU', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', '10-E7-C6-44-B4-55', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(149, 'Fincon063', 'USMAN, WAKIL', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C6-75-B3', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(150, 'Fincon064', 'WAKIL USMAN', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C6-75-B3', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', ''),
(151, 'Fincon065', 'ZUBAIR OYIZA AISHA', 'Head Office', 'FINCON', 'Desktop', '4GB', '320GB', 'Windows 10', 'Not Activated', '2C-44-FD-35-B6-66', 'NO', 'N0', 'LJP M042DNE', '', 'imageNotAvailable.jpg', ''),
(152, 'Fincon066', 'ZUBAIRU, OYIZA AISHA', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', '2C-44-FD-35-B6-66', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(153, 'Fincon067', 'NASIRU KADO', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-27-E9-0F', 'YES', 'NO', 'LJP 402N', '', 'imageNotAvailable.jpg', ''),
(154, 'Fincon068', 'NWOKEDI LAWRETTA OBIAGELI', 'Head Office', 'FINCON', 'Desktop', '2GB', '500GB', 'Windows 10', 'Activated', '80-C1-6E-F5-40-4A', 'YES', 'NO', 'LJP M402N', '', 'imageNotAvailable.jpg', ''),
(155, 'Fincon069', 'OKOLO, VINCENT', 'Head Office', 'FINCON', 'Desktop', '4GB', '500GB', 'Windows 10', 'Activated', 'A0-8C-FD-C2-FB-FF', 'YES', 'NO', 'LJP 402N', '', 'imageNotAvailable.jpg', ''),
(156, 'Fincon070', 'UPAH BENSON JUNIOR', 'Head Office', 'FINCON', 'Desktop', '4GB', '1TB', 'Windows 10', 'Activated', 'C4-65-16-1B-81-9E', 'YES', 'NO', 'LASERJETPROM402dne', '', 'imageNotAvailable.jpg', ''),
(157, 'Fincon071', 'SALIHU, MUHAMMAD ABDULLAHI', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '60-0E-C4-33-21-5E', 'YES', 'NO', 'LASERJETPROM402', '', 'imageNotAvailable.jpg', ''),
(158, 'Fincon072', 'GARBA, DANLADI', 'Head Office', 'FINCON', 'Desktop', '2GB', '500GB', 'Windows 7', 'Activated', '64-51-06-47-4F-B8', 'YES', 'NO', 'LJP 400 M401D', '', 'imageNotAvailable.jpg', ''),
(159, 'Fincon073', 'SHAAHU MAUREEN J', 'Head Office', 'FINCON', 'Desktop', '8GB', '1TB', 'Windows 10', 'Activated', '00-00-00-00-00-00-0E', 'YES', 'YES', 'LASERJETPROM402DNE', '', 'imageNotAvailable.jpg', ''),
(160, 'Fincon074', 'NASIRU KADO', 'Head Office', 'FINCON', 'Laptop', '8GB', '1TB', 'Windows 10', 'Activated', '28-7F-CF-87-4D-7C', 'YES', 'NO', '', '', 'imageNotAvailable.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `Uid` int(11) NOT NULL,
  UNIQUE KEY `Uid` (`Uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchaseID` int(11) NOT NULL AUTO_INCREMENT,
  `itemNumber` varchar(255) NOT NULL,
  `purchaseDate` date NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `unitPrice` float NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `vendorName` varchar(255) NOT NULL DEFAULT 'Test Vendor',
  `vendorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`purchaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseID`, `itemNumber`, `purchaseDate`, `itemName`, `unitPrice`, `quantity`, `vendorName`, `vendorID`) VALUES
(39, '1', '2018-05-24', 'First Bag', 1600, 10, 'Johnson and Johnsons Co.', 3),
(40, '2', '2018-05-18', 'School Bag', 2341, 2, 'Louise Vitton Bag', 4),
(41, '4', '2018-05-07', 'Leather Bag', 1234, 3, 'Johnson and Johnsons Co.', 3),
(42, '1', '2018-05-24', 'First Bag', 345, 12, 'Louise Vitton Bag', 4),
(43, '5', '2018-05-03', 'Travel Bag', 35, 3, 'Johnson and Johnsons Co.', 3),
(44, '5', '2018-05-16', 'Travel Bag', 3000, 2, 'ABC Company', 1),
(45, '5', '2018-05-21', 'Travel Bag', 3000, 10, 'Sample Vendor 222', 2),
(46, '4', '2018-05-19', 'Leather Bag', 1200, 4, 'Johnson and Johnsons Co.', 3),
(47, '2', '2018-05-10', 'School Bag', 2, 1, 'Sample Vendor 222', 2),
(48, '1', '2018-05-12', 'Handbag', 2, 9, 'ABC Company', 1),
(50, '14', '2018-05-15', 'Hiking Bag', 1000, 5, 'Louise Vitton Bag', 4),
(51, '11', '2018-05-11', 'First Aid Bag', 1121, 1, 'ABC Company', 1),
(52, '1', '2018-05-21', 'First Bag', 1235, 2, 'Sample Vendor 222', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `saleID` int(11) NOT NULL AUTO_INCREMENT,
  `itemNumber` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `saleDate` date NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unitPrice` float(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`saleID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`saleID`, `itemNumber`, `customerID`, `customerName`, `itemName`, `saleDate`, `discount`, `quantity`, `unitPrice`) VALUES
(1, '3', 4, 'Bill Gates', 'Office Bag', '2018-05-24', 5, 2, 1300),
(2, '1', 39, 'Amal Silverton', 'First Bag', '2018-05-24', 0, 111, 1500),
(3, '4', 18, 'Asitha Silva', 'Leather Bag', '2018-05-24', 2, 1, 3409),
(4, '5', 25, 'Theresa May', 'Travel Bag', '2018-05-24', 2, 1, 1200),
(5, '6', 24, 'Sunil Perera', 'Gym Bag', '2018-05-24', 0, 1, 3000),
(6, '7', 14, 'Steve Jobs', 'Handbag', '2018-05-24', 1.5, 1, 1650),
(7, '3', 4, 'Bill Gates', 'Office Bag', '2018-05-24', 0, 3, 1300),
(8, '8', 4, 'Bill Gates', 'Laptop Bag', '2018-05-14', 2.1, 1, 2300),
(9, '6', 26, 'Sachin Tendulkar', 'Gym Bag', '2018-05-14', 0, 1, 3000),
(10, '5', 25, 'Theresa May', 'Travel Bag', '2018-05-14', 2, 9, 1200),
(11, '10', 26, 'Sachin Tendulkar', 'Sports Bag', '2018-04-05', 1, 7, 1000),
(12, '1', 14, 'Steve Jobs', 'First Bag', '2018-05-14', 0, 2, 1500),
(13, '3', 38, 'Nuwan Perara', 'Office Bag', '2018-05-24', 0, 0, 1300),
(14, '10', 39, 'Amal Silverton', 'Sports Bag', '2018-05-17', 1, 1, 1000),
(15, '14', 38, 'Nuwan Perara', 'Hiking Bag', '2018-05-24', 1.5, 1, 1200),
(16, '1', 14, 'Steve Jobs', 'First Bag', '2018-05-24', 10, 1, 1500),
(17, '4', 14, 'Steve Jobs', 'Leather Bag', '2018-05-18', 2, 1, 3409);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `password`, `status`) VALUES
(5, 'Guest', 'guest', '81dc9bdb52d04dc20036dbd8313ed055', 'Active'),
(6, 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', 'Active'),
(7, 'Super Admin', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `vendorID` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vendorID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendorID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(1, 'ABC Company', '', 2343567, 0, '80, Ground Floor, ABC Shopping Complex', '46th Avenue', 'Kolpetty', 'Colombo', 'Active', '2018-05-05 05:48:44'),
(2, 'Sample Vendor 222', 'sample@volvo.com', 99828282, 283730183, '123, A Road, B avenue', 'Pitipana', 'Nugegoda', 'Mannar', 'Disabled', '2018-05-05 06:12:02'),
(3, 'Johnson and Johnsons Co.', '', 32323, 0, '34, Malwatta Road, Kottawa', 'Pannipitiya', 'Maharagama', 'Colombo', 'Active', '2018-05-05 06:28:33'),
(4, 'Louise Vitton Bag', 'vitton@vitton.usa.com', 323234938, 0, '45, Palmer Valley, 5th Crossing', 'Delaware', 'Palo Alto', 'Batticaloa', 'Active', '2018-05-05 06:29:41'),
(6, 'Test Vendor', 'test@vendor.com', 43434, 47569937, 'Test address', 'Test address 2', 'Test City', 'Trincomalee', 'Active', '2018-05-05 06:53:14'),
(7, 'Bags Co. Exporters Ltd.', '', 1111, 0, 'Sea Road, Bambalapitiya', '', '', 'Colombo', 'Active', '2018-05-15 10:36:54'),
(8, 'New Bags Exporters', '', 191938930, 0, '123, A Road, B avenue, ', 'Gilford Crescent', 'Colpetty', 'Colombo', 'Active', '2018-05-16 12:36:53'),
(9, 'A', 'a@gmail.com', 999995, 98866767, 'manila', 'Metro Manila', 'Manila City', 'Ampara', 'Active', '2020-07-30 11:40:25');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
