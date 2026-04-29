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

![Menambahkan Plugin](img/langkah3(1)Prak.png)

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

![Menambahkan Plugin](img/langkah3(2)Prak.png)

### Langkah 4: Tambah Widget AutoSizeText
Masih di file red_text_widget.dart, untuk menggunakan plugin auto_size_text, ubahlah kode return Container() menjadi seperti berikut.

![Menambahkan Plugin](img/langkah4(1)Prak.png)
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
Implementasi komponen RedTextWidget sebelumnya mengalami kegagalan kompilasi yang disebabkan oleh dua faktor utama, yaitu ketiadaan dependensi eksternal dan variabel yang tidak terdefinisi. Masalah pertama terletak pada penggunaan widget AutoSizeText yang bukan merupakan bagian dari pustaka standar Flutter SDK. Untuk mengatasi hal ini, diperlukan penambahan pustaka auto_size_text pada berkas konfigurasi pubspec.yaml serta pemanggilan pustaka tersebut melalui instruksi import di bagian atas berkas kode agar modul dapat dikenali oleh sistem.  

Selain masalah dependensi, terdapat kesalahan logika pemrograman di mana variabel text dipanggil di dalam metode build, namun variabel tersebut belum dideklarasikan di dalam kelas. Perbaikan dilakukan dengan mendefinisikan variabel text sebagai properti final bertipe String dan menambahkannya ke dalam constructor kelas dengan label required. Perubahan ini memastikan bahwa data teks dikirimkan secara eksplisit saat widget dipanggil, sehingga komponen menjadi lebih dinamis dan dapat digunakan kembali (reusable) untuk berbagai konten teks yang berbeda dengan tetap mempertahankan konsistensi gaya visual berwarna merah dan pembatasan baris yang telah ditentukan.

*Perbaikan*

![Menambahkan Plugin](img/langkah4(2)Prak.png)

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
3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!
4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!
Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !
5. kumpulkan laporan praktikum Anda berupa link repository GitHub kepada dosen!