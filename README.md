# Pedagang Pulsa Mobile

Aplikasi mobile Flutter untuk pedagang pulsa dan paket data.

## Fitur

- **Login**: Halaman login dengan validasi email dan password
- **Register**: Halaman registrasi dengan form lengkap
- **Home**: Halaman utama dengan:
  - Dashboard saldo
  - Quick actions untuk berbagai layanan
  - Daftar produk pulsa dan paket data
  - Tab navigasi (Beranda, Transaksi, Profil)

## Screenshots UI

### Login Page
- Form login dengan email dan password
- Validasi input
- Tombol "Lupa Password"
- Tombol untuk navigasi ke halaman registrasi

### Register Page
- Form registrasi lengkap (nama, email, telepon, password, konfirmasi password)
- Checkbox persetujuan syarat dan ketentuan
- Validasi untuk semua input
- Link untuk kembali ke halaman login

### Home Page
- Header dengan saldo pengguna
- Quick actions untuk berbagai layanan (Pulsa, Paket Data, Listrik, Game)
- Grid produk populer dengan harga
- Bottom navigation bar dengan 3 tab:
  - Beranda: Menampilkan dashboard dan produk
  - Transaksi: Riwayat transaksi
  - Profil: Pengaturan profil dan menu aplikasi

## Cara Menjalankan

1. Pastikan Flutter sudah terinstall
2. Clone repository ini
3. Jalankan `flutter pub get` untuk menginstall dependencies
4. Jalankan `flutter run` untuk menjalankan aplikasi

## Teknologi

- Flutter SDK
- Material Design 3
- Dart

## Catatan

UI ini adalah versi awal dan siap untuk diintegrasikan dengan backend API.
