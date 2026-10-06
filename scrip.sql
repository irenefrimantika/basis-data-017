CREATE DATABASE IF NOT EXISTS perpustakaan_irene
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE perpustakaan_irene;

CREATE TABLE kategori (
    id_kategori INT AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL,
    keterangan VARCHAR(255),

    CONSTRAINT pk_kategori
        PRIMARY KEY (id_kategori),

    CONSTRAINT uq_kategori_nama
        UNIQUE (nama_kategori)
);
