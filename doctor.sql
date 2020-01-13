-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2020 at 09:37 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teriaq_node`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DocID` int(11) NOT NULL,
  `DocUsername` varchar(255) NOT NULL,
  `DocPassword` varchar(255) NOT NULL,
  `DocEmail` varchar(255) NOT NULL,
  `DocPhone` bigint(15) NOT NULL,
  `DocAddress` varchar(255) NOT NULL,
  `DocIDCard` int(20) NOT NULL,
  `DocFullName` text NOT NULL,
  `admin` int(1) NOT NULL DEFAULT '0',
  `Your_specialty_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DocID`, `DocUsername`, `DocPassword`, `DocEmail`, `DocPhone`, `DocAddress`, `DocIDCard`, `DocFullName`, `admin`, `Your_specialty_id`) VALUES
(3, 'mohamed admin ', 'df7e15c040a258e6a4b5cb87c4f8af5572c69ecd', 'mohamedhassan@yahoo.com', 1121550600, '6 october city', 651265, 'mohamed hassan fathi ismail ', 1, 8),
(5, 'fofar', 'dfbfdldfbdfbdf6185156dfb', 'fofoa@yahoo.com', 1125452155, '17 october city', 5561555, 'fofa omar', 0, 8),
(6, 'hossam hassan', '601f1889667efaebb33b8c12572835da3f027f78', 'hossamhassan778@yahoo.com', 112635547, '6-October area.8 st.14', 15665777, 'hossam hassan fathi ismail', 0, 2),
(7, 'mohy', '601f1889667efaebb33b8c12572835da3f027f78', 'mohyhassan490@yahoo.com', 1125699636, 'october', 166851465, 'mohy hassan fathi ismail', 0, 4),
(18, 'mahomud', 'fdgbfdb', 'badr@yahoo.com', 1125552155, '18 october city', 55655555, 'mahomud badr ', 0, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DocID`),
  ADD UNIQUE KEY `DocUsername` (`DocUsername`),
  ADD UNIQUE KEY `DocIDCard` (`DocIDCard`),
  ADD KEY `Your_specialty_id` (`Your_specialty_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DocID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `your_specialty` FOREIGN KEY (`Your_specialty_id`) REFERENCES `specialty` (`id_specialty`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
