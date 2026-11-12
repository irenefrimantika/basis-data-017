D.1 Dari UNF ke 1NF
1. UNF
NOTA_UNF (
no_nota_penjualan,
waktu_penjualan,
kode_petugas,
nama_petugas,
no_anggota,
nama_anggota,
{
kode_barang,
nama_barang,
jumlah_detail_penjualan,
harga_satuan_detail_penjualan,
subtotal_penjualan
},
total_penjualan
)
2. 1NF

Kelompok berulang dihilangkan sehingga setiap barang menjadi satu baris.

NOTA_1NF (
no_nota_penjualan,
kode_barang,
waktu_penjualan,
kode_petugas,
nama_petugas,
no_anggota,
nama_anggota,
nama_barang,
jumlah_detail_penjualan,
harga_satuan_detail_penjualan,
subtotal_penjualan,
total_penjualan
)
D.2 Dependensi Fungsional
FD1: no_nota_penjualan
     → waktu_penjualan, kode_petugas, no_anggota

FD2: kode_petugas
     → nama_petugas, peran_petugas

FD3: no_anggota
     → nama_anggota, program_studi,
       no_hp_anggota, status_anggota

FD4: kode_barang
     → nama_barang, kategori_barang,
       harga_jual_barang, stok_barang, stok_minimum

FD5: (no_nota_penjualan, kode_barang)
     → jumlah_detail_penjualan,
       harga_satuan_detail_penjualan

       Nilai turunan
subtotal_penjualan
= jumlah_detail_penjualan × harga_satuan_detail_penjualan

total_penjualan
= Σ subtotal_penjualan

 D.3 Menuju 2NF dan 3NF

 4. 2NF
 
FD1 dan FD4 hanya bergantung pada sebagian kunci komposit. Oleh karena itu, data dipisahkan menjadi tabel **PENJUALAN** dengan kunci `no_nota_penjualan` dan **BARANG** dengan kunci `kode_barang`. Data lainnya menjadi **DETAIL_PENJUALAN**.

```text
PENJUALAN (
no_nota_penjualan,
tgl_penjualan,
kode_petugas,
no_anggota,
bayar_penjualan
)

BARANG (
kode_barang,
nama_barang,
kategori_barang,
harga_jual_barang,
stok_barang,
stok_min_barang
)

DETAIL_PENJUALAN (
no_nota_penjualan,
kode_barang,
qty_detail_penjualan,
harga_satuan_detail_penjualan
)
```

 5. 3NF

Pada tabel PENJUALAN terdapat ketergantungan transitif:

```text
no_nota_penjualan → kode_petugas → nama_petugas
no_nota_penjualan → no_anggota → nama_anggota
```

Oleh karena itu, data petugas dan anggota dipisahkan menjadi tabel masing-masing.

```text
PETUGAS (
kode_petugas,
nama_petugas,
peran_petugas
)

ANGGOTA (
no_anggota,
nim_anggota,
nama_anggota,
prodi_anggota,
no_hp_anggota,
status_anggota,
tgl_daftar_anggota
)
```

 6. Nilai Turunan

Nilai `subtotal_detail_penjualan` dan `total_penjualan` **tidak disimpan** pada tabel operasional karena dapat dihitung dari data detail penjualan.

```text
subtotal = qty × harga_satuan
total = Σ subtotal
```

Dengan demikian, skema 3NF akhirnya terdiri dari:

```text
PENJUALAN
DETAIL_PENJUALAN
BARANG
PETUGAS
ANGGOTA
```

