-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2015 at 06:07 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `appBuild`
--

-- --------------------------------------------------------

--
-- Table structure for table `billno`
--

CREATE TABLE IF NOT EXISTS `billno` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bill` int(11) NOT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `user_account` (`user_account`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `billno`
--

INSERT INTO `billno` (`bid`, `bill`, `user_account`) VALUES
(1, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customermaster`
--

CREATE TABLE IF NOT EXISTS `customermaster` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `company` varchar(11) DEFAULT NULL,
  `tin` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(75) NOT NULL,
  `address` varchar(11) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `desc` text,
  `user_account` varchar(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `customermaster`
--

INSERT INTO `customermaster` (`cid`, `name`, `company`, `tin`, `phone`, `email`, `address`, `type`, `desc`, `user_account`) VALUES
(1, 'Hanuman', 'Himalaya', '', '', '', 'Kashmir', 'Support', 'Helps in supproting when needed.', 'admin'),
(2, 'giriy', 'techvedika', '', '', '', 'madhapur', 'software', 'we develop mobile application.', 'giriy'),
(3, 'giriy', 'techvedika', '', '', '', 'madhapur', 'software', 'development company', ''),
(4, 'Raghu', 'ICat', '', '', '', 'gachibowli', 'Software', 'Development company', 'giriy'),
(5, 'Ashok', 'Map Doc', '', '', '', 'Madhapur', 'Stad Design', 'Cad Development', 'giriy'),
(6, 'Eshwar', 'red ray', '', '', '', 'Kondapur', 'Gaming Deve', 'Gaming Development', 'giriy'),
(7, 'asdf', 'asfd', '', '', '', 'asdf', 'asdf', 'asdf', 'giriy'),
(8, 'Mano', 'Google', '', '', '', 'Madaram', 'software co', 'multi products', 'giriy'),
(9, 'sdf', 'sdf', '', '', '', 'asdf', 'sadf', 'asdf', 'giriy'),
(10, 'Aziz', 'Al-Aqmar Hy', '', '', '', 'ranigunj', 'TRADING & A', NULL, 'giriy'),
(11, 'ahmed', 'indotech', '', '', '', 'ranijung', 'Sales & Ser', 'serveice sector', 'giriy'),
(12, 'ahmed', 'indotech', '888777878', '878787865', 'indotech06@gmail.com', 'secunderaba', 'sales & ser', 'computer sales and service', 'giriy'),
(13, 'ahmed', 'indotech', '888777878', '878787865', 'indotech06@gmail.com', 'secunderaba', 'sales & ser', 'computer sales and service', 'giriy'),
(14, 'ahmed', 'indotech', '888777878', '878787865', 'indotech06@gmail.com', 'secunderaba', 'sales & ser', 'computer sales and service', 'giriy'),
(15, 'ahmed', 'indotech', '234324234324', '88888977', 'indotech@gmail.com', 'secunderaba', 'sales', 'lsadkjflsjfd', 'giriy'),
(16, 'ahmed', 'indotech', '234324234324', '88888977', 'indotech@gmail.com', 'secunderaba', 'sales', 'lsadkjflsjfd', 'giriy'),
(27, 'adsfdasf', 'asfd', '23243324', '213234', 'adf', 'adfsadf', 'sadf', 'adfs', 'giriy'),
(28, 'Ahmed', 'indotech', '8876889797979779', '998977787877', 'indotech@gmail.com', 'secunderaba', 'sales & ser', 'computer sales and service', 'giriy'),
(29, 'ahmed', 'indotech te', '729923749273', '797979798', 'indotech@gmail.com', 'secunderaba', 'sales and s', 'cmputer sales and services', 'giriy');

-- --------------------------------------------------------

--
-- Table structure for table `dcreport`
--

CREATE TABLE IF NOT EXISTS `dcreport` (
  `did` int(10) NOT NULL AUTO_INCREMENT,
  `customer` varchar(150) NOT NULL,
  `company` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `billno` int(10) unsigned zerofill NOT NULL,
  `billDate` varchar(20) NOT NULL,
  `dcItemList` text NOT NULL,
  `grandTotal` text NOT NULL,
  `discount` text NOT NULL,
  `vat` text NOT NULL,
  `totalAmount` text NOT NULL,
  `deliveryAddress` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `user_account` (`user_account`),
  KEY `user_account_2` (`user_account`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `dcreport`
--

INSERT INTO `dcreport` (`did`, `customer`, `company`, `address`, `billno`, `billDate`, `dcItemList`, `grandTotal`, `discount`, `vat`, `totalAmount`, `deliveryAddress`, `active`, `createdOn`, `user_account`) VALUES
(1, 'gy', '', '', 0000000000, '17-08-2015', '"[{\\"name\\":\\"r1\\",\\"rate\\":\\"12\\",\\"qty\\":\\"12\\",\\"setVatRow\\":\\"5\\",\\"amt\\":151.2}]"', '172.368', '', '', '172.368', '', 1, '2015-08-17 09:14:46', 1),
(3, 'ahmed', '', '', 0000000000, '17-08-2015', '"[{\\"name\\":\\"ram\\",\\"rate\\":\\"1800\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":15120},{\\"name\\":\\"keyboard\\",\\"rate\\":\\"350\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":2940},{\\"name\\":\\"mouse\\",\\"rate\\":\\"250\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":2100},{\\"name\\":\\"speaker\\",\\"rate\\":\\"1100\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":9240},{\\"name\\":\\"printer\\",\\"rate\\":\\"6500\\",\\"qty\\":\\"1\\",\\"setVatRow\\":\\"8\\",\\"amt\\":7020},{\\"name\\":\\"led monitor\\",\\"rate\\":\\"8500\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":71400}]"', '122914.8', '', '', '122914.8', '', 1, '2015-08-17 09:21:02', 1),
(4, 'ahmed', '', '', 0000000000, '17-08-2015', '"[{\\"name\\":\\"ram\\",\\"rate\\":\\"1800\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":15120},{\\"name\\":\\"keyboard\\",\\"rate\\":\\"350\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":2940},{\\"name\\":\\"mouse\\",\\"rate\\":\\"250\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":2100},{\\"name\\":\\"speaker\\",\\"rate\\":\\"1100\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":9240},{\\"name\\":\\"printer\\",\\"rate\\":\\"6500\\",\\"qty\\":\\"1\\",\\"setVatRow\\":\\"8\\",\\"amt\\":7020},{\\"name\\":\\"led monitor\\",\\"rate\\":\\"8500\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":71400},{\\"name\\":\\"motherboard\\",\\"rate\\":\\"3500\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":29400},{\\"name\\":\\"cabinet\\",\\"rate\\":\\"900\\",\\"qty\\":\\"8\\",\\"setVatRow\\":\\"5\\",\\"amt\\":7560}]"', '165049.2', '', '', '165049.2', '', 1, '2015-08-17 09:21:40', 1),
(5, 'giriposhaneshwar', '', '', 0000000000, '17-08-2015', '"[{\\"name\\":\\"grapes\\",\\"rate\\":\\"45\\",\\"qty\\":\\"25\\",\\"setVatRow\\":\\"5\\",\\"amt\\":1181.25},{\\"name\\":\\"apples\\",\\"rate\\":\\"10\\",\\"qty\\":\\"200\\",\\"setVatRow\\":\\"5\\",\\"amt\\":2100}]"', '3740.625', '', '', '3740.625', '', 1, '2015-08-17 09:30:51', 1),
(6, 'gy', '', '', 0000000000, '17-08-2015', '"[{\\"name\\":\\"r1\\",\\"rate\\":\\"12\\",\\"qty\\":\\"12\\",\\"setVatRow\\":\\"5\\",\\"amt\\":151.2}]"', '172.368', '', '', '172.368', '', 1, '2015-08-19 06:15:24', 1),
(7, 'ff', '', '', 0000000000, '12-11-2015', '"[{\\"name\\":\\"hdd\\",\\"rate\\":\\"5000\\",\\"qty\\":\\"5\\",\\"setVatRow\\":0,\\"amt\\":25000}]"', '25000', '', '', '25000', '', 1, '2015-11-12 07:32:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `itemmaster`
--

CREATE TABLE IF NOT EXISTS `itemmaster` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `iName` varchar(50) DEFAULT NULL,
  `iType` varchar(50) DEFAULT NULL,
  `iCode` int(11) DEFAULT NULL,
  `iPrice` int(11) DEFAULT NULL,
  `iQty` int(11) DEFAULT NULL,
  `iDesc` text,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `itemmaster`
--

INSERT INTO `itemmaster` (`iid`, `iName`, `iType`, `iCode`, `iPrice`, `iQty`, `iDesc`, `user_account`) VALUES
(1, 'nuts and bolts', 'metal', 1, 150, NULL, 'nuts and bolts comes under metals.', 1),
(2, 'sewing machine', 'machine', 150, 25000, 50, 'Sewing machine used to sew the lether for ceat makings.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE IF NOT EXISTS `user_accounts` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `personName` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `companyType` varchar(50) NOT NULL,
  `accountType` varchar(50) NOT NULL,
  `introduction` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `secretQuestion` varchar(255) NOT NULL,
  `secretAnswer` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`uid`, `username`, `password`, `personName`, `company`, `companyType`, `accountType`, `introduction`, `logo`, `email`, `phone`, `address`, `secretQuestion`, `secretAnswer`) VALUES
(1, 'giriy', 'admin', 'Giriy Poshaneeshwar', 'icsitpark', 'software', 'admin', 'we are the leading web designing and development c', 'icsitpar', 'info@icsitpark.com', '7893585898', '', '', ''),
(2, 'ahmed', 'ahmed', 'Taj Ahmed', 'indotech', 'sales & service', '', '', '', '', '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billno`
--
ALTER TABLE `billno`
  ADD CONSTRAINT `billno_ibfk_1` FOREIGN KEY (`user_account`) REFERENCES `user_accounts` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dcreport`
--
ALTER TABLE `dcreport`
  ADD CONSTRAINT `dcreport_ibfk_1` FOREIGN KEY (`user_account`) REFERENCES `user_accounts` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
