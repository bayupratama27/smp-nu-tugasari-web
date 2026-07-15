CREATE DATABASE smp_nu_tugasari;
USE smp_nu_tugasari;

-- Tabel Users (Admin, Guru, Operator)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- Bcrypt hash
    role ENUM('super_admin', 'admin', 'operator', 'guru', 'editor') DEFAULT 'editor',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Guru & Staff
CREATE TABLE staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    nip VARCHAR(20),
    jabatan VARCHAR(50),
    mata_pelajaran VARCHAR(50),
    pendidikan VARCHAR(50),
    email VARCHAR(100),
    no_hp VARCHAR(15),
    foto_url VARCHAR(255),
    jenis ENUM('guru', 'staff') DEFAULT 'guru'
);

-- Tabel Berita & Pengumuman
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    konten TEXT NOT NULL,
    gambar_url VARCHAR(255),
    kategori ENUM('berita', 'pengumuman', 'agenda') DEFAULT 'berita',
    penulis_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (penulis_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Tabel PPDB
CREATE TABLE ppdb (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_lengkap VARCHAR(100) NOT NULL,
    tempat_lahir VARCHAR(50),
    tanggal_lahir DATE,
    alamat TEXT,
    asal_sekolah VARCHAR(100),
    nama_ortu VARCHAR(100),
    no_hp_ortu VARCHAR(15),
    file_kk_url VARCHAR(255),
    file_akta_url VARCHAR(255),
    file_foto_url VARCHAR(255),
    file_rapor_url VARCHAR(255),
    status ENUM('pending', 'diterima', 'ditolak') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Pengaturan Website
CREATE TABLE settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    logo_url VARCHAR(255),
    favicon_url VARCHAR(255),
    nama_sekolah VARCHAR(100) DEFAULT 'SMP NU TUGASARI',
    alamat TEXT,
    email VARCHAR(100),
    whatsapp VARCHAR(15),
    facebook_url VARCHAR(255),
    instagram_url VARCHAR(255),
    jam_operasional VARCHAR(100)
);

-- Insert Admin Default (Password: admin123 - hash bcrypt)
INSERT INTO users (username, password, role) VALUES ('admin', '$2b$10$YourBcryptHashHere', 'super_admin');