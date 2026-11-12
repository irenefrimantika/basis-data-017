1. Dokumen sumber sebagai UNF

Dokumen sumber yang digunakan adalah Slip Peminjaman Perpustakaan Irene Frimantika. Data yang terdapat pada dokumen meliputi nomor peminjaman, nomor anggota, nama anggota, tanggal peminjaman, tanggal jatuh tempo, kode eksemplar, judul buku, jumlah buku, dan petugas.

Bentuk UNF:

PEMINJAMAN_UNF (
    nomor_peminjaman,
    nomor_anggota,
    nama_anggota,
    tanggal_peminjaman,
    tanggal_jatuh_tempo,
    petugas,
    {
        kode_eksemplar,
        judul_buku,
        jumlah
    }
)

Bagian {...} merupakan kelompok data berulang karena satu peminjaman dapat berisi beberapa buku.

2. Functional Dependency
Berdasarkan aturan bisnis dan elemen data P02, dependency yang perlu diperiksa adalah:
nomor_peminjaman
→ nomor_anggota,
  tanggal_peminjaman,
  tanggal_jatuh_tempo,
  petugas
nomor_anggota
→ nama_anggota
kode_eksemplar
→ judul_buku
(nomor_peminjaman, kode_eksemplar)
→ jumlah
Kode AB: masukkan kode AB dari Modul 2 kamu pada masing-masing FD. Saya tidak mengarang nomor AB karena file P02 Perpustakaan yang tersedia di sini tidak mencantumkan kode AB-01, AB-02, dan seterusnya.

3. Tahap 1NF
Setelah kelompok data berulang dihilangkan:
PEMINJAMAN_1NF (
    nomor_peminjaman,
    kode_eksemplar,
    nomor_anggota,
    nama_anggota,
    tanggal_peminjaman,
    tanggal_jatuh_tempo,
    petugas,
    judul_buku,
    jumlah
)
Kunci sementara:
(nomor_peminjaman, kode_eksemplar)

4. Tahap 2NF
Atribut yang hanya bergantung pada sebagian kunci komposit dipisahkan.
PEMINJAMAN (
    nomor_peminjaman,
    nomor_anggota,
    tanggal_peminjaman,
    tanggal_jatuh_tempo,
    petugas
)
EKSEMPLAR (
    kode_eksemplar,
    judul_buku
)
DETAIL_PEMINJAMAN (
    nomor_peminjaman,
    kode_eksemplar,
    jumlah
)
Pemisahan ini sesuai dengan P02 yang memang membedakan Peminjaman, Detail Peminjaman, dan Eksemplar.

5. Tahap 3NF
Pada tabel PEMINJAMAN, data anggota tidak perlu disimpan berulang sebagai nama anggota.
Maka dibuat tabel:
ANGGOTA (
    nomor_anggota,
    nama_anggota
)
Sehingga struktur utamanya menjadi:
ANGGOTA
    ↓
PEMINJAMAN
    ↓
DETAIL_PEMINJAMAN
    ↓
EKSEMPLAR
P02 juga memang memisahkan entitas Anggota, Buku, Eksemplar, Peminjaman, dan Detail Peminjaman.

6. Pemeriksaan BCNF
Pemeriksaan BCNF dilakukan dengan memastikan setiap determinant merupakan candidate key.
Contoh:
nomor_peminjaman → tanggal_peminjaman
nomor_peminjaman merupakan kunci pada tabel PEMINJAMAN.
Pada detail:
(nomor_peminjaman, kode_eksemplar) → jumlah
Kombinasi tersebut menjadi kunci DETAIL_PEMINJAMAN.
Kesimpulan sementara: struktur tersebut dapat memenuhi BCNF selama tidak ada dependency lain yang belum tercatat dari aturan bisnis proyek.

7. Nilai Turunan
Pada proyek perpustakaan, denda keterlambatan merupakan nilai yang dapat dihitung berdasarkan keterlambatan dan tarif denda.
Dari P02:
denda = jumlah hari terlambat × Rp9.000
Parameter proyek P02 menetapkan denda Rp9.000 per hari per eksemplar.
Untuk nilai historis pembayaran denda, penyimpanan dapat dipertimbangkan agar jumlah yang telah dibayarkan tetap tercatat sesuai kondisi saat transaksi.

8. Perubahan ERD
Jika hasil normalisasi menyebabkan perubahan ERD, struktur yang perlu dipastikan adalah:
ANGGOTA
   │
   └── PEMINJAMAN
          │
          └── DETAIL_PEMINJAMAN
                    │
                    └── EKSEMPLAR
                           │
                           └── BUKU

Selain itu, BUKU tetap berhubungan dengan KATEGORI dan PENERBIT, sesuai entitas yang sudah ditentukan pada P02. P02 mencatat bahwa satu judul buku dapat memiliki beberapa eksemplar fisik dengan kode berbeda.

9. Catatan perubahan ERD

Untuk file:

p04_normalisasi_<NIM>.md

kamu bisa mencatat perubahan dengan format:

Perubahan ERD:
1. Peminjaman dipisahkan dari Detail Peminjaman karena satu transaksi dapat memiliki beberapa buku.
2. Data anggota dipisahkan dari Peminjaman untuk mengurangi redundansi.
3. Eksemplar tetap dipisahkan dari Buku karena satu judul dapat memiliki beberapa buku fisik.
4. Struktur hasil normalisasi digunakan sebagai dasar skema relasional Modul 5.

