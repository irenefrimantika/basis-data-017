# P02 – Kebutuhan Data Koperasi Mahasiswa 

## 1. Latar Belakang dan Aktivitas Organisasi

Koperasi Mahasiswa Sejahtera (Kopma) merupakan organisasi yang menyediakan berbagai kebutuhan mahasiswa seperti alat tulis, makanan ringan, dan minuman. Pembeli dapat berasal dari anggota koperasi maupun masyarakat umum.

Anggota koperasi melakukan pendaftaran dengan memberikan NIM, nama, program studi, dan nomor telepon. Setiap anggota memperoleh nomor anggota dengan format A-xxxx. Anggota yang berstatus aktif mendapatkan potongan harga sebesar 5% sesuai aturan koperasi.

Dalam kegiatan penjualan terdapat tiga petugas kasir yang bekerja secara bergantian. Kasir mencatat transaksi penjualan dan mencetak nota. Petugas gudang bertanggung jawab memeriksa persediaan barang. Apabila jumlah stok berada di bawah batas minimum, petugas gudang membuat pesanan pembelian kepada pemasok.

Ketika barang datang dari pemasok, petugas gudang melakukan penerimaan barang berdasarkan faktur pemasok dan menambahkan jumlah barang ke dalam stok.

Setiap bulan, ketua koperasi membutuhkan laporan mengenai omzet, barang yang paling banyak terjual, barang dengan stok rendah, dan anggota yang aktif.

Berdasarkan hasil wawancara, terdapat beberapa permasalahan, yaitu harga lama sulit diperiksa, stok terkadang menjadi negatif, dan anggota dapat dicari menggunakan NIM apabila lupa membawa kartu anggota.

---

## 2. Aktor dan Proses Bisnis

| Kode  | Proses Bisnis                   | Aktor          | Kondisi Pemicu                            |
| ----- | ------------------------------- | -------------- | ----------------------------------------- |
| PB-01 | Pendaftaran anggota             | Kasir          | Mahasiswa ingin menjadi anggota           |
| PB-02 | Pencatatan penjualan            | Kasir          | Pembeli melakukan pembayaran              |
| PB-03 | Pemesanan barang kepada pemasok | Petugas Gudang | Stok barang berada di bawah batas minimum |
| PB-04 | Penerimaan barang dari pemasok  | Petugas Gudang | Barang datang bersama faktur              |
| PB-05 | Penyusunan laporan bulanan      | Ketua          | Memasuki awal bulan                       |

---

## 3. Dokumen Sumber yang Dianalisis

Dokumen sumber yang dianalisis adalah **Nota Penjualan Kopma**.

Contoh elemen yang terdapat pada nota:

| Elemen            | Keterangan                                       |
| ----------------- | ------------------------------------------------ |
| Nomor Nota        | Identitas unik transaksi                         |
| Tanggal dan Waktu | Waktu terjadinya transaksi                       |
| Kasir             | Petugas yang mencatat transaksi                  |
| Nomor Anggota     | Identitas anggota jika pembeli merupakan anggota |
| Kode Barang       | Identitas barang yang dibeli                     |
| Nama Barang       | Nama barang yang dibeli                          |
| Jumlah            | Banyak barang yang dibeli                        |
| Harga Satuan      | Harga barang pada saat transaksi                 |
| Subtotal          | Hasil perkalian jumlah dan harga satuan          |
| Total             | Total nilai transaksi                            |

Setiap field pada dokumen sumber merupakan kandidat elemen data. Elemen seperti nomor nota, tanggal, kasir, barang, jumlah, dan harga satuan perlu disimpan untuk mendukung pencatatan transaksi.

Harga satuan pada saat transaksi perlu disimpan pada detail penjualan karena harga barang dapat berubah di kemudian hari. Dengan demikian, harga historis pada transaksi tetap dapat diketahui.

Subtotal dan total merupakan nilai turunan yang dapat dihitung dari data transaksi.

---

## 4. Entitas Kandidat dan Elemen Data

### 4.1 Anggota

Data anggota digunakan untuk menyimpan informasi mahasiswa yang menjadi anggota Kopma.

Elemen data:

* Nomor anggota
* NIM
* Nama anggota
* Program studi
* Nomor telepon
* Status aktif

### 4.2 Barang

Data barang digunakan untuk menyimpan informasi barang yang dijual.

Elemen data:

* Kode barang
* Nama barang
* Kategori
* Harga jual
* Stok
* Stok minimum

### 4.3 Penjualan

Data penjualan digunakan untuk menyimpan informasi transaksi penjualan.

Elemen data:

* Nomor nota
* Tanggal dan waktu
* Kasir
* Nomor anggota
* Pembayaran
* Total transaksi

### 4.4 Detail Penjualan

Detail penjualan digunakan untuk menyimpan barang-barang yang terdapat dalam suatu transaksi.

Elemen data:

* Nomor nota
* Kode barang
* Jumlah barang
* Harga satuan transaksi
* Subtotal

### 4.5 Petugas

Data petugas digunakan untuk menyimpan informasi petugas Kopma.

Elemen data:

* Kode petugas
* Nama petugas
* Jabatan/peran

Peran petugas dapat berupa kasir, petugas gudang, atau ketua.

### 4.6 Pemasok

Data pemasok digunakan untuk menyimpan informasi pihak yang menyediakan barang kepada Kopma.

Elemen data:

* Kode pemasok
* Nama pemasok
* Nomor telepon
* Alamat

### 4.7 Pembelian

Data pembelian digunakan untuk mencatat penerimaan/pembelian barang dari pemasok.

Elemen data:

* Nomor faktur
* Tanggal pembelian
* Kode pemasok
* Kode barang
* Jumlah barang
* Harga pembelian

---

## 5. Aturan Bisnis

| Kode  | Aturan Bisnis                                                                                                                                           |
| ----- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AB-01 | Setiap nota penjualan harus memiliki nomor nota yang unik dan minimal memiliki satu baris barang.                                                       |
| AB-02 | Penjualan dapat dilakukan tanpa anggota. Jika pembeli merupakan anggota, anggota harus berstatus aktif untuk memperoleh diskon 5%.                      |
| AB-03 | Stok barang tidak boleh bernilai negatif. Transaksi penjualan ditolak apabila jumlah yang dibeli melebihi stok tersedia.                                |
| AB-04 | Harga jual yang digunakan pada transaksi harus disimpan pada setiap detail penjualan dan tidak berubah ketika harga barang diperbarui di kemudian hari. |
| AB-05 | NIM anggota harus unik. Anggota dapat dicari menggunakan nomor anggota atau NIM.                                                                        |
| AB-06 | Pemesanan barang kepada pemasok dilakukan apabila stok barang berada di bawah batas minimum.                                                            |
| AB-07 | Setiap transaksi penjualan harus dicatat oleh petugas kasir yang bertanggung jawab terhadap transaksi tersebut.                                         |
| AB-08 | Setiap penerimaan barang dari pemasok harus berdasarkan informasi pemasok dan faktur pembelian yang dicatat.                                            |
| AB-09 | Status anggota harus menunjukkan apakah anggota masih aktif atau tidak aktif.                                                                           |
| AB-10 | Jumlah barang yang diterima dari pemasok harus ditambahkan ke stok barang.                                                                              |

---

## 6. Kebutuhan Informasi

| Kode  | Kebutuhan Informasi                                                                          | Data yang Digunakan                  |
| ----- | -------------------------------------------------------------------------------------------- | ------------------------------------ |
| KI-01 | Sistem harus dapat menampilkan omzet dan jumlah nota penjualan per hari atau per bulan.      | Penjualan, Detail Penjualan          |
| KI-02 | Sistem harus dapat menampilkan lima barang dengan jumlah penjualan terbanyak setiap bulan.   | Detail Penjualan, Barang             |
| KI-03 | Sistem harus dapat menampilkan barang yang jumlah stoknya berada di bawah stok minimum.      | Barang                               |
| KI-04 | Sistem harus dapat menampilkan sepuluh anggota dengan total pembelian terbesar setiap bulan. | Anggota, Penjualan, Detail Penjualan |
| KI-05 | Sistem harus dapat menampilkan daftar anggota yang masih berstatus aktif.                    | Anggota                              |
| KI-06 | Sistem harus dapat menampilkan riwayat transaksi berdasarkan nomor nota atau anggota.        | Penjualan, Detail Penjualan, Anggota |
| KI-07 | Sistem harus dapat menampilkan riwayat pembelian barang dari pemasok.                        | Pembelian, Pemasok, Barang           |

---

## 7. Matriks CRUD

Keterangan:

* **C** = Create
* **R** = Read
* **U** = Update
* **D** = Delete

| Proses Bisnis              | Anggota | Barang | Penjualan | Detail Penjualan | Petugas | Pemasok | Pembelian |
| -------------------------- | ------- | ------ | --------- | ---------------- | ------- | ------- | --------- |
| PB-01 Pendaftaran Anggota  | C       | -      | -         | -                | R       | -       | -         |
| PB-02 Pencatatan Penjualan | R       | R/U    | C         | C                | R       | -       | -         |
| PB-03 Pemesanan Barang     | -       | R      | -         | -                | R       | R       | C         |
| PB-04 Penerimaan Barang    | -       | U      | -         | -                | R       | R       | U         |
| PB-05 Penyusunan Laporan   | R       | R      | R         | R                | R       | R       | R         |

**Analisis CRUD:**

Data pemasok digunakan pada proses pemesanan dan penerimaan barang. Data petugas digunakan pada seluruh proses yang membutuhkan identitas petugas. Data pembelian dibuat pada proses pemesanan barang dan diperbarui pada saat penerimaan barang.

Apabila diperlukan pengelolaan khusus terhadap data pemasok, dapat ditambahkan proses bisnis **mengelola data pemasok** agar aktivitas Create, Update, dan Delete data pemasok dapat dilakukan secara eksplisit.

---

## 8. Kamus Data Awal

| Nama Data                     | Arti                             | Contoh             | Aturan Data                    | Penanggung Jawab |
| ----------------------------- | -------------------------------- | ------------------ | ------------------------------ | ---------------- |
| no_anggota                    | Nomor identitas anggota          | A-0457             | Unik, format A-4 digit         | Ketua            |
| nim_anggota                   | NIM anggota                      | 2301010123         | Unik, 10 digit                 | Ketua            |
| nama_anggota                  | Nama anggota                     | Andi Saputra       | Tidak boleh kosong             | Ketua            |
| program_studi                 | Program studi anggota            | Sistem Informasi   | Tidak boleh kosong             | Ketua            |
| no_hp_anggota                 | Nomor telepon anggota            | 081234567890       | Data pribadi, akses terbatas   | Ketua            |
| status_anggota                | Status keaktifan anggota         | Aktif              | Aktif/Tidak Aktif              | Ketua            |
| kode_barang                   | Kode identitas barang            | BRG001             | Unik                           | Petugas Gudang   |
| nama_barang                   | Nama barang                      | Buku Tulis         | Tidak boleh kosong             | Petugas Gudang   |
| kategori_barang               | Kategori barang                  | Alat Tulis         | Harus memiliki kategori        | Petugas Gudang   |
| harga_jual_barang             | Harga jual barang                | 4000               | Bilangan >= 0                  | Petugas Gudang   |
| stok_barang                   | Jumlah stok tersedia             | 35                 | Bilangan >= 0                  | Petugas Gudang   |
| stok_minimum                  | Batas minimum stok               | 10                 | Bilangan >= 0                  | Petugas Gudang   |
| no_nota_penjualan             | Nomor transaksi penjualan        | PJ-2609-0142       | Unik setiap transaksi          | Kasir            |
| waktu_penjualan               | Tanggal dan waktu transaksi      | 2026-10-06 10:30   | Format tanggal dan waktu valid | Kasir            |
| kode_petugas                  | Identitas petugas                | PTG001             | Unik                           | Ketua            |
| nama_petugas                  | Nama petugas                     | Siti               | Tidak boleh kosong             | Ketua            |
| peran_petugas                 | Peran petugas                    | Kasir              | Kasir/Gudang/Ketua             | Ketua            |
| kode_pemasok                  | Identitas pemasok                | SUP001             | Unik                           | Petugas Gudang   |
| nama_pemasok                  | Nama pemasok                     | CV Sumber Jaya     | Tidak boleh kosong             | Petugas Gudang   |
| no_hp_pemasok                 | Nomor telepon pemasok            | 08123456789        | Format nomor telepon           | Petugas Gudang   |
| alamat_pemasok                | Alamat pemasok                   | Jl. Merdeka No. 10 | Tidak boleh kosong             | Petugas Gudang   |
| kode_barang_detail            | Barang pada transaksi            | BRG001             | Harus terdaftar                | Kasir            |
| jumlah_detail_penjualan       | Jumlah barang yang dibeli        | 2                  | Bilangan > 0                   | Kasir            |
| harga_satuan_detail_penjualan | Harga barang pada saat transaksi | 4000               | Bilangan >= 0                  | Kasir            |
| subtotal_penjualan            | Nilai jumlah x harga             | 8000               | Nilai turunan                  | Kasir            |
| total_penjualan               | Total nilai transaksi            | 38000              | Nilai turunan                  | Kasir            |
| no_faktur_pembelian           | Nomor faktur pemasok             | INV001             | Unik                           | Petugas Gudang   |
| tanggal_pembelian             | Tanggal pembelian                | 2026-10-06         | Tanggal valid                  | Petugas Gudang   |
| jumlah_pembelian              | Jumlah barang yang diterima      | 50                 | Bilangan > 0                   | Petugas Gudang   |
| harga_pembelian               | Harga beli dari pemasok          | 3000               | Bilangan >= 0                  | Petugas Gudang   |

---

## 9. Kebutuhan Non-Fungsional Data

### 9.1 Volume

Sistem harus mampu menangani sekitar **85 transaksi penjualan per hari** berdasarkan parameter P = 9.

Sistem juga harus mampu menyimpan data detail barang pada setiap transaksi dan data transaksi pembelian dari pemasok.

### 9.2 Retensi

Data transaksi penjualan dan pembelian harus disimpan minimal selama **5 tahun** agar riwayat transaksi dan kebutuhan pelaporan dapat dipenuhi.

### 9.3 Privasi

Data nomor telepon anggota merupakan data pribadi. Akses terhadap nomor telepon anggota dibatasi kepada pihak yang berwenang, terutama ketua atau petugas yang diberi kewenangan.

### 9.4 Integritas Data

Nilai stok barang tidak boleh menjadi negatif. Sistem harus menolak transaksi penjualan apabila jumlah barang yang diminta lebih besar daripada stok tersedia.

### 9.5 Konsistensi Data

Nomor anggota, NIM, kode barang, nomor nota, kode petugas, dan kode pemasok harus memiliki identitas yang unik sehingga tidak terjadi duplikasi data.

---

## 10. Isu Kualitas Data yang Diantisipasi

Beberapa masalah kualitas data yang mungkin terjadi pada sistem Kopma adalah:

1. Data anggota dapat mengalami duplikasi apabila NIM tidak divalidasi sebagai data unik.
2. Nomor telepon anggota dapat memiliki format yang tidak konsisten.
3. Stok dapat menjadi negatif apabila transaksi penjualan tidak divalidasi terhadap stok tersedia.
4. Harga lama dapat hilang apabila sistem hanya menyimpan harga barang terbaru.
5. Data transaksi dapat menjadi tidak lengkap apabila nomor nota atau detail barang tidak dicatat.
6. Data anggota yang sudah tidak aktif dapat tetap memperoleh diskon apabila status anggota tidak diperiksa.
7. Data pemasok dapat mengalami duplikasi apabila tidak menggunakan kode pemasok yang unik.
8. Jumlah stok dapat tidak sesuai apabila penerimaan barang dari pemasok tidak segera dicatat.
9. Data historis transaksi dapat berubah apabila harga pada transaksi tidak disimpan secara khusus.
10. Kesalahan input jumlah barang dapat menyebabkan informasi penjualan dan stok menjadi tidak akurat.

---

## Parameter Proyek

NIM terakhir: **17**

Perhitungan:

**P = (17 mod 9) + 1**

**P = 8 + 1 = 9**

Dengan demikian:

* Parameter P = **9**
* Maksimal item per transaksi = **P + 2 = 11 item**
* Perkiraan volume transaksi harian = **40 + (5 × P) = 85 transaksi/hari**

---

## Kesimpulan

Analisis kebutuhan data Kopma menghasilkan proses bisnis, aktor, entitas kandidat, aturan bisnis, kebutuhan informasi, matriks CRUD, kamus data awal, kebutuhan non-fungsional, serta isu kualitas data.

Hasil analisis ini akan digunakan sebagai dasar untuk tahap perancangan basis data pada modul berikutnya.


