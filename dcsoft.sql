-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2015 at 06:30 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `icsitpar_dcsoft`
--

-- --------------------------------------------------------

--
-- Table structure for table `billno`
--

CREATE TABLE IF NOT EXISTS `billno` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bill` int(11) NOT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customermaster`
--

CREATE TABLE IF NOT EXISTS `customermaster` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cName` int(11) DEFAULT NULL,
  `cCompany` int(11) DEFAULT NULL,
  `cAddress` int(11) DEFAULT NULL,
  `cType` int(11) DEFAULT NULL,
  `cDesc` int(11) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dcreport`
--

CREATE TABLE IF NOT EXISTS `dcreport` (
  `did` int(10) NOT NULL AUTO_INCREMENT,
  `customer` varchar(150) NOT NULL,
  `company` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `billNo.` int(10) unsigned zerofill NOT NULL,
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
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`uid`, `username`, `password`, `personName`, `company`, `companyType`, `accountType`, `introduction`, `logo`, `email`, `phone`, `address`, `secretQuestion`, `secretAnswer`) VALUES
(1, 'giriy', 'admin', 'Giriy Poshaneeshwar', 'icsitpark', 'software', '', 'we are the leading web designing and development c', 'icsitpar', 'info@icsitpark.com', '7893585898', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
