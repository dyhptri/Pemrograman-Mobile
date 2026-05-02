# Laporan Praktikum #07 | Manajemen Plugin

## Identitas Mahasiswa

| Atribut | Nilai                   |
| ------- | ----------------------- |
| Nama    | Diyah Ramadhani Putri   |
| NIM     | 244107060152            |
| Kelas   | SIB-2E                  |

**Link Repository:** [flutter_plugin_pubdev](https://github.com/dyhptri/flutter_plugin_pubdev.git)

## Praktikum Menerapkan Plugin di Project Flutter
### Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama flutter_plugin_pubdev. Lalu jadikan repository di GitHub Anda dengan nama flutter_plugin_pubdev.

![Buat Project Baru](img/langkah1Prak.png)

### Langkah 2: Menambahkan Plugin
Tambahkan plugin auto_size_text menggunakan perintah berikut di terminal
```dart
flutter pub add auto_size_text
```

![Menambahkan Plugin](img/langkah2Prak.png)

Jika berhasil, maka akan tampil nama plugin beserta versinya di file pubspec.yaml pada bagian dependencies.

![Menambahkan Plugin](img/langkah2(2)Prak.png)

### Langkah 3: Buat file red_text_widget.dart
Buat file baru bernama red_text_widget.dart di dalam folder lib lalu isi kode seperti berikut.

![Buat file red_text_widget.dart](img/langkah3(1)Prak.png)

```dart
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

![Buat file red_text_widget.dart](img/langkah3(2)Prak.png)

### Langkah 4: Tambah Widget AutoSizeText
Masih di file red_text_widget.dart, untuk menggunakan plugin auto_size_text, ubahlah kode return Container() menjadi seperti berikut.

![Tambah Widget AutoSizeText](img/langkah4(1)Prak.png)
```dart
return AutoSizeText(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
);
```
Setelah Anda menambahkan kode di atas, Anda akan mendapatkan info error. Mengapa demikian? Jelaskan dalam laporan praktikum Anda!

*Jawab*

Implementasi komponen RedTextWidget sebelumnya gagal dikompilasi karena dua hal, yaitu belum adanya dependensi tambahan dan penggunaan variabel yang belum didefinisikan. Masalah pertama muncul karena widget AutoSizeText bukan bagian dari Flutter SDK bawaan, jadi perlu ditambahkan dulu library auto_size_text di file pubspec.yaml dan di-import di bagian atas kode supaya bisa dikenali. Selain itu, ada juga kesalahan logika karena variabel text dipakai di dalam method build, tapi belum dideklarasikan di dalam kelas. Solusinya adalah dengan menambahkan variabel text sebagai properti final bertipe String dan memasukkannya ke constructor dengan keyword required. Dengan perbaikan ini, teks bisa dikirim langsung saat widget dipanggil, jadi lebih fleksibel dan bisa dipakai ulang untuk berbagai kebutuhan, tapi tetap dengan gaya teks merah dan batas jumlah baris yang sama.

*Perbaikan*

![Perbaikan Tambah Widget AutoSizeText](img/langkah4(2)Prak.png)

### Langkah 5: Buat Variabel text dan parameter di constructor
Tambahkan variabel text dan parameter di constructor seperti berikut.
```dart
final String text;

const RedTextWidget({Key? key, required this.text}) : super(key: key);
```

![Buat Variabel text dan parameter di constructor](img/langkah5Prak.png)

### Langkah 6: Tambahkan widget di main.dart
Buka file main.dart lalu tambahkan di dalam children: pada class _MyHomePageState
```dart
Container(
   color: Colors.yellowAccent,
   width: 50,
   child: const RedTextWidget(
             text: 'You have pushed the button this many times:',
          ),
),
Container(
    color: Colors.greenAccent,
    width: 100,
    child: const Text(
           'You have pushed the button this many times:',
          ),
),
```

![Tambahkan widget di main.dart](img/langkah6(1)Prak.png)

Run aplikasi tersebut dengan tekan F5, maka hasilnya akan seperti berikut.

![Tambahkan widget di main.dart](img/langkah6(2)Prak.png)

*Hasil*

![Hasil Praktikum](img/hasilPrak.png)

## TUGAS PRAKTIKUM
1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file README.md!
2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!

*Jawab*

Langkah kedua dilakukan untuk menambahkan pustaka eksternal auto_size_text ke dalam proyek Flutter melalui terminal. Perintah flutter pub add auto_size_text digunakan untuk mengunduh plugin tersebut sekaligus secara otomatis memasukkannya ke dalam file pubspec.yaml pada bagian dependencies. Dengan cara ini, proses konfigurasi menjadi lebih praktis karena tidak perlu menambahkan dependensi secara manual, sehingga fitur penyesuaian ukuran teks dapat langsung dimanfaatkan dalam pengembangan aplikasi.

3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

*Jawab*

Langkah kelima dilakukan untuk mengatasi error yang muncul pada tahap sebelumnya dengan cara menambahkan variabel text bertipe String, sekaligus menjadikannya sebagai parameter wajib (required) pada konstruktor kelas. Variabel ini bersifat final, sehingga memungkinkan RedTextWidget menerima input teks secara dinamis dari widget lain, misalnya dari main.dart. Dengan adanya perbaikan ini, error yang terjadi dapat diselesaikan, dan widget menjadi lebih fleksibel serta dapat digunakan kembali (reusable) untuk menampilkan berbagai jenis teks yang berbeda.

4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

*Jawab*

Pada langkah keenam, ditambahkan dua widget Container untuk membandingkan secara langsung tampilan teks saat ditempatkan pada ruang yang terbatas. Container pertama berwarna kuning dengan lebar 50 menggunakan RedTextWidget yang sudah memanfaatkan AutoSizeText, sehingga ukuran teks dapat menyesuaikan secara otomatis agar tetap muat di dalam ruang sempit. Sementara itu, container kedua berwarna hijau dengan lebar 100 menggunakan widget Text bawaan Flutter, di mana ukuran teksnya bersifat tetap (statis) dan tidak dapat menyesuaikan secara otomatis. Perbandingan ini bertujuan untuk menunjukkan bahwa penggunaan AutoSizeText lebih efektif dalam mencegah terjadinya teks terpotong (overflow) dibandingkan dengan teks biasa, terutama ketika digunakan pada tampilan dengan keterbatasan ruang.

5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !

6. kumpulkan laporan praktikum Anda berupa link repository GitHub kepada dosen!