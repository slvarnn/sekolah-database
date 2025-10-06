-- Changed 06 September 2024
database_sekolah.sql

-- ================================================
-- #1: Membuat Database Sekolah
-- ================================================


-- ================================================
-- Bag2ian 2: Membuat Tabel dan Relasi
-- ================================================
-- CREATE TABEL siswa
CREATE TABLE siswa (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    umur INT,
    jurusan VARCHAR(100)
);

-- CREATE TABEL nilai
CREATE TABLE nilai (
    id SERIAL PRIMARY KEY,
    siswa_id INT REFERENCES siswa(id),
    mata_pelajaran VARCHAR(100),
    nilai INT
);


-- ================================================
-- Bagian 3: Isi Data (INSERT)
-- ================================================
-- Memasukkan data ke tabel siswa
INSERT INTO siswa (nama, umur, jurusan) VALUES
('Andi', 16, 'IPA'),
('Budi', 17, 'IPS'),
('Citra', 16, 'IPA'),
('Dian', 18, 'Bahasa'),
('Eko', 17, 'IPA');

-- Memasukkan data ke tabel nilai
INSERT INTO nilai (siswa_id, mata_pelajaran, nilai) VALUES
(1, 'Matematika', 85), -- Nilai untuk Andi
(1, 'Fisika', 90),     -- Nilai lain untuk Andi
(2, 'Ekonomi', 78),    -- Nilai untuk Budi
(2, 'Sosiologi', 82),  -- Nilai lain untuk Budi
(3, 'Biologi', 92),    -- Nilai untuk Citra
(3, 'Kimia', 88),      -- Nilai lain untuk Citra
(4, 'Bahasa Inggris', 95), -- Nilai untuk Dian
(4, 'Sastra Indonesia', 89), -- Nilai lain untuk Dian
(5, 'Matematika', 80), -- Nilai untuk Eko
(5, 'Fisika', 75);     -- Nilai lain untuk Eko


-- ================================================
-- Bagian 4: Query Data (SELECT)
-- ================================================
-- Menampilkan semua siswa
SELECT * FROM siswa;

-- Menampilkan nama siswa dengan jurusan IPA
SELECT nama, jurusan FROM siswa WHERE jurusan = 'IPA';

-- Menampilkan nilai rata-rata tiap siswa (menggunakan JOIN dan GROUP BY)
SELECT
     s.nama,
     AVG(n.nilai) AS rata_rata_nilai
FROM
     siswa s
JOIN
     nilai n ON s.id = n.siswa_id
GROUP BY
     s.nama;


-- ============================================================
-- Bagian 5: Update & Delete (Data Manipulation Language - DML)
-- ============================================================
-- Update jurusan salah satu siswa (contoh: Eko menjadi 'Bahasa')
UPDATE siswa
SET jurusan = 'Bahasa'
WHERE nama = 'Eko';

-- Verifikasi update (dijalankan setelah melakukan UPDATE di atas)
SELECT * FROM siswa WHERE nama = 'Eko';

-- Hapus salah satu data nilai siswa
DELETE FROM nilai
WHERE siswa_id = 1 AND mata_pelajaran = 'Matematika';

-- Verifikasi delete (dijalankan setelah melakukan DELETE di atas)
SELECT * FROM nilai WHERE siswa_id = 1;