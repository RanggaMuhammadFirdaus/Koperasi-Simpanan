-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 06:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpanan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Level` enum('admin','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `email`, `password`, `Level`) VALUES
(1, 'rangga@gmail.com', 'rangga', 'admin'),
(2, 'niko@gmail.com', 'niko', 'admin'),
(3, 'fransiska@gmail.com', 'fransiska', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `NIK` varchar(16) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `TTL` date NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Agama` varchar(50) NOT NULL,
  `No_HP` varchar(12) NOT NULL,
  `Foto_KTP` varchar(50) NOT NULL,
  `status` enum('member') NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`NIK`, `Nama`, `TTL`, `Alamat`, `Agama`, `No_HP`, `Foto_KTP`, `status`, `id_admin`) VALUES
('3204322403030008', 'Farid Nur  Arif', '2003-03-24', 'Pameungpek', 'Islam', '085794201959', 'Logo Produk.jpeg', 'member', 1),
('3204390104050001', 'Dicky', '2002-02-22', 'Pasirawi', 'Islam', '088881235', 'Screenshot_20230121_034130.png', 'member', 1),
('3204390104050005', 'Diki Dermawan', '2002-02-22', 'Kuningan', 'Islam', '08512493', 'Screenshot (7).png', 'member', 1),
('3204390105990001', 'Haykal', '2000-12-05', 'UjungBerung', 'Islam', '088802250660', 'login.jpg', 'member', 3),
('3204390123', 'Rieckhan Meifa Putra', '2003-02-20', 'Cibiru', 'Islam', '0851553312', 'admin.jpg', 'member', 1),
('3204390401810001', 'Muhammad Fakhrijal Pratama', '2001-05-15', 'Katapang', 'Islam', '08881029301', 'admin.jpg', 'member', 2),
('3204390401810002', 'Roni', '2023-01-27', 'Nenon', 'Islam', '088102250660', 'Screenshot_20230121_030417.png', 'member', 2),
('3204390522020001', 'Rangga Muhammad Firdaus', '2002-05-22', 'Ciwidey', 'Islam', '085155226831', 'Screenshot_20230121_033843.png', 'member', 1);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `tipe_transaksi` enum('Penarikan','Penambahan') NOT NULL,
  `nominal` int(16) NOT NULL,
  `tgl_transaksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `NIK`, `tipe_transaksi`, `nominal`, `tgl_transaksi`) VALUES
(37, '3204322403030008', 'Penambahan', 500000, '2023-01-27'),
(38, '3204322403030008', 'Penarikan', 150000, '2023-01-27'),
(39, '3204322403030008', 'Penarikan', 50000, '2023-01-27'),
(40, '3204322403030008', 'Penarikan', 15000, '2023-01-27'),
(41, '3204322403030008', 'Penarikan', 5000000, '2023-01-27'),
(42, '3204322403030008', 'Penarikan', 50000000, '2023-01-27'),
(43, '3204322403030008', 'Penarikan', 5000, '2023-01-27'),
(44, '3204390104050001', 'Penambahan', 100000, '2023-01-27'),
(45, '3204390104050001', 'Penarikan', 50000, '2023-01-27'),
(46, '3204390104050001', 'Penambahan', 100000, '2023-01-27'),
(54, '3204322403030008', 'Penarikan', 100000, '2023-01-28');

-- --------------------------------------------------------

--
-- Table structure for table `penambahan`
--

CREATE TABLE `penambahan` (
  `id_penambahan` int(11) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `tanggal_penambahan` varchar(20) NOT NULL,
  `nominal_penambahan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penambahan`
--

INSERT INTO `penambahan` (`id_penambahan`, `NIK`, `tanggal_penambahan`, `nominal_penambahan`) VALUES
(23, '3204322403030008', '2023-01-27', '500000'),
(24, '3204322403030008', '2023-01-27', '500000'),
(25, '3204390104050001', '2023-01-27', '100000'),
(26, '3204390104050001', '2023-01-27', '100000');

--
-- Triggers `penambahan`
--
DELIMITER $$
CREATE TRIGGER `Tambahsaldo` AFTER INSERT ON `penambahan` FOR EACH ROW BEGIN
UPDATE simpanan set Nominal=Nominal+NEW.nominal_penambahan
where NIK =NEW.NIK;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penarikan`
--

CREATE TABLE `penarikan` (
  `id_penarikan` int(11) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `tanggal_penarikan` varchar(20) NOT NULL,
  `nominal_penarikan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penarikan`
--

INSERT INTO `penarikan` (`id_penarikan`, `NIK`, `tanggal_penarikan`, `nominal_penarikan`) VALUES
(25, '3204322403030008', '2023-01-27', '150000'),
(26, '3204322403030008', '2023-01-27', '50000'),
(27, '3204322403030008', '2023-01-27', '15000'),
(28, '3204322403030008', '2023-01-27', '5000000'),
(29, '3204322403030008', '2023-01-27', '50000000'),
(30, '3204322403030008', '2023-01-27', '5000'),
(31, '3204390104050001', '2023-01-27', '50000'),
(37, '3204322403030008', '2023-01-28', '100000');

--
-- Triggers `penarikan`
--
DELIMITER $$
CREATE TRIGGER `Tariksaldo` AFTER INSERT ON `penarikan` FOR EACH ROW BEGIN
UPDATE simpanan SET Nominal=Nominal-NEW.nominal_penarikan
WHERE NIK=NEW.NIK;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE `simpanan` (
  `id_simpanan` int(11) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `Tanggal` date NOT NULL,
  `Nominal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `simpanan`
--

INSERT INTO `simpanan` (`id_simpanan`, `NIK`, `Tanggal`, `Nominal`) VALUES
(29, '3204322403030008', '2023-01-27', 895000),
(30, '3204390104050001', '2023-01-27', 250000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`NIK`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `NIK``` (`NIK`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `penambahan`
--
ALTER TABLE `penambahan`
  ADD PRIMARY KEY (`id_penambahan`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD PRIMARY KEY (`id_penarikan`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`id_simpanan`),
  ADD KEY `NIK` (`NIK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `penambahan`
--
ALTER TABLE `penambahan`
  MODIFY `id_penambahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `penarikan`
--
ALTER TABLE `penarikan`
  MODIFY `id_penarikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `simpanan`
--
ALTER TABLE `simpanan`
  MODIFY `id_simpanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `anggota` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`NIK`) REFERENCES `anggota` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penambahan`
--
ALTER TABLE `penambahan`
  ADD CONSTRAINT `penambahan_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `anggota` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penarikan`
--
ALTER TABLE `penarikan`
  ADD CONSTRAINT `penarikan_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `anggota` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `anggota` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
