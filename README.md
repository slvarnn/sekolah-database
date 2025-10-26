# Project Membuat Database Sekolah  

## Deskripsi Proyek  
Proyek ini merupakan bagian dari tugas *Back-End Development* yang berfokus pada pembuatan dan pengelolaan **database sekolah** menggunakan **MySQL**.  

Database berisi dua tabel utama:  
- **siswa** → Menyimpan data siswa seperti nama, umur, dan jurusan.  
- **nilai** → Menyimpan data nilai siswa berdasarkan mata pelajaran.  

Proyek ini juga mencakup praktik CRUD dasar, relasi antar tabel (Primary & Foreign Key), serta penggunaan query lanjutan seperti `JOIN` dan `GROUP BY`.

---

## Struktur Database  

### Tabel `siswa`
Menyimpan data utama siswa.  
| Kolom | Tipe Data | Keterangan |
|--------|------------|------------|
| id | INT (PK, AUTO_INCREMENT) | ID unik tiap siswa |
| nama | VARCHAR(100), NOT NULL | Nama siswa |
| umur | INT | Umur siswa |
| jurusan | VARCHAR(50) | Jurusan siswa |

### Tabel `nilai`
Menyimpan nilai siswa untuk setiap mata pelajaran.  
| Kolom | Tipe Data | Keterangan |
|--------|------------|------------|
| id | INT (PK, AUTO_INCREMENT) | ID unik tiap nilai |
| siswa_id | INT (FK → siswa.id) | Relasi ke tabel siswa |
| mata_pelajaran | VARCHAR(100) | Nama mata pelajaran |
| nilai | INT | Nilai siswa |

### Relasi Antar Tabel
- Setiap **satu siswa** dapat memiliki **banyak nilai** (*one-to-many relationship*).  
- Relasi diimplementasikan dengan `FOREIGN KEY (siswa_id) REFERENCES siswa(id)`.

---

### Contoh Implementasi SQL
```sql
CREATE DATABASE sekolah;
USE sekolah;

CREATE TABLE siswa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  umur INT,
  jurusan VARCHAR(50)
);

CREATE TABLE nilai (
  id INT AUTO_INCREMENT PRIMARY KEY,
  siswa_id INT,
  mata_pelajaran VARCHAR(100),
  nilai INT,
  FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);
```

---

## Contoh Data

```sql
INSERT INTO siswa (nama, umur, jurusan)
VALUES
("Andi", 16, "IPA"),
("Budi", 17, "IPS"),
("Citra", 16, "IPA"),
("Doni", 17, "Bahasa"),
("Eka", 16, "IPS");

INSERT INTO nilai (siswa_id, mata_pelajaran, nilai)
VALUES
(1, "Matematika", 85),
(2, "Bahasa Inggris", 90),
(3, "Fisika", 78),
(4, "Sejarah", 88),
(5, "Ekonomi", 92);
```

---

## Query Contoh

```sql
-- Menampilkan semua siswa
SELECT * FROM siswa;

-- Menampilkan siswa jurusan IPA
SELECT * FROM siswa WHERE jurusan = "IPA";

-- Menampilkan rata-rata nilai tiap siswa
SELECT siswa.nama, AVG(nilai.nilai) AS rata_nilai
FROM siswa
JOIN nilai ON siswa.id = nilai.siswa_id
GROUP BY siswa.nama;
```

---

## Update & Delete

```sql
-- Update jurusan siswa
UPDATE siswa SET jurusan = "IPS" WHERE id = 1;

-- Hapus salah satu nilai
DELETE FROM nilai WHERE id = 3;
```
