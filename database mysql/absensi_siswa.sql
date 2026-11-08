-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Nov 2026 pada 17.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_siswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('hadir','izin','sakit','alfa') NOT NULL,
  `check_in_time` time DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `attendances`
--

INSERT INTO `attendances` (`id`, `student_id`, `date`, `status`, `check_in_time`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-11-04', 'hadir', '06:45:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(2, 1, '2026-11-05', 'hadir', '06:46:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(3, 1, '2026-11-06', 'hadir', '06:47:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(4, 1, '2026-11-07', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(5, 1, '2026-11-08', 'hadir', '06:49:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(6, 2, '2026-11-04', 'hadir', '06:46:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(7, 2, '2026-11-05', 'hadir', '06:47:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(8, 2, '2026-11-06', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(9, 2, '2026-11-07', 'hadir', '06:49:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(10, 2, '2026-11-08', 'sakit', NULL, 'Sakit', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(11, 3, '2026-11-04', 'hadir', '06:47:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(12, 3, '2026-11-05', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(13, 3, '2026-11-06', 'hadir', '06:49:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(14, 3, '2026-11-07', 'sakit', NULL, 'Sakit', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(15, 3, '2026-11-08', 'hadir', '06:51:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(16, 4, '2026-11-04', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(17, 4, '2026-11-05', 'hadir', '06:49:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(18, 4, '2026-11-06', 'sakit', NULL, 'Sakit', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(19, 4, '2026-11-07', 'hadir', '06:51:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(20, 4, '2026-11-08', 'hadir', '06:52:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(21, 5, '2026-11-04', 'hadir', '06:49:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(22, 5, '2026-11-05', 'sakit', NULL, 'Sakit', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(23, 5, '2026-11-06', 'hadir', '06:51:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(24, 5, '2026-11-07', 'hadir', '06:52:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(25, 5, '2026-11-08', 'alfa', NULL, 'Tanpa keterangan', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(26, 6, '2026-11-04', 'sakit', NULL, 'Sakit', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(27, 6, '2026-11-05', 'hadir', '06:51:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(28, 6, '2026-11-06', 'hadir', '06:52:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(29, 6, '2026-11-07', 'alfa', NULL, 'Tanpa keterangan', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(30, 6, '2026-11-08', 'hadir', '06:54:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(31, 10, '2026-11-04', 'hadir', '06:54:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(32, 10, '2026-11-05', 'hadir', '06:55:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(33, 10, '2026-11-06', 'hadir', '06:56:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(34, 10, '2026-11-07', 'hadir', '06:57:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(35, 10, '2026-11-08', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(36, 11, '2026-11-04', 'hadir', '06:55:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(37, 11, '2026-11-05', 'hadir', '06:56:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(38, 11, '2026-11-06', 'hadir', '06:57:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(39, 11, '2026-11-07', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(40, 11, '2026-11-08', 'hadir', '06:59:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(41, 12, '2026-11-04', 'hadir', '06:56:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(42, 12, '2026-11-05', 'hadir', '06:57:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(43, 12, '2026-11-06', 'izin', NULL, 'Keterangan keluarga', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(44, 12, '2026-11-07', 'hadir', '06:59:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(45, 12, '2026-11-08', 'hadir', '06:45:00', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lesson_hours`
--

CREATE TABLE `lesson_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_number` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_break` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lesson_hours`
--

INSERT INTO `lesson_hours` (`id`, `session_number`, `name`, `start_time`, `end_time`, `is_break`, `created_at`, `updated_at`) VALUES
(1, 1, 'JP 1', '07:00:00', '07:45:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(2, 2, 'JP 2', '07:45:00', '08:30:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(3, 3, 'JP 3', '08:30:00', '09:15:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(4, 4, 'JP 4', '09:15:00', '10:00:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(5, 5, 'Istirahat 1', '10:00:00', '10:15:00', 1, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(6, 6, 'JP 5', '10:15:00', '11:00:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(7, 7, 'JP 6', '11:00:00', '11:45:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(8, 8, 'JP 7', '11:45:00', '12:30:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(9, 9, 'Istirahat 2 / Ishoma', '12:30:00', '13:00:00', 1, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(10, 10, 'JP 8', '13:00:00', '13:45:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(11, 11, 'JP 9', '13:45:00', '14:30:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(12, 12, 'JP 10', '14:30:00', '15:15:00', 0, '2026-11-08 15:55:18', '2026-11-08 15:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lesson_schedules`
--

CREATE TABLE `lesson_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_class_id` bigint(20) UNSIGNED NOT NULL,
  `day_of_week` tinyint(3) UNSIGNED NOT NULL,
  `lesson_hour_id` bigint(20) UNSIGNED NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `teacher_name` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lesson_schedules`
--

INSERT INTO `lesson_schedules` (`id`, `school_class_id`, `day_of_week`, `lesson_hour_id`, `subject_name`, `teacher_name`, `room`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Upacara / Pembinaan', 'Tim Kesiswaan', 'Lapangan', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(2, 1, 1, 2, 'Matematika', 'Budi Santoso, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(3, 1, 1, 3, 'Matematika', 'Budi Santoso, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(4, 1, 1, 4, 'Bahasa Indonesia', 'Sri Lestari, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(5, 1, 1, 6, 'Dasar PPLG', 'Dewi Kartika, S.Kom.', 'Lab RPL', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(6, 1, 1, 7, 'Dasar PPLG', 'Dewi Kartika, S.Kom.', 'Lab RPL', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(7, 1, 1, 8, 'Informatika', 'Dewi Kartika, S.Kom.', 'Lab RPL', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(8, 1, 2, 1, 'Bahasa Inggris', 'Nur Aisyah, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(9, 1, 2, 2, 'Bahasa Inggris', 'Nur Aisyah, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(10, 1, 2, 3, 'Pendidikan Pancasila', 'Hendra Wijaya, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(11, 1, 2, 4, 'Pendidikan Pancasila', 'Hendra Wijaya, S.Pd.', 'R. X RPL 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(12, 1, 2, 6, 'Dasar PPLG', 'Dewi Kartika, S.Kom.', 'Lab RPL', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(13, 1, 2, 7, 'Dasar PPLG', 'Dewi Kartika, S.Kom.', 'Lab RPL', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(14, 3, 1, 1, 'Upacara / Pembinaan', 'Tim Kesiswaan', 'Lapangan', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(15, 3, 1, 2, 'Matematika', 'Budi Santoso, S.Pd.', 'R. X TKJ 1', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(16, 3, 1, 3, 'Dasar TJKT', 'Rina Wulandari, S.T.', 'Lab Jaringan', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(17, 3, 1, 4, 'Dasar TJKT', 'Rina Wulandari, S.T.', 'Lab Jaringan', NULL, '2026-11-08 15:55:18', '2026-11-08 15:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `code`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'RPL', 'Rekayasa Perangkat Lunak', 'Pengembangan perangkat lunak dan gim.', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(2, 'TKJ', 'Teknik Komputer dan Jaringan', 'Jaringan komputer dan administrasi sistem.', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(3, 'AKL', 'Akuntansi dan Keuangan Lembaga', 'Akuntansi dan keuangan.', '2026-11-08 15:55:18', '2026-11-08 15:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_11_08_222612_create_school_classes_table', 1),
(5, '2026_11_08_222612_create_students_table', 1),
(6, '2026_11_08_222613_create_attendances_table', 1),
(7, '2026_11_08_224209_create_majors_table', 2),
(8, '2026_11_08_224210_add_major_id_to_school_classes_table', 2),
(9, '2026_11_08_225107_create_lesson_hours_table', 3),
(10, '2026_11_08_225107_create_lesson_schedules_table', 3),
(11, '2026_11_08_225744_add_role_to_users_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `school_classes`
--

CREATE TABLE `school_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `major_id` bigint(20) UNSIGNED DEFAULT NULL,
  `grade_level` varchar(255) DEFAULT NULL,
  `homeroom_teacher` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `school_classes`
--

INSERT INTO `school_classes` (`id`, `name`, `major_id`, `grade_level`, `homeroom_teacher`, `created_at`, `updated_at`) VALUES
(1, 'X RPL 1', 1, 'X', 'Dewi Kartika, S.Kom.', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(2, 'XI RPL 1', 1, 'XI', 'Ahmad Fauzi, S.Pd.', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(3, 'X TKJ 1', 2, 'X', 'Rina Wulandari, S.T.', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(4, 'X AKL 1', 3, 'X', 'Siti Aminah, S.E.', '2026-11-08 15:55:18', '2026-11-08 15:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('10kWHEInkPVm8DGIxByXIgmzNrPSaIXBeDizOHkI', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZkc3ZWljbzA0UmpOY0NtYjljUUx5U0NudDVrbGVPcFFtamt6Q0dxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zdHVkZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkZ1FWcnQ5a05WcHZKUmFNNS43SU9pLlVUYXU4cklsT2JzakplYzhrLzV1Lmx4WjBiTGJJNmUiO3M6NjoidGFibGVzIjthOjE6e3M6MTk6Ikxpc3RNYWpvcnNfcGVyX3BhZ2UiO3M6MjoiMTAiO319', 1794154152),
('CUXHhbTklxE579QTJIe3Rgaln5JWuWfe1hUGXZ5v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRG02aDkwbkdSQkxPY1V2NU1xS3NETFRhUzN2R1VKckNoNkJMRTd2RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fX0=', 1794153013),
('GwNQYqCK2CqsC9PGD1N9bqIh9uhyLVxpbbmEQ3xg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFpCbG1LMFFDS2FHTUMzR0ZGNEh0cUxYR3BKdElyR2tzYzFMckFMciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1794152973),
('lMQIgidKmEJU3Bg4chZAFBu76dWJYwtV7dUlw3SQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.145.0 Chrome/150.0.7871.250 Electron/43.8.3 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3g2eVo1bVRGc3kxVjFHaFFhUWNzU3U3N1I1NzFRcG05cXl1TUF6RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1794151912),
('zlbcptBM3f6vSs6cau7iyrXVFifmnML5ddg32QeN', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNVRGQnlxVVJOYmRGbjhycmJmR0FUUU1qaWdWRkVDRlJQSENEbmZLcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fX0=', 1794153172);

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nis` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `school_class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `nis`, `name`, `gender`, `school_class_id`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, '24251001', 'Aditya Pratama', 'L', 1, '081234500101', 'Jl. Melati No. 12, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(2, '24251002', 'Aulia Rahmawati', 'P', 1, '081234500102', 'Jl. Kenanga No. 5, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(3, '24251003', 'Bagas Saputra', 'L', 1, '081234500103', 'Jl. Mawar No. 8, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(4, '24251004', 'Citra Lestari', 'P', 1, '081234500104', 'Jl. Anggrek No. 21, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(5, '24251005', 'Dimas Arya', 'L', 1, '081234500105', 'Jl. Dahlia No. 3, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(6, '24251006', 'Eka Putri', 'P', 1, '081234500106', 'Jl. Flamboyan No. 14, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(7, '23251001', 'Fajar Nugroho', 'L', 2, '081234500201', 'Jl. Cempaka No. 7, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(8, '23251002', 'Gita Anjani', 'P', 2, '081234500202', 'Jl. Teratai No. 9, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(9, '23251003', 'Hadi Prasetyo', 'L', 2, '081234500203', 'Jl. Kamboja No. 11, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(10, '24252001', 'Intan Permata', 'P', 3, '081234500301', 'Jl. Seruni No. 2, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(11, '24252002', 'Joko Susilo', 'L', 3, '081234500302', 'Jl. Tulip No. 6, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(12, '24252003', 'Kirana Dewi', 'P', 3, '081234500303', 'Jl. Sakura No. 18, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(13, '24253001', 'Lukman Hakim', 'L', 4, '081234500401', 'Jl. Bougenville No. 4, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(14, '24253002', 'Maya Sari', 'P', 4, '081234500402', 'Jl. Gardenia No. 10, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18'),
(15, '24253003', 'Nanda Pratama', 'L', 4, '081234500403', 'Jl. Alamanda No. 15, Kota setempat', '2026-11-08 15:55:18', '2026-11-08 15:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'guru',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', 'admin', NULL, '$2y$12$gQVrt9kNVpvJRaM5.7IOi.UTau8rIlObsjJec8k/5u.lxZ0bLbI6e', NULL, '2026-11-08 15:28:17', '2026-11-08 15:58:26'),
(3, 'Guru Contoh', 'guru@example.com', 'guru', NULL, '$2y$12$P3hsahKfvfcOQV5qgCkzXeKQFJOgU9.bUSSJ1pWwzB40fq.2oOu5.', NULL, '2026-11-08 15:58:27', '2026-11-08 15:58:27');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendances_student_id_date_unique` (`student_id`,`date`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lesson_hours`
--
ALTER TABLE `lesson_hours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lesson_hours_session_number_unique` (`session_number`);

--
-- Indeks untuk tabel `lesson_schedules`
--
ALTER TABLE `lesson_schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lesson_schedule_unique` (`school_class_id`,`day_of_week`,`lesson_hour_id`),
  ADD KEY `lesson_schedules_lesson_hour_id_foreign` (`lesson_hour_id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `majors_code_unique` (`code`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `school_classes`
--
ALTER TABLE `school_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_classes_name_unique` (`name`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_nis_unique` (`nis`),
  ADD KEY `students_school_class_id_foreign` (`school_class_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lesson_hours`
--
ALTER TABLE `lesson_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `lesson_schedules`
--
ALTER TABLE `lesson_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `school_classes`
--
ALTER TABLE `school_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lesson_schedules`
--
ALTER TABLE `lesson_schedules`
  ADD CONSTRAINT `lesson_schedules_lesson_hour_id_foreign` FOREIGN KEY (`lesson_hour_id`) REFERENCES `lesson_hours` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_schedules_school_class_id_foreign` FOREIGN KEY (`school_class_id`) REFERENCES `school_classes` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_school_class_id_foreign` FOREIGN KEY (`school_class_id`) REFERENCES `school_classes` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
