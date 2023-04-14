-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 04:23 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_stok_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `harga` int(10) NOT NULL,
  `jumlah` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id`, `id_kategori`, `nama`, `gambar`, `harga`, `jumlah`) VALUES
(1, 1, 'halo', 'Picture1-removebg-preview.png', 1220000, 20),
(5, 1, 'logo', 'Picture1-removebg-preview.png', 1220000, 2),
(6, 5, 'hoodie', 'Picture1-removebg-preview.png', 150000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) NOT NULL,
  `nama_kt` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama_kt`, `keterangan`) VALUES
(1, 'Elektronik', 'barang yang membantu'),
(4, 'Sembako', 'Bahan pangan rumah tangga'),
(5, 'pakaian', 'untuk di gunakan sehari-hari');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_keluar`
--

CREATE TABLE `tb_transaksi_keluar` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_transaksi_keluar`
--

INSERT INTO `tb_transaksi_keluar` (`id`, `id_barang`, `jumlah`, `username`, `tgl`) VALUES
(1, 1, 80, 'rafi', '2023-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi_masuk`
--

CREATE TABLE `tb_transaksi_masuk` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_transaksi_masuk`
--

INSERT INTO `tb_transaksi_masuk` (`id`, `id_barang`, `jumlah`, `username`, `tgl`) VALUES
(1, 5, 2, 'rafi', '2023-03-31'),
(2, 5, 2, 'rafi', '2023-03-07'),
(3, 1, 20, 'rafi', '2023-03-31'),
(4, 1, 10, 'rafi', '2023-03-31'),
(5, 6, 2, 'rafi', '2023-03-31'),
(6, 1, 10, 'rafi', '2023-03-31'),
(7, 1, 20, 'rafi', '2023-04-07'),
(8, 5, 3, 'rafi', '2023-04-07'),
(9, 6, 2, 'rafi', '2023-04-07'),
(10, 6, 2, 'rafi', '2023-04-07'),
(11, 6, 3, 'rafi', '2023-04-07'),
(12, 1, 10, 'rafi', '2023-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nm_lengkap` varchar(50) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nm_lengkap`, `role`) VALUES
('fadhil', '$2y$10$iZe9YC5QPfwYrLah6aRDlu6p7xhe01yIwY0uSCwaXe4UbJHE60Y2m', 'nm_lengkap', 0),
('habi', '$2y$10$UUfjAAMJjSqnu5GisitUiu96y.ux.YTXtEJz/E9IaqIlT0G3VgcfW', 'nm_lengkap', 0),
('rafi', '$2y$10$.rHpT9hOQviKY5UWuUNq5OFXuMTni8RiEJ/p4t2Qdw43yiLbRMZjq', 'nm_lengkap', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi_keluar`
--
ALTER TABLE `tb_transaksi_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `tb_transaksi_masuk`
--
ALTER TABLE `tb_transaksi_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_transaksi_keluar`
--
ALTER TABLE `tb_transaksi_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_transaksi_masuk`
--
ALTER TABLE `tb_transaksi_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id`);

--
-- Constraints for table `tb_transaksi_keluar`
--
ALTER TABLE `tb_transaksi_keluar`
  ADD CONSTRAINT `tb_transaksi_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`),
  ADD CONSTRAINT `tb_transaksi_keluar_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `tb_transaksi_masuk`
--
ALTER TABLE `tb_transaksi_masuk`
  ADD CONSTRAINT `tb_transaksi_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id`),
  ADD CONSTRAINT `tb_transaksi_masuk_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
