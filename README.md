# Tugas Rutin 5 – Aplikasi UMKM Kuliner Medan

## A. Identitas

- **Nama:** Chelsea Febiola br Sebayang
- **NIM:** 4243250015
- **Mata Kuliah:** Pemrograman Mobile
- **Program Studi:** Ilmu Komputer
- **Universitas:** Universitas Negeri Medan
- **Tugas:** Pertemuan 5

## B. Deskripsi Aplikasi

Aplikasi Dapur Medan merupakan aplikasi berbasis Flutter yang dibuat untuk menampilkan informasi usaha kuliner khas Medan. Aplikasi ini menyediakan informasi profil usaha, deskripsi, alamat, nomor telepon, dan email.

Aplikasi memiliki dua kategori menu, yaitu makanan dan minuman. Kategori makanan terdiri dari Nasi Goreng Medan, Mie Gomak, Soto Medan, Bika Ambon, Lontong Medan, Mie Sop, Mie Balap, dan Nasi Campur Medan. Kategori minuman terdiri dari Teh Manis Dingin, Kopi Sidikalang, Es Campur, Es Teler, dan Bandrek.

Setiap menu ditampilkan menggunakan widget `KartuMenu` yang dibuat dengan StatelessWidget. Aplikasi juga menyediakan fitur favorit menggunakan StatefulWidget sehingga pengguna dapat menambahkan atau menghapus menu dari daftar favorit. Ketika tombol favorit ditekan, aplikasi menampilkan pemberitahuan menggunakan SnackBar.

Tampilan aplikasi menggunakan Material Design 3 dengan tema terang dan gelap. Pengguna dapat mengganti tema secara langsung melalui tombol pada AppBar. Aplikasi ini dibuat untuk menerapkan penggunaan widget Flutter, pengelolaan state sederhana, serta pengaturan tema dalam pengembangan aplikasi mobile.

Melalui aplikasi ini, pengguna dapat mengenal berbagai pilihan kuliner khas Medan dalam satu tampilan yang sederhana dan mudah digunakan. Pengembangan aplikasi juga menerapkan pemisahan widget agar kode lebih terstruktur, mudah dipahami, dan dapat dikembangkan kembali sesuai kebutuhan usaha.

## C. Fitur Aplikasi

1. Menampilkan profil UMKM Dapur Medan.
2. Menampilkan informasi alamat, telepon, dan email.
3. Menampilkan 8 menu makanan khas Medan.
4. Menampilkan 5 menu minuman.
5. Menambahkan dan menghapus menu favorit.
6. Menampilkan SnackBar ketika tombol favorit ditekan.
7. Menggunakan Material Design 3.
8. Mendukung mode terang dan mode gelap.

## D. Screenshot Aplikasi

### 1. Mode Terang

Simpan screenshot mode terang dengan nama:

`screenshots/mode-terang.png`

### 2. Mode Gelap

Simpan screenshot mode gelap dengan nama:

`screenshots/mode-gelap.png`

## E. Widget Tree

```text
UmkmKulinerApp (StatefulWidget)
└── MaterialApp
    ├── ThemeData (Light)
    ├── DarkTheme
    └── HalamanUtama (StatelessWidget)
        └── Scaffold
            ├── AppBar
            │   ├── IconButton (Theme)
            │   └── IconButton (Informasi)
            └── SingleChildScrollView
                └── Column
                    ├── Image.network
                    ├── Text (Profil Usaha)
                    ├── Wrap (Chip)
                    ├── Card (Informasi Usaha)
                    │   └── ListTile
                    ├── Text (Menu Makanan)
                    ├── KartuMenu x 8
                    ├── Text (Menu Minuman)
                    ├── KartuMenu x 5
                    └── Buttons
                        ├── FilledButton
                        ├── OutlinedButton
                        └── TextButton

KartuMenu (StatelessWidget)
└── Card
    └── Row
        ├── CircleAvatar
        ├── Column
        └── TombolFavorit (StatefulWidget)
            └── IconButton
                └── SnackBar
```

## F. Pengujian Aplikasi

Pengujian dilakukan menggunakan perintah:

```bash
dart format .
flutter analyze
flutter test
```

Hasil pengujian:
- Dart Format: berhasil.
- Flutter Analyze: No issues found.
- Flutter Test: All tests passed.

## G. Teknologi yang Digunakan

- Flutter
- Dart
- Material Design 3
- Visual Studio Code
- Android Emulator
- Git dan GitHub

## H. Pernyataan Penggunaan AI

Dalam pengerjaan tugas ini, AI digunakan sebagai alat bantu untuk memahami konsep Flutter, membantu penyusunan dan perbaikan kode program, serta memberikan panduan dalam proses pengujian dan dokumentasi aplikasi. Seluruh kode dan hasil aplikasi diperiksa dan dijalankan kembali oleh mahasiswa.

---
