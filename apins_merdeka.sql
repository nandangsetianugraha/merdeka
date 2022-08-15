-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2022 at 10:36 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apins_merdeka`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `smt` int(11) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `absensi` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `absensi_ptk`
--

CREATE TABLE `absensi_ptk` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `absen_config`
--

CREATE TABLE `absen_config` (
  `id` int(11) NOT NULL,
  `masuk1` varchar(8) NOT NULL,
  `masuk2` varchar(8) NOT NULL,
  `keluar1` varchar(8) NOT NULL,
  `keluar2` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(11) NOT NULL,
  `nama_agama` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `arbain`
--

CREATE TABLE `arbain` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aspek`
--

CREATE TABLE `aspek` (
  `kd_aspek` int(11) NOT NULL,
  `nama_aspek` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `penulis` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` text NOT NULL,
  `slug` varchar(250) NOT NULL,
  `isi` longtext NOT NULL,
  `images` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berita_acara`
--

CREATE TABLE `berita_acara` (
  `id_bap` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `smt` int(11) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `mulai` varchar(5) NOT NULL,
  `selesai` varchar(5) NOT NULL,
  `mapel` varchar(50) NOT NULL,
  `pengawas1` varchar(50) NOT NULL,
  `pengawas2` varchar(50) NOT NULL,
  `absen` int(11) NOT NULL,
  `nomor_absen` varchar(50) NOT NULL,
  `catatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bulan_spp`
--

CREATE TABLE `bulan_spp` (
  `id_bulan` int(11) NOT NULL,
  `bulan` varchar(12) NOT NULL,
  `bulan_pendek` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id_cat` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `titimangsa` date DEFAULT NULL,
  `walikelas` varchar(50) NOT NULL,
  `walikelas2` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_absensi`
--

CREATE TABLE `data_absensi` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `sakit` varchar(2) DEFAULT NULL,
  `ijin` varchar(2) DEFAULT NULL,
  `alfa` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_ekskul`
--

CREATE TABLE `data_ekskul` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `id_ekskul` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_kesehatan`
--

CREATE TABLE `data_kesehatan` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `tinggi` varchar(3) NOT NULL,
  `berat` varchar(3) NOT NULL,
  `pendengaran` varchar(100) NOT NULL,
  `penglihatan` varchar(100) NOT NULL,
  `gigi` varchar(100) NOT NULL,
  `lainnya` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_prestasi`
--

CREATE TABLE `data_prestasi` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `kesenian` varchar(100) DEFAULT NULL,
  `olahraga` varchar(100) DEFAULT NULL,
  `akademik` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_register`
--

CREATE TABLE `data_register` (
  `peserta_didik_id` varchar(36) NOT NULL DEFAULT '',
  `jns_daftar` int(11) NOT NULL,
  `tgl_masuk` varchar(10) DEFAULT NULL,
  `asal_tk` int(1) DEFAULT NULL,
  `asal_ra` int(1) DEFAULT NULL,
  `mutasi` varchar(1) DEFAULT NULL,
  `tgl_mutasi` date DEFAULT NULL,
  `alasan` varchar(19) DEFAULT NULL,
  `ijazah` int(11) NOT NULL,
  `skhun` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `id` varchar(20) NOT NULL,
  `id_kecamatan` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deskripsi_k13`
--

CREATE TABLE `deskripsi_k13` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doa`
--

CREATE TABLE `doa` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doa_harian`
--

CREATE TABLE `doa_harian` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ekskul`
--

CREATE TABLE `ekskul` (
  `id_ekskul` int(11) NOT NULL,
  `nama_ekskul` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filepkg`
--

CREATE TABLE `filepkg` (
  `id_penilaian` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `nama_file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `formatif`
--

CREATE TABLE `formatif` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `tp` varchar(10) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gajipokok`
--

CREATE TABLE `gajipokok` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `insentif` int(11) NOT NULL,
  `transport` int(11) NOT NULL,
  `tunj_walikelas` int(11) NOT NULL,
  `tunj_kepsek` int(11) NOT NULL,
  `tunj_kehadiran` int(11) NOT NULL,
  `tunj_ekskul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` text NOT NULL,
  `link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hadits`
--

CREATE TABLE `hadits` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hadits_arbain`
--

CREATE TABLE `hadits_arbain` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hadits_pilihan`
--

CREATE TABLE `hadits_pilihan` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hafalan`
--

CREATE TABLE `hafalan` (
  `id_hafalan` int(11) NOT NULL,
  `jenis_hafalan` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `arab` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `artinya` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hari_efektif`
--

CREATE TABLE `hari_efektif` (
  `id_hari` int(11) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `hari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `id_pegawai`
--

CREATE TABLE `id_pegawai` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ijazah`
--

CREATE TABLE `ijazah` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nama` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ijin_ptk`
--

CREATE TABLE `ijin_ptk` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indikator`
--

CREATE TABLE `indikator` (
  `id_indikator` int(11) NOT NULL,
  `kd_komp` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `nama_indikator` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwalku`
--

CREATE TABLE `jadwalku` (
  `jadwal_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ptk`
--

CREATE TABLE `jenis_ptk` (
  `jenis_ptk_id` int(11) NOT NULL,
  `jenis_ptk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tunggakan`
--

CREATE TABLE `jenis_tunggakan` (
  `id_tunggakan` int(11) NOT NULL,
  `nama_tunggakan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenjang`
--

CREATE TABLE `jenjang` (
  `kd_jenjang` int(11) NOT NULL,
  `nama_jenjang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jns_daftar`
--

CREATE TABLE `jns_daftar` (
  `id_jns_daftar` int(11) NOT NULL,
  `nama_jns_daftar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jns_mutasi`
--

CREATE TABLE `jns_mutasi` (
  `id_mutasi` int(11) NOT NULL,
  `nama_mutasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jns_tinggal`
--

CREATE TABLE `jns_tinggal` (
  `id_jns_tinggal` int(11) NOT NULL,
  `nama_jns_tinggal` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `juzamma`
--

CREATE TABLE `juzamma` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` char(4) NOT NULL,
  `id_provinsi` char(20) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kd`
--

CREATE TABLE `kd` (
  `id_kd` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `aspek` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nama_kd` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kd_sosial`
--

CREATE TABLE `kd_sosial` (
  `ids` int(11) NOT NULL,
  `komp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kd_spirit`
--

CREATE TABLE `kd_spirit` (
  `ids` int(11) NOT NULL,
  `komp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keahlian`
--

CREATE TABLE `keahlian` (
  `idke` int(11) NOT NULL,
  `keahlian` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keb_khusus`
--

CREATE TABLE `keb_khusus` (
  `id_keb_khusus` int(11) NOT NULL,
  `nama_keb_khusus` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` char(10) NOT NULL,
  `id_kabupaten` char(10) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_keg` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` int(11) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `nilai` varchar(1) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id_kel` char(10) NOT NULL,
  `id_kec` char(6) DEFAULT NULL,
  `nama` tinytext DEFAULT NULL,
  `id_jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kkm`
--

CREATE TABLE `kkm` (
  `id_kkm` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kkmku`
--

CREATE TABLE `kkmku` (
  `id_kkm` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jenis` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_komentator` varchar(36) NOT NULL,
  `isi_komen` text NOT NULL,
  `tanggal_komen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kompetensi`
--

CREATE TABLE `kompetensi` (
  `kd_komp` int(11) NOT NULL,
  `nama_komp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_conf` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `maintenis` int(11) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `alamat_sekolah` varchar(100) NOT NULL,
  `image_login` varchar(200) NOT NULL,
  `versi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_conf`, `tapel`, `semester`, `maintenis`, `nama_sekolah`, `alamat_sekolah`, `image_login`, `versi`) VALUES
(1, '2022/2023', 1, 0, 'SD Islam Al-Jannah', 'Jl. Raya Gabuswetan No. 1', 'default.png', 'Merdeka');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id_kurikulum` int(11) NOT NULL,
  `nama_kurikulum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lingkup_materi`
--

CREATE TABLE `lingkup_materi` (
  `id_lm` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `nama_lm` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `logDate` datetime NOT NULL DEFAULT current_timestamp(),
  `activity` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `ptk_id`, `logDate`, `activity`) VALUES
(1195, 'xscy-cgftr-sgtr987-sgt65-sgths-sgst', '2022-08-15 14:06:35', 'Login ke Sistem');

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

CREATE TABLE `loginattempts` (
  `IP` varchar(20) NOT NULL,
  `Attempts` int(11) NOT NULL,
  `LastLogin` datetime NOT NULL,
  `Username` varchar(65) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loginattempts`
--

INSERT INTO `loginattempts` (`IP`, `Attempts`, `LastLogin`, `Username`, `ID`) VALUES
('::1', 1, '2022-08-15 14:06:35', 'admin', 137);

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `kd_mapel` varchar(4) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mapel` int(11) NOT NULL,
  `kd_mapel` varchar(4) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mengajar`
--

CREATE TABLE `mengajar` (
  `id_mengajar` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `rombel` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id` int(11) NOT NULL,
  `nasabah_id` varchar(10) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `last_print` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nats`
--

CREATE TABLE `nats` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nh`
--

CREATE TABLE `nh` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nh_temp`
--

CREATE TABLE `nh_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilaiun`
--

CREATE TABLE `nilaiun` (
  `id` int(11) NOT NULL,
  `nopes` varchar(20) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nk`
--

CREATE TABLE `nk` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nk_temp`
--

CREATE TABLE `nk_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nso`
--

CREATE TABLE `nso` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `perilaku` varchar(500) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nso_pai`
--

CREATE TABLE `nso_pai` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nso_temp`
--

CREATE TABLE `nso_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nsp`
--

CREATE TABLE `nsp` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `perilaku` varchar(500) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nsp_pai`
--

CREATE TABLE `nsp_pai` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nilai` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nsp_temp`
--

CREATE TABLE `nsp_temp` (
  `id_nh` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `jns` varchar(10) NOT NULL,
  `nph` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nuts`
--

CREATE TABLE `nuts` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `kd` varchar(10) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `nama_pekerjaan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_invoice` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `jenis` int(11) NOT NULL,
  `bulan` int(11) DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_temp`
--

CREATE TABLE `pembayaran_temp` (
  `id_bayar` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `jenis` int(11) NOT NULL,
  `bulan` int(11) DEFAULT NULL,
  `deskripsi` varchar(200) DEFAULT NULL,
  `bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelajaran`
--

CREATE TABLE `pembelajaran` (
  `idpb` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `pb` int(11) NOT NULL,
  `nama_pb` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemetaan`
--

CREATE TABLE `pemetaan` (
  `id_pemetaan` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `kd_aspek` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `nama_peta` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `nama_pendidikan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pend_terakhir`
--

CREATE TABLE `pend_terakhir` (
  `idPend` int(11) NOT NULL,
  `pendidikan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penempatan`
--

CREATE TABLE `penempatan` (
  `id_rombel` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nama` varchar(41) DEFAULT NULL,
  `rombel` varchar(2) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ptk_id` varchar(36) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `level` int(11) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`ptk_id`, `username`, `password`, `nama_lengkap`, `level`, `verified`, `gambar`) VALUES
('xscy-cgftr-sgtr987-sgt65-sgths-sgst', 'admin', '$2y$10$a5A7J8MTRriqva/3RszZCuE2AI5jedY2qX6u953XqcQcwBJghNkjS', 'Administrator', 11, 1, 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `penghasilan`
--

CREATE TABLE `penghasilan` (
  `id_penghasilan` int(11) NOT NULL,
  `nama_penghasilan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(10) NOT NULL,
  `waktu` datetime NOT NULL,
  `judul` text NOT NULL,
  `berita` text NOT NULL,
  `tipe` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `nip` varchar(50) NOT NULL,
  `akk` int(11) NOT NULL,
  `pend` text NOT NULL,
  `keahlian` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `id_pengirim` varchar(36) NOT NULL,
  `id_penerima` varchar(36) NOT NULL,
  `tanggal` date NOT NULL,
  `judul_pesan` varchar(50) NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesertaun`
--

CREATE TABLE `pesertaun` (
  `id` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nopes` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peserta_us`
--

CREATE TABLE `peserta_us` (
  `peserta_didik_id` varchar(36) NOT NULL,
  `nopes` text NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pkg`
--

CREATE TABLE `pkg` (
  `id_pkg` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `smt` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `kd_komp` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `potongan_gaji`
--

CREATE TABLE `potongan_gaji` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` int(11) NOT NULL,
  `hari` int(11) DEFAULT 0,
  `absen` int(11) DEFAULT 0,
  `ekskul` int(11) DEFAULT 0,
  `telat` int(11) DEFAULT 0,
  `cepat` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE `prestasi` (
  `idprestasi` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `prestasi` varchar(100) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `penyelenggara` varchar(100) NOT NULL,
  `tingkat` varchar(15) NOT NULL,
  `juara` varchar(10) NOT NULL,
  `scan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id_printer` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `spp` varchar(100) NOT NULL,
  `tabungan` varchar(100) NOT NULL,
  `kwitansi` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_prov` char(2) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ptk`
--

CREATE TABLE `ptk` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `gelar` varchar(30) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `niy_nigk` varchar(14) DEFAULT NULL,
  `nuptk` varchar(16) DEFAULT NULL,
  `status_kepegawaian_id` int(1) DEFAULT NULL,
  `jenis_ptk_id` int(2) DEFAULT NULL,
  `alamat_jalan` varchar(250) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status_keaktifan_id` int(1) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `nasabah_id` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ptk`
--

INSERT INTO `ptk` (`id`, `ptk_id`, `nama`, `gelar`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `status_kepegawaian_id`, `jenis_ptk_id`, `alamat_jalan`, `no_hp`, `email`, `status_keaktifan_id`, `gambar`, `nasabah_id`) VALUES
(61, 'xscy-cgftr-sgtr987-sgt65-sgths-sgst', 'Administrator', NULL, 'L', 'Indramayu', '1999-09-09', '76276217628', '1298283827373', '192839138738', 4, 11, 'Jl. Raya gabuswetan No. 1', '08765542413', 'admin@gmail.com', 1, 'default.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `raport`
--

CREATE TABLE `raport` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL DEFAULT 0.00,
  `oleh` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `raport_ikm`
--

CREATE TABLE `raport_ikm` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL DEFAULT 0.00,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `raport_k13`
--

CREATE TABLE `raport_k13` (
  `id_raport` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `jns` varchar(5) NOT NULL,
  `nilai` double(11,2) NOT NULL DEFAULT 0.00,
  `predikat` varchar(1) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `id_rombel` int(11) NOT NULL,
  `nama_rombel` varchar(10) NOT NULL,
  `kurikulum` varchar(50) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `wali_kelas` varchar(36) DEFAULT NULL,
  `pendamping` varchar(36) DEFAULT NULL,
  `pai` varchar(36) DEFAULT NULL,
  `penjas` varchar(36) DEFAULT NULL,
  `inggris` varchar(36) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saran`
--

CREATE TABLE `saran` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `saran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sas`
--

CREATE TABLE `sas` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `sekolah_id` varchar(36) DEFAULT NULL,
  `nama` varchar(18) DEFAULT NULL,
  `nss` bigint(12) DEFAULT NULL,
  `npsn` int(8) DEFAULT NULL,
  `bentuk_pendidikan_id` int(1) DEFAULT NULL,
  `alamat_jalan` varchar(25) DEFAULT NULL,
  `rt` int(1) DEFAULT NULL,
  `rw` int(1) DEFAULT NULL,
  `nama_dusun` varchar(10) DEFAULT NULL,
  `desa_kelurahan` varchar(10) DEFAULT NULL,
  `kode_wilayah` varchar(8) DEFAULT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `lintang` decimal(8,6) DEFAULT NULL,
  `bujur` decimal(9,6) DEFAULT NULL,
  `nomor_telepon` varchar(14) DEFAULT NULL,
  `nomor_fax` varchar(10) DEFAULT NULL,
  `email` varchar(22) DEFAULT NULL,
  `website` varchar(30) DEFAULT NULL,
  `kebutuhan_khusus_id` int(1) DEFAULT NULL,
  `status_sekolah` int(1) DEFAULT NULL,
  `sk_pendirian_sekolah` varchar(17) DEFAULT NULL,
  `tanggal_sk_pendirian` varchar(8) DEFAULT NULL,
  `visimisi` text DEFAULT NULL,
  `kurikulum` text DEFAULT NULL,
  `sk_izin_operasional` varchar(25) DEFAULT NULL,
  `tanggal_sk_izin_operasional` varchar(10) DEFAULT NULL,
  `no_rekening` bigint(13) DEFAULT NULL,
  `nama_bank` varchar(17) DEFAULT NULL,
  `cabang_kcp_unit` varchar(11) DEFAULT NULL,
  `rekening_atas_nama` varchar(18) DEFAULT NULL,
  `mbs` int(1) DEFAULT NULL,
  `luas_tanah_milik` int(4) DEFAULT NULL,
  `luas_tanah_bukan_milik` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `website_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `website_url` varchar(100) CHARACTER SET latin1 NOT NULL,
  `website_email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `meta_description` varchar(250) CHARACTER SET latin1 NOT NULL,
  `meta_keyword` varchar(250) CHARACTER SET latin1 NOT NULL,
  `favicon` varchar(50) CHARACTER SET latin1 NOT NULL,
  `timezone` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `website_maintenance` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `website_maintenance_tgl` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `website_cache` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `website_cache_time` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `member_register` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sikap`
--

CREATE TABLE `sikap` (
  `id_sikap` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `sikap` varchar(1) NOT NULL,
  `rajin` varchar(1) NOT NULL,
  `rapi` varchar(1) NOT NULL,
  `ijin` int(11) NOT NULL,
  `sakit` int(11) NOT NULL,
  `alpa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL DEFAULT '',
  `nis` varchar(9) NOT NULL,
  `nisn` varchar(10) DEFAULT NULL,
  `nama` varchar(41) DEFAULT NULL,
  `jk` varchar(1) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `agama` int(11) NOT NULL,
  `pend_sebelum` varchar(100) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `nama_ayah` varchar(22) DEFAULT NULL,
  `nama_ibu` varchar(23) DEFAULT NULL,
  `pek_ayah` int(11) NOT NULL,
  `pek_ibu` int(11) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(20) NOT NULL,
  `kabupaten` varchar(20) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `nasabah_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sk`
--

CREATE TABLE `sk` (
  `id_sk` int(11) NOT NULL,
  `tanggal_sk` date NOT NULL,
  `no_sk` varchar(100) NOT NULL,
  `ptk_id` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `jenis_ptk` varchar(50) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `pengangkat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skkb`
--

CREATE TABLE `skkb` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sk_aktif`
--

CREATE TABLE `sk_aktif` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `tapel` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `slip_gaji`
--

CREATE TABLE `slip_gaji` (
  `id` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `gapok` int(11) NOT NULL,
  `tunj_transport` int(11) NOT NULL,
  `tunj_jabatan` int(11) NOT NULL,
  `tunj_lain` int(11) NOT NULL,
  `tunj_kehadiran` int(11) NOT NULL,
  `tunj_ekskul` int(11) NOT NULL,
  `pot_telat` int(11) NOT NULL,
  `pot_cepat` int(11) NOT NULL,
  `pot_absen` int(11) NOT NULL,
  `pot_ketidakhadiran` int(11) NOT NULL,
  `pot_ekskul` int(11) NOT NULL,
  `hari_kerja` int(11) NOT NULL,
  `kehadiran` int(11) NOT NULL,
  `absensi` int(11) NOT NULL,
  `telat` int(11) NOT NULL,
  `cepat` int(11) NOT NULL,
  `total_gaji` int(11) NOT NULL,
  `total_pot` int(11) NOT NULL,
  `gaji_bersih` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smutasi`
--

CREATE TABLE `smutasi` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `nomor` varchar(36) NOT NULL,
  `pemohon` varchar(100) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `sdmut` varchar(100) NOT NULL,
  `npsn` varchar(15) NOT NULL,
  `alamatsd` varchar(200) NOT NULL,
  `alasan` varchar(100) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `isi_status` text NOT NULL,
  `tanggal_status` varchar(20) NOT NULL,
  `dihapus` varchar(1) DEFAULT 't'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE `status_kepegawaian` (
  `status_kepegawaian_id` int(11) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sts`
--

CREATE TABLE `sts` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subtema`
--

CREATE TABLE `subtema` (
  `id_sub` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `sub` varchar(5) NOT NULL,
  `nama_sub` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sumatif`
--

CREATE TABLE `sumatif` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surah`
--

CREATE TABLE `surah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surah_pilihan`
--

CREATE TABLE `surah_pilihan` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_ijin`
--

CREATE TABLE `surat_ijin` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `ptk_id` varchar(36) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `keterangan` varchar(10) NOT NULL,
  `alasan` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `penolakan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabungan`
--

CREATE TABLE `tabungan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `kode` int(11) NOT NULL,
  `nasabah_id` varchar(10) NOT NULL,
  `masuk` bigint(20) DEFAULT 0,
  `keluar` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tahfidz`
--

CREATE TABLE `tahfidz` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `surah` int(11) NOT NULL,
  `nilai` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tapel`
--

CREATE TABLE `tapel` (
  `id_tapel` int(11) NOT NULL,
  `nama_tapel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tapel`
--

INSERT INTO `tapel` (`id_tapel`, `nama_tapel`) VALUES
(1, '2021/2022'),
(2, '2022/2023');

-- --------------------------------------------------------

--
-- Table structure for table `tarif_spp`
--

CREATE TABLE `tarif_spp` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `creation_date` date NOT NULL,
  `order_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `ukuran` varchar(5) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `stock` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `kategori` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `telegram`
--

CREATE TABLE `telegram` (
  `id` int(11) NOT NULL,
  `iduser` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `username` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tema` varchar(2) NOT NULL,
  `nama_tema` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_pas`
--

CREATE TABLE `temp_pas` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_pts`
--

CREATE TABLE `temp_pts` (
  `idNH` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` varchar(3) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `titimangsa`
--

CREATE TABLE `titimangsa` (
  `id` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `tanggal2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tp`
--

CREATE TABLE `tp` (
  `id_tp` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `lm` varchar(2) NOT NULL,
  `mapel` int(11) NOT NULL,
  `tp` varchar(10) NOT NULL,
  `nama_tp` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transportasi`
--

CREATE TABLE `transportasi` (
  `id_transportasi` int(11) NOT NULL,
  `nama_transportasi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tryout`
--

CREATE TABLE `tryout` (
  `id_to` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `toke` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `tugas_ke` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tunggakan_lain`
--

CREATE TABLE `tunggakan_lain` (
  `id` int(11) NOT NULL,
  `peserta_didik_id` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `jenis` int(11) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uas`
--

CREATE TABLE `uas` (
  `id_uas` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00,
  `oleh` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uasbn`
--

CREATE TABLE `uasbn` (
  `id_uasbn` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uasbn_praktek`
--

CREATE TABLE `uasbn_praktek` (
  `id_uasbn` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `tapel` varchar(9) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ulhar`
--

CREATE TABLE `ulhar` (
  `id_ulhar` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `ulhar_ke` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usm1`
--

CREATE TABLE `usm1` (
  `id` int(11) NOT NULL,
  `nis` varchar(10) DEFAULT NULL,
  `nopes` varchar(20) DEFAULT NULL,
  `pair` varchar(4) DEFAULT NULL,
  `paiu` varchar(4) DEFAULT NULL,
  `pais` varchar(4) DEFAULT NULL,
  `pknr` varchar(4) DEFAULT NULL,
  `pknu` varchar(4) DEFAULT NULL,
  `pkns` varchar(4) DEFAULT NULL,
  `binr` varchar(4) DEFAULT NULL,
  `binu` varchar(4) DEFAULT NULL,
  `bins` varchar(4) DEFAULT NULL,
  `mtkr` varchar(4) DEFAULT NULL,
  `mtku` varchar(4) DEFAULT NULL,
  `mtks` varchar(4) DEFAULT NULL,
  `ipar` varchar(4) DEFAULT NULL,
  `ipau` varchar(4) DEFAULT NULL,
  `ipas` varchar(4) DEFAULT NULL,
  `ipsr` varchar(4) DEFAULT NULL,
  `ipsu` varchar(4) DEFAULT NULL,
  `ipss` varchar(4) DEFAULT NULL,
  `sbkr` varchar(4) DEFAULT NULL,
  `sbku` varchar(4) DEFAULT NULL,
  `sbks` varchar(4) DEFAULT NULL,
  `pjkr` varchar(4) DEFAULT NULL,
  `pjku` varchar(4) DEFAULT NULL,
  `pjks` varchar(4) DEFAULT NULL,
  `bidr` varchar(4) DEFAULT NULL,
  `bidu` varchar(4) DEFAULT NULL,
  `bids` varchar(4) DEFAULT NULL,
  `bigr` varchar(4) DEFAULT NULL,
  `bigu` varchar(4) DEFAULT NULL,
  `bigs` varchar(4) DEFAULT NULL,
  `pbpr` varchar(4) DEFAULT NULL,
  `pbpu` varchar(4) DEFAULT NULL,
  `pbps` varchar(4) DEFAULT NULL,
  `binun` varchar(4) DEFAULT NULL,
  `mtkun` varchar(4) DEFAULT NULL,
  `ipaun` varchar(4) DEFAULT NULL,
  `rataun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `us_praktek`
--

CREATE TABLE `us_praktek` (
  `peserta_didik_id` varchar(36) NOT NULL,
  `pai` decimal(10,2) NOT NULL,
  `bin` decimal(10,2) NOT NULL,
  `ipa` decimal(10,2) NOT NULL,
  `bid` decimal(10,2) NOT NULL,
  `big` decimal(10,2) NOT NULL,
  `pjk` decimal(10,2) NOT NULL,
  `sbk` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_tulis`
--

CREATE TABLE `us_tulis` (
  `peserta_didik_id` varchar(36) NOT NULL,
  `pai` decimal(10,2) NOT NULL,
  `pkn` decimal(10,2) NOT NULL,
  `ips` decimal(10,2) NOT NULL,
  `bid` decimal(10,2) NOT NULL,
  `big` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uts`
--

CREATE TABLE `uts` (
  `id_uts` int(11) NOT NULL,
  `id_pd` varchar(36) NOT NULL,
  `kelas` int(11) NOT NULL,
  `smt` int(11) NOT NULL,
  `tapel` varchar(10) NOT NULL,
  `mapel` int(11) NOT NULL,
  `nilai` float(11,2) NOT NULL DEFAULT 0.00,
  `oleh` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id_video` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `link` varchar(150) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `uri` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `absensi_ptk`
--
ALTER TABLE `absensi_ptk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `absen_config`
--
ALTER TABLE `absen_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `arbain`
--
ALTER TABLE `arbain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita_acara`
--
ALTER TABLE `berita_acara`
  ADD PRIMARY KEY (`id_bap`);

--
-- Indexes for table `bulan_spp`
--
ALTER TABLE `bulan_spp`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `data_absensi`
--
ALTER TABLE `data_absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_ekskul`
--
ALTER TABLE `data_ekskul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_kesehatan`
--
ALTER TABLE `data_kesehatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_prestasi`
--
ALTER TABLE `data_prestasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_register`
--
ALTER TABLE `data_register`
  ADD PRIMARY KEY (`peserta_didik_id`),
  ADD KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `deskripsi_k13`
--
ALTER TABLE `deskripsi_k13`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `doa`
--
ALTER TABLE `doa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doa_harian`
--
ALTER TABLE `doa_harian`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `ekskul`
--
ALTER TABLE `ekskul`
  ADD PRIMARY KEY (`id_ekskul`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filepkg`
--
ALTER TABLE `filepkg`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `formatif`
--
ALTER TABLE `formatif`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `gajipokok`
--
ALTER TABLE `gajipokok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `hadits`
--
ALTER TABLE `hadits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hadits_arbain`
--
ALTER TABLE `hadits_arbain`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `hadits_pilihan`
--
ALTER TABLE `hadits_pilihan`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `hafalan`
--
ALTER TABLE `hafalan`
  ADD PRIMARY KEY (`id_hafalan`);

--
-- Indexes for table `hari_efektif`
--
ALTER TABLE `hari_efektif`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indexes for table `id_pegawai`
--
ALTER TABLE `id_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ijazah`
--
ALTER TABLE `ijazah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ijin_ptk`
--
ALTER TABLE `ijin_ptk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indikator`
--
ALTER TABLE `indikator`
  ADD PRIMARY KEY (`id_indikator`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwalku`
--
ALTER TABLE `jadwalku`
  ADD PRIMARY KEY (`jadwal_id`);

--
-- Indexes for table `jenis_ptk`
--
ALTER TABLE `jenis_ptk`
  ADD UNIQUE KEY `jenis_ptk_id_2` (`jenis_ptk_id`),
  ADD KEY `jenis_ptk_id` (`jenis_ptk_id`);

--
-- Indexes for table `jenis_tunggakan`
--
ALTER TABLE `jenis_tunggakan`
  ADD PRIMARY KEY (`id_tunggakan`);

--
-- Indexes for table `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`kd_jenjang`);

--
-- Indexes for table `jns_daftar`
--
ALTER TABLE `jns_daftar`
  ADD UNIQUE KEY `id_jns_daftar` (`id_jns_daftar`);

--
-- Indexes for table `jns_mutasi`
--
ALTER TABLE `jns_mutasi`
  ADD PRIMARY KEY (`id_mutasi`);

--
-- Indexes for table `jns_tinggal`
--
ALTER TABLE `jns_tinggal`
  ADD PRIMARY KEY (`id_jns_tinggal`);

--
-- Indexes for table `juzamma`
--
ALTER TABLE `juzamma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kd`
--
ALTER TABLE `kd`
  ADD PRIMARY KEY (`id_kd`);

--
-- Indexes for table `kd_sosial`
--
ALTER TABLE `kd_sosial`
  ADD PRIMARY KEY (`ids`);

--
-- Indexes for table `kd_spirit`
--
ALTER TABLE `kd_spirit`
  ADD PRIMARY KEY (`ids`);

--
-- Indexes for table `keahlian`
--
ALTER TABLE `keahlian`
  ADD PRIMARY KEY (`idke`);

--
-- Indexes for table `keb_khusus`
--
ALTER TABLE `keb_khusus`
  ADD UNIQUE KEY `id_keb_khusus_2` (`id_keb_khusus`),
  ADD KEY `id_keb_khusus` (`id_keb_khusus`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_keg`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id_kel`);

--
-- Indexes for table `kkm`
--
ALTER TABLE `kkm`
  ADD PRIMARY KEY (`id_kkm`);

--
-- Indexes for table `kkmku`
--
ALTER TABLE `kkmku`
  ADD PRIMARY KEY (`id_kkm`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `kompetensi`
--
ALTER TABLE `kompetensi`
  ADD PRIMARY KEY (`kd_komp`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD UNIQUE KEY `id_conf` (`id_conf`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`);

--
-- Indexes for table `lingkup_materi`
--
ALTER TABLE `lingkup_materi`
  ADD PRIMARY KEY (`id_lm`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loginattempts`
--
ALTER TABLE `loginattempts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`id_mengajar`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nats`
--
ALTER TABLE `nats`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nh`
--
ALTER TABLE `nh`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nh_temp`
--
ALTER TABLE `nh_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nilaiun`
--
ALTER TABLE `nilaiun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nk`
--
ALTER TABLE `nk`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nk_temp`
--
ALTER TABLE `nk_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nso`
--
ALTER TABLE `nso`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nso_pai`
--
ALTER TABLE `nso_pai`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nso_temp`
--
ALTER TABLE `nso_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nsp`
--
ALTER TABLE `nsp`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nsp_pai`
--
ALTER TABLE `nsp_pai`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `nsp_temp`
--
ALTER TABLE `nsp_temp`
  ADD PRIMARY KEY (`id_nh`);

--
-- Indexes for table `nuts`
--
ALTER TABLE `nuts`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `pembayaran_temp`
--
ALTER TABLE `pembayaran_temp`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `pembelajaran`
--
ALTER TABLE `pembelajaran`
  ADD PRIMARY KEY (`idpb`);

--
-- Indexes for table `pemetaan`
--
ALTER TABLE `pemetaan`
  ADD PRIMARY KEY (`id_pemetaan`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD UNIQUE KEY `id_pendidikan` (`id_pendidikan`);

--
-- Indexes for table `pend_terakhir`
--
ALTER TABLE `pend_terakhir`
  ADD PRIMARY KEY (`idPend`);

--
-- Indexes for table `penempatan`
--
ALTER TABLE `penempatan`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ptk_id`);

--
-- Indexes for table `penghasilan`
--
ALTER TABLE `penghasilan`
  ADD PRIMARY KEY (`id_penghasilan`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `pesertaun`
--
ALTER TABLE `pesertaun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta_us`
--
ALTER TABLE `peserta_us`
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `pkg`
--
ALTER TABLE `pkg`
  ADD PRIMARY KEY (`id_pkg`);

--
-- Indexes for table `potongan_gaji`
--
ALTER TABLE `potongan_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`idprestasi`);

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id_printer`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indexes for table `ptk`
--
ALTER TABLE `ptk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ptk_id` (`ptk_id`);

--
-- Indexes for table `raport`
--
ALTER TABLE `raport`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `raport_ikm`
--
ALTER TABLE `raport_ikm`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `raport_k13`
--
ALTER TABLE `raport_k13`
  ADD PRIMARY KEY (`id_raport`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sas`
--
ALTER TABLE `sas`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD UNIQUE KEY `sekolah_id` (`sekolah_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sikap`
--
ALTER TABLE `sikap`
  ADD PRIMARY KEY (`id_sikap`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `sk`
--
ALTER TABLE `sk`
  ADD PRIMARY KEY (`id_sk`);

--
-- Indexes for table `skkb`
--
ALTER TABLE `skkb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sk_aktif`
--
ALTER TABLE `sk_aktif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slip_gaji`
--
ALTER TABLE `slip_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smutasi`
--
ALTER TABLE `smutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  ADD UNIQUE KEY `status_kepegawaian_id` (`status_kepegawaian_id`);

--
-- Indexes for table `sts`
--
ALTER TABLE `sts`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `subtema`
--
ALTER TABLE `subtema`
  ADD PRIMARY KEY (`id_sub`);

--
-- Indexes for table `sumatif`
--
ALTER TABLE `sumatif`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `surah`
--
ALTER TABLE `surah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surah_pilihan`
--
ALTER TABLE `surah_pilihan`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabungan`
--
ALTER TABLE `tabungan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahfidz`
--
ALTER TABLE `tahfidz`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `tapel`
--
ALTER TABLE `tapel`
  ADD PRIMARY KEY (`id_tapel`);

--
-- Indexes for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram`
--
ALTER TABLE `telegram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `temp_pas`
--
ALTER TABLE `temp_pas`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `temp_pts`
--
ALTER TABLE `temp_pts`
  ADD PRIMARY KEY (`idNH`);

--
-- Indexes for table `titimangsa`
--
ALTER TABLE `titimangsa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp`
--
ALTER TABLE `tp`
  ADD PRIMARY KEY (`id_tp`);

--
-- Indexes for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD PRIMARY KEY (`id_transportasi`);

--
-- Indexes for table `tryout`
--
ALTER TABLE `tryout`
  ADD PRIMARY KEY (`id_to`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `tunggakan_lain`
--
ALTER TABLE `tunggakan_lain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uas`
--
ALTER TABLE `uas`
  ADD PRIMARY KEY (`id_uas`);

--
-- Indexes for table `uasbn`
--
ALTER TABLE `uasbn`
  ADD PRIMARY KEY (`id_uasbn`);

--
-- Indexes for table `uasbn_praktek`
--
ALTER TABLE `uasbn_praktek`
  ADD PRIMARY KEY (`id_uasbn`);

--
-- Indexes for table `ulhar`
--
ALTER TABLE `ulhar`
  ADD PRIMARY KEY (`id_ulhar`);

--
-- Indexes for table `usm1`
--
ALTER TABLE `usm1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_praktek`
--
ALTER TABLE `us_praktek`
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `us_tulis`
--
ALTER TABLE `us_tulis`
  ADD UNIQUE KEY `peserta_didik_id` (`peserta_didik_id`);

--
-- Indexes for table `uts`
--
ALTER TABLE `uts`
  ADD PRIMARY KEY (`id_uts`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `absensi_ptk`
--
ALTER TABLE `absensi_ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1262;

--
-- AUTO_INCREMENT for table `absen_config`
--
ALTER TABLE `absen_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arbain`
--
ALTER TABLE `arbain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `berita_acara`
--
ALTER TABLE `berita_acara`
  MODIFY `id_bap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT for table `bulan_spp`
--
ALTER TABLE `bulan_spp`
  MODIFY `id_bulan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `data_absensi`
--
ALTER TABLE `data_absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `data_ekskul`
--
ALTER TABLE `data_ekskul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1421;

--
-- AUTO_INCREMENT for table `data_kesehatan`
--
ALTER TABLE `data_kesehatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1895;

--
-- AUTO_INCREMENT for table `data_prestasi`
--
ALTER TABLE `data_prestasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `deskripsi_k13`
--
ALTER TABLE `deskripsi_k13`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5468;

--
-- AUTO_INCREMENT for table `doa`
--
ALTER TABLE `doa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `doa_harian`
--
ALTER TABLE `doa_harian`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5794;

--
-- AUTO_INCREMENT for table `ekskul`
--
ALTER TABLE `ekskul`
  MODIFY `id_ekskul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filepkg`
--
ALTER TABLE `filepkg`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `formatif`
--
ALTER TABLE `formatif`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `gajipokok`
--
ALTER TABLE `gajipokok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hadits`
--
ALTER TABLE `hadits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `hadits_arbain`
--
ALTER TABLE `hadits_arbain`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2360;

--
-- AUTO_INCREMENT for table `hadits_pilihan`
--
ALTER TABLE `hadits_pilihan`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3104;

--
-- AUTO_INCREMENT for table `hafalan`
--
ALTER TABLE `hafalan`
  MODIFY `id_hafalan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `hari_efektif`
--
ALTER TABLE `hari_efektif`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `id_pegawai`
--
ALTER TABLE `id_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `ijazah`
--
ALTER TABLE `ijazah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ijin_ptk`
--
ALTER TABLE `ijin_ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `indikator`
--
ALTER TABLE `indikator`
  MODIFY `id_indikator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5267;

--
-- AUTO_INCREMENT for table `jadwalku`
--
ALTER TABLE `jadwalku`
  MODIFY `jadwal_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jenis_tunggakan`
--
ALTER TABLE `jenis_tunggakan`
  MODIFY `id_tunggakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `juzamma`
--
ALTER TABLE `juzamma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `kd`
--
ALTER TABLE `kd`
  MODIFY `id_kd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1770;

--
-- AUTO_INCREMENT for table `kd_sosial`
--
ALTER TABLE `kd_sosial`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kd_spirit`
--
ALTER TABLE `kd_spirit`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `keahlian`
--
ALTER TABLE `keahlian`
  MODIFY `idke` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_keg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `kkm`
--
ALTER TABLE `kkm`
  MODIFY `id_kkm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `kkmku`
--
ALTER TABLE `kkmku`
  MODIFY `id_kkm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12103;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id_kurikulum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lingkup_materi`
--
ALTER TABLE `lingkup_materi`
  MODIFY `id_lm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1196;

--
-- AUTO_INCREMENT for table `loginattempts`
--
ALTER TABLE `loginattempts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mengajar`
--
ALTER TABLE `mengajar`
  MODIFY `id_mengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `nats`
--
ALTER TABLE `nats`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118113;

--
-- AUTO_INCREMENT for table `nh`
--
ALTER TABLE `nh`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277345;

--
-- AUTO_INCREMENT for table `nh_temp`
--
ALTER TABLE `nh_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98751;

--
-- AUTO_INCREMENT for table `nilaiun`
--
ALTER TABLE `nilaiun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nk`
--
ALTER TABLE `nk`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173545;

--
-- AUTO_INCREMENT for table `nk_temp`
--
ALTER TABLE `nk_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55815;

--
-- AUTO_INCREMENT for table `nso`
--
ALTER TABLE `nso`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4909;

--
-- AUTO_INCREMENT for table `nso_pai`
--
ALTER TABLE `nso_pai`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nso_temp`
--
ALTER TABLE `nso_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6559;

--
-- AUTO_INCREMENT for table `nsp`
--
ALTER TABLE `nsp`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3110;

--
-- AUTO_INCREMENT for table `nsp_pai`
--
ALTER TABLE `nsp_pai`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `nsp_temp`
--
ALTER TABLE `nsp_temp`
  MODIFY `id_nh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11861;

--
-- AUTO_INCREMENT for table `nuts`
--
ALTER TABLE `nuts`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76685;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8361;

--
-- AUTO_INCREMENT for table `pembayaran_temp`
--
ALTER TABLE `pembayaran_temp`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelajaran`
--
ALTER TABLE `pembelajaran`
  MODIFY `idpb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemetaan`
--
ALTER TABLE `pemetaan`
  MODIFY `id_pemetaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2329;

--
-- AUTO_INCREMENT for table `pend_terakhir`
--
ALTER TABLE `pend_terakhir`
  MODIFY `idPend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `penempatan`
--
ALTER TABLE `penempatan`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3554;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesertaun`
--
ALTER TABLE `pesertaun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `pkg`
--
ALTER TABLE `pkg`
  MODIFY `id_pkg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6008;

--
-- AUTO_INCREMENT for table `potongan_gaji`
--
ALTER TABLE `potongan_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=822;

--
-- AUTO_INCREMENT for table `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `idprestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id_printer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ptk`
--
ALTER TABLE `ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `raport`
--
ALTER TABLE `raport`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38521;

--
-- AUTO_INCREMENT for table `raport_ikm`
--
ALTER TABLE `raport_ikm`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `raport_k13`
--
ALTER TABLE `raport_k13`
  MODIFY `id_raport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52469;

--
-- AUTO_INCREMENT for table `rombel`
--
ALTER TABLE `rombel`
  MODIFY `id_rombel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `saran`
--
ALTER TABLE `saran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1383;

--
-- AUTO_INCREMENT for table `sas`
--
ALTER TABLE `sas`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sikap`
--
ALTER TABLE `sikap`
  MODIFY `id_sikap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;

--
-- AUTO_INCREMENT for table `sk`
--
ALTER TABLE `sk`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `skkb`
--
ALTER TABLE `skkb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sk_aktif`
--
ALTER TABLE `sk_aktif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slip_gaji`
--
ALTER TABLE `slip_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `smutasi`
--
ALTER TABLE `smutasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sts`
--
ALTER TABLE `sts`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `subtema`
--
ALTER TABLE `subtema`
  MODIFY `id_sub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `sumatif`
--
ALTER TABLE `sumatif`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surah`
--
ALTER TABLE `surah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `surah_pilihan`
--
ALTER TABLE `surah_pilihan`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1241;

--
-- AUTO_INCREMENT for table `surat_ijin`
--
ALTER TABLE `surat_ijin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabungan`
--
ALTER TABLE `tabungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12771;

--
-- AUTO_INCREMENT for table `tahfidz`
--
ALTER TABLE `tahfidz`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8339;

--
-- AUTO_INCREMENT for table `tapel`
--
ALTER TABLE `tapel`
  MODIFY `id_tapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telegram`
--
ALTER TABLE `telegram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `temp_pas`
--
ALTER TABLE `temp_pas`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16946;

--
-- AUTO_INCREMENT for table `temp_pts`
--
ALTER TABLE `temp_pts`
  MODIFY `idNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16656;

--
-- AUTO_INCREMENT for table `titimangsa`
--
ALTER TABLE `titimangsa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tp`
--
ALTER TABLE `tp`
  MODIFY `id_tp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tryout`
--
ALTER TABLE `tryout`
  MODIFY `id_to` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18525;

--
-- AUTO_INCREMENT for table `tunggakan_lain`
--
ALTER TABLE `tunggakan_lain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2122;

--
-- AUTO_INCREMENT for table `uas`
--
ALTER TABLE `uas`
  MODIFY `id_uas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9617;

--
-- AUTO_INCREMENT for table `ulhar`
--
ALTER TABLE `ulhar`
  MODIFY `id_ulhar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16993;

--
-- AUTO_INCREMENT for table `uts`
--
ALTER TABLE `uts`
  MODIFY `id_uts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10560;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
