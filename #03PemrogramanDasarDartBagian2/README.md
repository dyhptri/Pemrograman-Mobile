# Laporan Praktikum #02 - Pemrograman Dasar Dart - Bag.2 (Percabangan dan Perulangan)

## Identitas Mahasiswa

| Atribut | Nilai                   |
| ------- | ----------------------- |
| Nama    | Diyah Ramadhani Putri   |
| NIM     | 244107060152            |
| Kelas   | SIB-2E                  |

---

## Tugas Praktikum 3

## PRAKTIKUM 1: Menerapkan Control Flows ("if/else")
### Langkah 1
Ketik atau salin kode program berikut ke dalam fungsi main().

![Code Langkah 1](img/kodeLangkah1.png)

**JAWABAN**

### Langkah 2
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan!

![Hasil Code Langkah 2](img/HasilLangkah1.png)

**JAWABAN**
Pada Langkah 1, saat kode dijalankan program tidak menampilkan output, tetapi muncul error. Ini karena penulisan Else If dan Else menggunakan huruf besar, sedangkan di Dart harus ditulis else if dan else. Karena kesalahan sintaks tersebut, program gagal dijalankan dan muncul beberapa pesan error.

### Langkah 3
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

![Code Langkah 3](img/kodeLangkah3.png)

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan if/else.   
**JAWABAN**
Pada Langkah 3, ketika kode dijalankan juga terjadi error. Hal ini karena variabel test bertipe String dengan nilai "true", tetapi pada kondisi if (test) Dart mengharuskan nilai bertipe boolean (true atau false). Karena tipe datanya tidak sesuai, program tidak bisa dijalankan sehingga muncul error. Agar bisa berjalan, kondisi harus dibandingkan terlebih dahulu, misalnya if (test == "true").

**Perbaikan Kode**
``` dart
void main() {
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") print("Test2 again");

  String test2 = "true";
  if (test2  == "true") {
    print("Kebenaran");
  }
}
```
**Hasil Kode yang sudah diperbaiki**

![Hasil Code Praktikum 1](img/hasilPrak1Berhasil.png)

## PRAKTIKUM 2: Menerapkan Perulangan "while" dan "do-while"
### Langkah 1
Ketik atau salin kode program berikut ke dalam fungsi main().

![Code Langkah 1](img/Prak2Langkah1.png)

### Langkah 2
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

![Hasil Code Langkah 1](img/hasilPrak2Langkah1.png)

**Perbaikan**
```dart
void main() {
  int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  } 
}
```
**JAWABAN** 
Pada langkah 1, program mengalami error karena variabel counter belum dideklarasikan terlebih dahulu. Kode langsung menggunakan while (counter < 33), padahal Dart harus mengetahui nilai awal variabel tersebut. Untuk memperbaikinya, variabel counter harus dibuat dulu, misalnya int counter = 0;. Setelah diperbaiki, program akan menampilkan angka secara berulang mulai dari nilai awal sampai kurang dari 33.

### Langkah 3
Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.

![Code Langkah 3](img/Prak2Langkah3.png)

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan do-while.
**JAWABAN** 
Ketika kode do-while dijalankan, jika counter sudah dideklarasikan dengan benar, maka program akan menampilkan nilai counter terlebih dahulu lalu menambah nilainya, kemudian mengecek kondisi while (counter < 77).

## PRAKTIKUM 3: Menerapkan Perulangan "for" dan "break-continue"
### Langkah 1
Ketik atau salin kode program berikut ke dalam fungsi main().


![Code Langkah 1](img/prak3Langkah1.png)

### Langkah 2
Silakan coba eksekusi (Run) kode pada langkah 1 tersebut. Apa yang terjadi? Jelaskan! Lalu perbaiki jika terjadi error.

![Hasil Code Langkah 1](img/hasilPrak3Langkah1.png)

**Perbaikan**
```dart
void main() {
  int Index = 10;
  for (Index = 10; Index < 27; Index++) {
    print(Index);
  }
}
```
**JAWABAN**
Pada langkah 1, akan terjadi error karena variabel Index belum dideklarasikan dan penulisan pada bagian for kurang tepat. Variabel dibuat terlebih dahulu dengan tipe data, misalnya int index = 10;, lalu perulangannya berjalan dari 10 sampai kurang dari 27 dan akan menampilkan angka tersebut satu per satu.

### Langkah 3
Tambahkan kode program berikut di dalam for-loop, lalu coba eksekusi (Run) kode Anda.

![Code Langkah 3](img/Prak3Langkah3.png)

Apa yang terjadi ? Jika terjadi error, silakan perbaiki namun tetap menggunakan for dan break-continue.
**Perbaikan**
```dart
void main() {
  int index = 10;
  for (index = 10; index < 27; index++) {
    print(index);
    if (index == 21) break;
    if (index > 1 || index < 7) continue;
    print(index);
  }
}
```
**JAWABAN**
Kode tambahan dimasukkan ke dalam for, awalnya bisa terjadi error karena penulisan If dan Else If menggunakan huruf besar, sedangkan di Dart harus if dan else if. Setelah diperbaiki, program akan berjalan dengan aturan: jika index bernilai 21 maka perulangan berhenti (break), sedangkan jika index lebih dari 1 atau kurang dari 7 maka dilewati (continue).

## Tugas Praktikum
1. Silakan selesaikan Praktikum 1 sampai 3, lalu dokumentasikan berupa screenshot hasil pekerjaan beserta penjelasannya!
2.. Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda.
**JAWABAN**
```dart
void main() {
  String nama = "Diyah Ramadhani Putri";
  String nim = "244107060152";

  for (int i = 0; i <= 201; i++) {
    print("Angka: $i");

    int pembagi = 0;

    if (i > 1) {
      for (int j = 1; j <= i; j++) {
        if (i % j == 0) {
          pembagi++;
        }
      }

      if (pembagi == 2) {
        print("Bilangan prima ditemukan!");
        print("Nama: $nama");
        print("NIM: $nim");
      }
    }

    print("---------------------");
  }
}
```

![Code Tugas](pra3Langkah3.png)

