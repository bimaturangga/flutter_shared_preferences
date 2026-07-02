# Flutter Shared Preferences

Contoh aplikasi Flutter sederhana yang mendemonstrasikan penggunaan package `shared_preferences` untuk menyimpan data secara lokal di perangkat, seperti status onboarding pertama kali dan status login pengguna.

## Fitur

- Splash screen dengan pengecekan status pertama kali membuka aplikasi (`is_first_launch`)
- Onboarding screen yang hanya perlu dilewati sekali
- Login screen dengan penyimpanan status login (`is_logged_in`) menggunakan Shared Preferences
- Home screen dengan fungsi logout yang menghapus status login
- Tampilan UI custom dengan tema warna dan tipografi sendiri
- Ikon menggunakan SVG (`flutter_svg`)

## Alur Aplikasi

1. **Splash Screen** — mengecek apakah ini pertama kali aplikasi dibuka.
2. **Onboarding Screen** — ditampilkan jika pengguna baru pertama kali membuka aplikasi. Setelah menekan tombol "Mulai Sekarang", status `is_first_launch` diubah menjadi `false`.
3. **Login Screen** — jika pengguna belum login, akan diarahkan ke sini. Setelah login, status `is_logged_in` disimpan sebagai `true`.
4. **Home Screen** — halaman utama setelah login berhasil. Tersedia tombol "Keluar" untuk logout dan menghapus status login.

## Package yang Digunakan

| Package | Kegunaan |
|---|---|
| [shared_preferences](https://pub.dev/packages/shared_preferences) | Menyimpan data key-value secara lokal dan persisten |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | Menampilkan aset gambar berformat SVG |
| [google_fonts](https://pub.dev/packages/google_fonts) | Kustomisasi tipografi aplikasi |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | Ikon bergaya iOS |

## Struktur Proyek

```
lib/
 ├── main.dart
 ├── screens/
 │    ├── splash_screen.dart
 │    ├── onboarding_screen.dart
 │    ├── login_screen.dart
 │    └── home_screen.dart
 └── theme/
      ├── app_colors.dart
      └── app_typography.dart
assets/
 └── svgs/
      ├── logo.svg
      ├── onboarding.svg
      ├── login.svg
      └── home.svg
```

## Cara Menjalankan

1. Clone repository ini
   ```bash
   git clone https://github.com/bimaturangga/flutter_shared_preferences.git
   cd flutter_shared_preferences
   ```

2. Pasang dependensi
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi
   ```bash
   flutter run
   ```

## Requirement

- Flutter SDK (mendukung Dart SDK `^3.11.5`)
- Emulator atau perangkat fisik (Android/iOS)

## Catatan

Aplikasi ini merupakan contoh pembelajaran dan masih dalam tahap pengembangan. Fitur login belum terhubung ke backend/autentikasi asli, hanya menggunakan Shared Preferences untuk menyimpan status sesi secara lokal.

## Lisensi

Belum ditentukan. Tambahkan file `LICENSE` jika ingin repository ini menggunakan lisensi tertentu.
