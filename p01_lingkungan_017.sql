-- p01_lingkungan_25430017.sql
-- Praktikum Basis Data - Pertemuan 1
-- Nama  : Irene Frimantika
-- NIM   : 25430017
-- Tema  : Perpustakaan
-- Kode  : perpus
-- Password sengaja diganti penanda.
-- JANGAN menuliskan password asli ke GitHub.

-- =====================================================
-- 1. Membuat basis data proyek
-- =====================================================

CREATE DATABASE IF NOT EXISTS perpus_017
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- =====================================================
-- 2. Membuat akun developer
-- =====================================================

CREATE USER IF NOT EXISTS 'dev_017'@'localhost'
    IDENTIFIED BY '<password_dev>';

-- Memberikan hak hanya pada database proyek
GRANT ALL PRIVILEGES
    ON perpus_017.*
    TO 'dev_017'@'localhost';

-- Menerapkan perubahan hak akses
FLUSH PRIVILEGES;

-- =====================================================
-- 3. Memilih database proyek
-- =====================================================

USE perpus_017;

-- =====================================================
-- 4. Verifikasi database dan akun
-- =====================================================

SELECT VERSION(), CURRENT_USER();

SHOW DATABASES;

-- Memeriksa hak akses akun developer
SHOW GRANTS FOR 'dev_017'@'localhost';
