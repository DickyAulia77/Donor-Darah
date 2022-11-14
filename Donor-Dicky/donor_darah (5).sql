-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Des 2021 pada 09.37
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donor_darah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `akun_id_akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `no_telepon`, `akun_id_akun`) VALUES
(1, 'Admin', '081234567890', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  `user_nik` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `username`, `password`, `role`, `user_nik`) VALUES
(1, 'admin', '$2y$10$UhTdktze6yK746S4TK1tOeYiUIxy2Q2Rlmlcl/.sOyuS9wL0.d5vy', 'Admin', NULL),
(55, 'muhammadrezky', '$2y$10$Zq2cdRjg9QjIj2A4zA8aq.lVXCJGNF8NrfCII6C.LYKmfhwY/7TZ6', 'User', 6402061210010007),
(57, '111', '$2y$10$h20lNl3w2tmzPyHYlfxEJ.4oX7UXOT6CfeQGlVRLBMGORMhmYZS3y', 'User', 111),
(58, '222', '$2y$10$y.GY51a5MD8aIUNKZyrRDebXJ87SV4fDMZMKwKEka7UZRtcn6QoRy', 'User', 222),
(59, '333', '$2y$10$eXFsL7IckI113ZmTmErJM.8aM5tPLixakbh0tRI8QqhGlwYvt3GZi', 'User', 333),
(60, '444', '$2y$10$pmUGlD1RytivBmHVelSSEu8IWHyMkSxkNWgz0.T2TuZAKNkbPJQOy', 'User', 444);

-- --------------------------------------------------------

--
-- Struktur dari tabel `form`
--

CREATE TABLE `form` (
  `id_form` int(11) NOT NULL,
  `umur` int(11) NOT NULL,
  `berat_badan` int(11) NOT NULL,
  `hiv` varchar(12) NOT NULL,
  `pasangan_hiv` varchar(12) NOT NULL,
  `kontak_hepatitis` varchar(12) NOT NULL,
  `suntik` varchar(12) NOT NULL,
  `sex_period` varchar(12) NOT NULL,
  `riwayat_donor` varchar(10) NOT NULL,
  `user_nik` bigint(20) DEFAULT NULL,
  `hasil_id_hasil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `form`
--

INSERT INTO `form` (`id_form`, `umur`, `berat_badan`, `hiv`, `pasangan_hiv`, `kontak_hepatitis`, `suntik`, `sex_period`, `riwayat_donor`, `user_nik`, `hasil_id_hasil`) VALUES
(55, 20, 55, 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', '<=3 Bulan', 6402061210010007, 55),
(58, 24, 77, 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', '>3 Bulan', 222, 58),
(60, 56, 48, 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', 'Tidak Pernah', 'Tidak', '>3 Bulan', 444, 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `hasil_form` varchar(30) NOT NULL,
  `form_id_form` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `hasil_form`, `form_id_form`) VALUES
(55, 'Tidak dapat mendonorkan darah', 55),
(58, 'Bisa mendonorkan darah', 58),
(60, 'Bisa mendonorkan darah', 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `nik` bigint(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `alamat_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `akun_id_akun` int(11) NOT NULL,
  `form_id_form` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nik`, `nama`, `no_telepon`, `email`, `tempat_lahir`, `alamat_lengkap`, `jenis_kelamin`, `akun_id_akun`, `form_id_form`) VALUES
(111, '111', '111', '111', '2', '11', 'Perempuan', 57, NULL),
(222, '222', '222', '22', '222', '222', 'Laki-Laki', 58, 58),
(333, '333', '33', '333', '333', '333', 'Laki-Laki', 59, NULL),
(444, '444', '444', '444', '444', '444', 'Perempuan', 60, 60),
(6402061210010007, 'Muhammad', '089629259481', 'kiki.dewa20@gmail.com', 'Tenggarong', 'Jl. Danau Murung No. 38 RT. 21', 'Laki-Laki', 55, 55);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `admin__idx` (`akun_id_akun`);

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`),
  ADD UNIQUE KEY `user_id_user` (`user_nik`);

--
-- Indeks untuk tabel `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id_form`),
  ADD UNIQUE KEY `form__idx` (`user_nik`),
  ADD UNIQUE KEY `form__idxv1` (`hasil_id_hasil`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD UNIQUE KEY `hasil__idx` (`form_id_form`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nik`),
  ADD UNIQUE KEY `akun_id_akun` (`akun_id_akun`),
  ADD UNIQUE KEY `form_id_form` (`form_id_form`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`akun_id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_ibfk_1` FOREIGN KEY (`user_nik`) REFERENCES `user` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `form`
--
ALTER TABLE `form`
  ADD CONSTRAINT `form_ibfk_1` FOREIGN KEY (`hasil_id_hasil`) REFERENCES `hasil` (`id_hasil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_ibfk_2` FOREIGN KEY (`user_nik`) REFERENCES `user` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`form_id_form`) REFERENCES `form` (`id_form`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`akun_id_akun`) REFERENCES `akun` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`form_id_form`) REFERENCES `form` (`id_form`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
