# Laporan Praktikum #10 | Dasar State Management

## Identitas Mahasiswa

| Atribut | Nilai                   |
| ------- | ----------------------- |
| Nama    | Diyah Ramadhani Putri   |
| NIM     | 244107060152            |
| Kelas   | SIB-2E                  |

**Link Repository:** [master_plan](https://github.com/dyhptri/master_plan-.git)

## Praktikum 1: Dasar State dengan Model-View
### Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama master_plan di folder src week-10 repository GitHub Anda atau sesuai style laporan praktikum yang telah disepakati. Lalu buatlah susunan folder dalam project seperti gambar berikut ini.

![Buat Project Baru](img/langkah1Prak1.png)

![Buat Project Baru](img/langkah1Prak1(2).png)

### Langkah 2: Membuat model task.dart
Praktik terbaik untuk memulai adalah pada lapisan data (data layer). Ini akan memberi Anda gambaran yang jelas tentang aplikasi Anda, tanpa masuk ke detail antarmuka pengguna Anda. Di folder model, buat file bernama task.dart dan buat class Task. Class ini memiliki atribut description dengan tipe data String dan complete dengan tipe data Boolean, serta ada konstruktor. Kelas ini akan menyimpan data tugas untuk aplikasi kita. Tambahkan kode berikut:
```dart
class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}
```

![Membuat model task.dart](img/langkah2Prak1.png)

### Langkah 3: Buat file plan.dart
Kita juga perlu sebuah List untuk menyimpan daftar rencana dalam aplikasi to-do ini. Buat file plan.dart di dalam folder models dan isi kode seperti berikut.
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
}
```

![Buat file plan.dart](img/langkah3Prak1.png)

### Langkah 4: Buat file data_layer.dart
Kita dapat membungkus beberapa data layer ke dalam sebuah file yang nanti akan mengekspor kedua model tersebut. Dengan begitu, proses impor akan lebih ringkas seiring berkembangnya aplikasi. Buat file bernama data_layer.dart di folder models. Kodenya hanya berisi export seperti berikut.
```dart
export 'plan.dart';
export 'task.dart';
```

![Buat file data_layer.dart](img/langkah4Prak1.png)

### Langkah 5: Pindah ke file main.dart
Ubah isi kode main.dart sebagai berikut.
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primarySwatch: Colors.purple),
     home: PlanScreen(),
    );
  }
}
```

![Pindah ke file main.dart](img/langkah5Prak1.png)

### Langkah 6: buat plan_screen.dart
Pada folder views, buatlah sebuah file plan_screen.dart dan gunakan templat StatefulWidget untuk membuat class PlanScreen. Isi kodenya adalah sebagai berikut. Gantilah teks ‘Namaku' dengan nama panggilan Anda pada title AppBar.
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // ganti ‘Namaku' dengan Nama panggilan Anda
    appBar: AppBar(title: const Text('Master Plan Namaku')),
    body: _buildList(),
    floatingActionButton: _buildAddTaskButton(),
   );
  }
}
```

![buat plan_screen.dart](img/langkah6Prak1.png)

### Langkah 7: buat method _buildAddTaskButton()
Anda akan melihat beberapa error di langkah 6, karena method yang belum dibuat. Ayo kita buat mulai dari yang paling mudah yaitu tombol Tambah Rencana. Tambah kode berikut di bawah method build di dalam class _PlanScreenState.
```dart
Widget _buildAddTaskButton() {
  return FloatingActionButton(
   child: const Icon(Icons.add),
   onPressed: () {
     setState(() {
      plan = Plan(
       name: plan.name,
       tasks: List<Task>.from(plan.tasks)
       ..add(const Task()),
     );
    });
   },
  );
}
```

![buat method _buildAddTaskButton()](img/langkah7Prak1.png)

### Langkah 8: buat widget _buildList()
Kita akan buat widget berupa List yang dapat dilakukan scroll, yaitu ListView.builder. Buat widget ListView seperti kode berikut ini.
```dart
Widget _buildList() {
  return ListView.builder(
   itemCount: plan.tasks.length,
   itemBuilder: (context, index) =>
   _buildTaskTile(plan.tasks[index], index),
  );
}
```

![buat widget _buildList()](img/langkah8Prak1.png)

### Langkah 9: buat widget _buildTaskTile
Dari langkah 8, kita butuh ListTile untuk menampilkan setiap nilai dari plan.tasks. Kita buat dinamis untuk setiap index data, sehingga membuat view menjadi lebih mudah. Tambahkan kode berikut ini.
```dart
Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
```

![buat widget _buildTaskTile](img/langkah9Prak1.png)

Run atau tekan F5 untuk melihat hasil aplikasi yang Anda telah buat. Capture hasilnya untuk soal praktikum nomor 4.


![buat widget _buildTaskTile](img/HasilLangkah9Prak1.gif)

### Langkah 10: Tambah Scroll Controller
Anda dapat menambah tugas sebanyak-banyaknya, menandainya jika sudah beres, dan melakukan scroll jika sudah semakin banyak isinya. Namun, ada salah satu fitur tertentu di iOS perlu kita tambahkan. Ketika keyboard tampil, Anda akan kesulitan untuk mengisi yang paling bawah. Untuk mengatasi itu, Anda dapat menggunakan ScrollController untuk menghapus focus dari semua TextField selama event scroll dilakukan. Pada file plan_screen.dart, tambahkan variabel scroll controller di class State tepat setelah variabel plan.
```dart
late ScrollController scrollController;
```

![Tambah Scroll Controller](img/langkah10Prak1.png)

### Langkah 11: Tambah Scroll Listener
Tambahkan method initState() setelah deklarasi variabel scrollController seperti kode berikut.
```dart
@override
void initState() {
  super.initState();
  scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}
```

![Tambah Scroll Listener](img/langkah11Prak1.png)

### Langkah 12: Tambah controller dan keyboard behavior
Tambahkan controller dan keyboard behavior pada ListView di method _buildList seperti kode berikut ini.
```dart
return ListView.builder(
  controller: scrollController,
 keyboardDismissBehavior: Theme.of(context).platform ==
 TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
```

![Tambah controller dan keyboard behavior](img/langkah12Prak1.png)

### Langkah 13: Terakhir, tambah method dispose()
Terakhir, tambahkan method dispose() berguna ketika widget sudah tidak digunakan lagi.
```dart
@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}
```

![Tambah controller dan keyboard behavior](img/langkah13Prak1.png)

### Langkah 14: Hasil
Lakukan Hot restart (bukan hot reload) pada aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

Karena adanya perbedaan versi pada widget build bagian return themeData diganti seperti ini
![Hasil](img/langkah14Prak1.png)

![Hasil](img/HasilLangkah14Prak1.gif)

## Tugas Praktikum 1: Dasar State dengan Model-View
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.

2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

*Jawab*

Pada langkah 4, dibuat file data_layer.dart yang isinya ngegabungin export dari plan.dart dan task.dart. Cara ini disebut barrel file. Tujuannya agar proses import jadi lebih simpel. Jadi, bagian UI atau Views tidak perlu lagi import banyak file satu per satu, cukup panggil data_layer.dart saja untuk akses kelas Plan dan Task. Hasilnya, struktur kode jadi lebih rapi, tidak ribet, dan lebih gampang diatur apalagi kalau aplikasinya makin besar.

3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

*Jawab*

Kebutuhan variabel plan: variabel ini di kelas _PlanScreenState dipakai untuk nyimpan state utama dari layar tersebut. Di aplikasi To-Do List, memang butuh struktur data untuk nampung nama rencana dan daftar tugas. Variabel plan ini yang akan nampung setiap perubahan data dari interaksi user, sekaligus bikin UI ikut ke-update.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

*Jawab*

![Soal nomor 4 praktikum 1](img/HasilLangkah9Prak1.gif)

langkah 9, sudah mengimplementasikan aplikasi To-Do List yang menggunakan konsep dasar StatefulWidget pada Flutter. Aplikasi ini dapat menampilkan daftar tugas menggunakan ListView.builder sehingga bisa melakukan scrolling dengan mudah. Pengguna juga dapat menekan FloatingActionButton untuk menambahkan slot tugas baru.

Setiap item tugas ditampilkan dalam bentuk ListTile, yang berisi Checkbox untuk menandai status selesai atau belum, serta TextFormField untuk mengubah deskripsi tugas. Semua interaksi, seperti mencentang checkbox atau mengubah teks, dihubungkan dengan setState(), sehingga tampilan aplikasi langsung diperbarui mengikuti data terbaru.

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

*Jawab*

*Langkah 11* (initState): Method ini termasuk bagian dari lifecycle state yang hanya dipanggil satu kali saat objek State pertama kali masuk ke Widget Tree. Fungsinya untuk menyiapkan atau menginisialisasi objek maupun listener sebelum tampilan dirender. Pada praktikum ini, initState() dipakai untuk menginisialisasi ScrollController dan menambahkan listener supaya fokus keyboard otomatis dilepas ketika pengguna melakukan scroll.

*Langkah 13* (dispose): Method ini dipanggil saat objek State dihapus secara permanen dari Widget Tree, misalnya ketika pindah halaman. Fungsinya penting untuk menghindari memory leak. Pada praktikum ini, dispose() digunakan untuk membersihkan atau menghapus scrollController dari memori karena sudah tidak digunakan lagi.

6. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !


## Praktikum 2: Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier
### Langkah 1: Buat file plan_provider.dart
Buat folder baru provider di dalam folder lib, lalu buat file baru dengan nama plan_provider.dart berisi kode seperti berikut.

![Buat file plan_provider.dart](img/langkah1Prak2.png)

```dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required Widget child, required
   ValueNotifier<Plan> notifier})
  : super(child: child, notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.
    dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
```

![Buat file plan_provider.dart](img/langkah1Prak2(2).png)

### Langkah 2: Edit main.dart
Gantilah pada bagian atribut home dengan PlanProvider seperti berikut. Jangan lupa sesuaikan bagian impor jika dibutuhkan.
```dart
return MaterialApp(
  theme: ThemeData(primarySwatch: Colors.purple),
  home: PlanProvider(
    notifier: ValueNotifier<Plan>(const Plan()),
    child: const PlanScreen(),
   ),
);
```

![Edit main.dart](img/langkah2Prak2.png)

![Edit main.dart](img/langkah2(1)Prak2.png)

### Langkah 3: Tambah method pada model plan.dart
Tambahkan dua method di dalam model class Plan seperti kode berikut.
```dart
int get completedCount => tasks
  .where((task) => task.complete)
  .length;

String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
```

![Tambah method pada model plan.dart](img/langkah3Prak2.png)

### Langkah 4: Pindah ke PlanScreen
Edit PlanScreen agar menggunakan data dari PlanProvider. Hapus deklarasi variabel plan (ini akan membuat error). Kita akan perbaiki pada langkah 5 berikut ini.

Sebelum dihapus

![Pindah ke PlanScreen](img/langkah4(1)Prak2.png)

Setelah dihapus

![Pindah ke PlanScreen](img/langkah4(2)Prak2.png)

### Langkah 5: Edit method _buildAddTaskButton
Tambahkan BuildContext sebagai parameter dan gunakan PlanProvider sebagai sumber datanya. Edit bagian kode seperti berikut.
```dart
Widget _buildAddTaskButton(BuildContext context) {
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Plan currentPlan = planNotifier.value;
      planNotifier.value = Plan(
        name: currentPlan.name,
        tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
      );
    },
  );
}
```

![Edit method _buildAddTaskButton](img/langkah5Prak2.png)

![Edit method _buildAddTaskButton](img/langkah5(2)Prak2.png)

### Langkah 6: Edit method _buildTaskTile
Tambahkan parameter BuildContext, gunakan PlanProvider sebagai sumber data. Ganti TextField menjadi TextFormField untuk membuat inisial data provider menjadi lebih mudah.
```dart
Widget _buildTaskTile(Task task, int index, BuildContext context) {
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  return ListTile(
    leading: Checkbox(
       value: task.complete,
       onChanged: (selected) {
         Plan currentPlan = planNotifier.value;
         planNotifier.value = Plan(
           name: currentPlan.name,
           tasks: List<Task>.from(currentPlan.tasks)
             ..[index] = Task(
               description: task.description,
               complete: selected ?? false,
             ),
         );
       }),
    title: TextFormField(
      initialValue: task.description,
      onChanged: (text) {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: text,
              complete: task.complete,
            ),
        );
      },
    ),
  );
}
```

![Edit method _buildTaskTile](img/langkah6Prak2.png)

### Langkah 7: Edit _buildList
Sesuaikan parameter pada bagian _buildTaskTile seperti kode berikut.
```dart
Widget _buildList(Plan plan) {
   return ListView.builder(
     controller: scrollController,
     itemCount: plan.tasks.length,
     itemBuilder: (context, index) =>
        _buildTaskTile(plan.tasks[index], index, context),
   );
}
```

![Edit _buildList](img/langkah7Prak2.png)

### Langkah 8: Tetap di class PlanScreen
Edit method build sehingga bisa tampil progress pada bagian bawah (footer). Caranya, bungkus (wrap) _buildList dengan widget Expanded dan masukkan ke dalam widget Column seperti kode pada Langkah 9.

### Langkah 9: Tambah widget SafeArea
Terakhir, tambahkan widget SafeArea dengan berisi completenessMessage pada akhir widget Column. Perhatikan kode berikut ini.
```dart
@override
Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Master Plan')),
     body: ValueListenableBuilder<Plan>(
       valueListenable: PlanProvider.of(context),
       builder: (context, plan, child) {
         return Column(
           children: [
             Expanded(child: _buildList(plan)),
             SafeArea(child: Text(plan.completenessMessage))
           ],
         );
       },
     ),
     floatingActionButton: _buildAddTaskButton(context),
   );
}
```

![Tambah widget SafeArea](img/langkag9Prak2.png)

Akhirnya, run atau tekan F5 jika aplikasi belum running. Tidak akan terlihat perubahan pada UI, namun dengan melakukan langkah-langkah di atas, Anda telah menerapkan cara memisahkan dengan baik antara view dan model. Ini merupakan hal terpenting dalam mengelola state di aplikasi Anda.

![Tambah widget SafeArea](img/HasilPraktikum2.gif)


## Tugas Praktikum 2: InheritedWidget
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

*Jawab*

Yang dimaksud sebagai InheritedWidget pada langkah 1 adalah kelas PlanProvider. Kelas ini merupakan turunan dari InheritedNotifier, sedangkan InheritedNotifier adalah bagian dari turunan InheritedWidget yang sudah disediakan oleh Flutter.

Alasan memakai InheritedNotifier dibanding InheritedWidget biasa karena lebih praktis. InheritedNotifier bisa langsung “mendengarkan” perubahan dari objek Listenable. Jika Hanya pakai InheritedWidget, harus mengatur update UI secara manual setiap kali data berubah.

Dengan InheritedNotifier, setiap ada perubahan nilai di ValueNotifier, widget yang bergantung pada data tersebut akan otomatis ikut rebuild. Jadi kita tidak perlu lagi memanggil setState() secara manual untuk memperbarui tampilan.

3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

*Jawab*

Pada langkah 3, ditambahkan dua getter di model Plan, yaitu completedCount dan completenessMessage.
completedCount digunakan untuk menghitung jumlah task yang sudah selesai (complete = true), sedangkan completenessMessage mengubah hasil tersebut menjadi teks informatif, misalnya “2 out of 5 tasks”.

Ini menerapkan prinsip Separation of Concerns, di mana logika perhitungan diletakkan di Model, bukan di UI. Dengan begitu, kode UI jadi lebih rapi karena hanya menampilkan data. Penggunaan getter juga memastikan hasilnya selalu up-to-date sesuai kondisi data terbaru

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

*Jawab*

![Soal Nomor 4 Praktikum 2](img/HasilPraktikum2.gif)

5. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !


## Praktikum 3: Membuat State di Multiple Screens
### Langkah 1: Edit PlanProvider
Perhatikan kode berikut, edit class PlanProvider sehingga dapat menangani List Plan.
```dart
class PlanProvider extends
InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({super.key, required Widget child, required
ValueNotifier<List<Plan>> notifier})
     : super(child: child, notifier: notifier);

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    return context.
dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
```

![Edit PlanProvider](img/langkah1Prak3.png)

### Langkah 2: Edit main.dart
Langkah sebelumnya dapat menyebabkan error pada main.dart dan plan_screen.dart. Pada method build, gantilah menjadi kode seperti ini.
```dart
@override
Widget build(BuildContext context) {
  return PlanProvider(
    notifier: ValueNotifier<List<Plan>>(const []),
    child: MaterialApp(
      title: 'State management app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlanScreen(),
    ),
  );
}
```

![Edit main.dart](img/langkah2Prak3.png)

### Langkah 3: Edit plan_screen.dart
Tambahkan variabel plan dan atribut pada constructor-nya seperti berikut.
```dart
final Plan plan;
const PlanScreen({super.key, required this.plan});
```

![Edit plan_screen.dart](img/langkah3Prak3.png)

### Langkah 4: Error
Itu akan terjadi error setiap kali memanggil PlanProvider.of(context). Itu terjadi karena screen saat ini hanya menerima tugas-tugas untuk satu kelompok Plan, tapi sekarang PlanProvider menjadi list dari objek plan tersebut.

### Langkah 5: Tambah getter Plan
Tambahkan getter pada _PlanScreenState seperti kode berikut.
```dart
class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;
```

![Tambah getter Plan](img/langkah5Prak3.png)

### Langkah 6: Method initState()
Pada bagian ini kode tetap seperti berikut.
```dart
@override
void initState() {
   super.initState();
   scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}
```

![Method initState()](img/langkah6Prak3.png)

### Langkah 7: Widget build
Pastikan Anda telah merubah ke List dan mengubah nilai pada currentPlan seperti kode berikut ini.
```dart
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(_plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.
name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.
completenessMessage)),
            ],);},),
      floatingActionButton: _buildAddTaskButton(context,)
  ,);
 }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.
of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
        plan = Plan(
          name: currentPlan.name,
          tasks: updatedTasks,
        );},);
  }
```

![Widget build](img/langkag7Prak3.png)

### Langkah 8: Edit _buildTaskTile
Pastikan ubah ke List dan variabel planNotifier seperti kode berikut ini.
```dart
  Widget _buildTaskTile(Task task, int index, BuildContext context)
{
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.
of(context);

    return ListTile(
      leading: Checkbox(
         value: task.complete,
         onChanged: (selected) {
           Plan currentPlan = plan;
           int planIndex = planNotifier.value
              .indexWhere((p) => p.name == currentPlan.name);
           planNotifier.value = List<Plan>.from(planNotifier.value)
             ..[planIndex] = Plan(
               name: currentPlan.name,
               tasks: List<Task>.from(currentPlan.tasks)
                 ..[index] = Task(
                   description: task.description,
                   complete: selected ?? false,
                 ),);
         }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex =
             planNotifier.value.indexWhere((p) => p.name ==
currentPlan.name);
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
},),);}
```

![Edit _buildTaskTile](img/langkah8Prak3.png)

### Langkah 9: Buat screen baru
Pada folder view, buatlah file baru dengan nama plan_creator_screen.dart dan deklarasikan dengan StatefulWidget bernama PlanCreatorScreen. Gantilah di main.dart pada atribut home menjadi seperti berikut.
```dart
home: const PlanCreatorScreen(),
```

![Buat screen baru](img/langkah9(1)Prak3.png)

![Buat screen baru](img/langkah9(2)Prak3.png)

![Buat screen baru](img/langkah9(3)Prak3.png)

### Langkah 10: Pindah ke class _PlanCreatorScreenState
Kita perlu tambahkan variabel TextEditingController sehingga bisa membuat TextField sederhana untuk menambah Plan baru. Jangan lupa tambahkan dispose ketika widget unmounted seperti kode berikut.
```dart
final textController = TextEditingController();

@override
void dispose() {
  textController.dispose();
  super.dispose();
}
```

![Pindah ke class _PlanCreatorScreenState](img/langkah10Prak3.png)

### Langkah 11: Pindah ke method build
Letakkan method Widget build berikut di atas void dispose. Gantilah ‘Namaku' dengan nama panggilan Anda.
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    // ganti ‘Namaku' dengan nama panggilan Anda
    appBar: AppBar(title: const Text('Master Plans Namaku')),
    body: Column(children: [
      _buildListCreator(),
      Expanded(child: _buildMasterPlans())
    ]),
  );
}
```

![Pindah ke method build](img/langkah11Prak3.png)

### Langkah 12: Buat widget _buildListCreator
Buatlah widget berikut setelah widget build.
```dart
Widget _buildListCreator() {
  return Padding(
     padding: const EdgeInsets.all(20.0),
     child: Material(
       color: Theme.of(context).cardColor,
       elevation: 10,
       child: TextField(
          controller: textController,
          decoration: const InputDecoration(
             labelText: 'Add a plan',
             contentPadding: EdgeInsets.all(20)),
          onEditingComplete: addPlan),
     ));
}
```

![Buat widget _buildListCreator](img/langkah12Prak3.png)

### Langkah 13: Buat void addPlan()
Tambahkan method berikut untuk menerima inputan dari user berupa text plan.
```dart
void addPlan() {
  final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier =
PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..
add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
}
```

![Buat void addPlan()](img/langkah13Prak3.png)

### Langkah 14: Buat widget _buildMasterPlans()
Tambahkan widget seperti kode berikut.
```dart
Widget _buildMasterPlans() {
  ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    if (plans.isEmpty) {
      return Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           const Icon(Icons.note, size: 100, color: Colors.grey),
           Text('Anda belum memiliki rencana apapun.',
              style: Theme.of(context).textTheme.headlineSmall)
         ]);
    }
    return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return ListTile(
              title: Text(plan.name),
              subtitle: Text(plan.completenessMessage),
              onTap: () {
                Navigator.of(context).push(
                   MaterialPageRoute(builder: (_) =>
PlanScreen(plan: plan,)));
              });
        });
}
```

![Buat widget _buildMasterPlan()](img/langkah14Prak3.png)

![Buat widget _buildMasterPlan()](img/langkah14(2)Prak3.png)

Terakhir, run atau tekan F5 untuk melihat hasilnya jika memang belum running. Bisa juga lakukan hot restart jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini.

Perbaikan Kode

![Perbaikan](img/PerbaikanKode.png)

Hasil

![Buat widget _buildMasterPlan()](img/HasilPraktikum3.gif)


## Tugas Praktikum 3: State di Multiple Screens
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!

*Jawab*

Diagram ini nunjukin perubahan struktur widget tree sekaligus cara state dikelola waktu aplikasi pindah antar halaman (multi-screen).
* Bagian kiri (PlanCreatorScreen):
Ini kondisi awal pas aplikasi dibuka. MaterialApp jadi root, lalu di bawahnya ada PlanProvider. Di dalam provider ini ditampilkan halaman PlanCreatorScreen yang isinya TextField (buat nambah plan) sama ListView (buat nampilin daftar plan yang sudah ada).
* Proses pindah halaman (Navigator.push):
Pas user ngeklik salah satu plan di daftar, dipanggil fungsi Navigator.push. Ini bikin halaman baru “ditumpuk” di atas halaman sebelumnya dalam stack navigasi.
* Bagian kanan (PlanScreen):
Ini tampilan halaman detail. Yang muncul adalah PlanScreen, berisi Scaffold, Column, ListView (buat checklist tugas), dan Text (buat nunjukin progres).

3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

*Jawab*

![Hasil](img/HasilPraktikum3.gif)

Sampai Langkah 14 ini, aplikasi sudah berhasil di-upgrade dari yang awalnya cuma bisa ngelola satu rencana dalam satu layar, jadi aplikasi multi-screen yang bisa ngatur banyak rencana sekaligus.

Sekarang alur kerja aplikasinya jadi seperti ini:
* Layar utama (PlanCreatorScreen):
Di sini user bisa ngetik nama rencana besar, misalnya “Belajar Flutter” atau “Tugas Akhir”, lewat kolom teks yang tersedia. Setelah ditekan enter, rencana tersebut langsung masuk ke dalam daftar (ListView).
* Navigasi:
Kalau user ngeklik salah satu rencana di daftar, aplikasi bakal pindah ke layar berikutnya pakai Navigator.push.
* Layar detail (PlanScreen):
Di halaman ini, user bisa bikin dan ngatur to-do list yang lebih spesifik dari rencana yang tadi dipilih.
* State global:
Karena aplikasi pakai InheritedNotifier lewat PlanProvider, semua perubahan data (kayak nambah rencana atau checklist tugas) langsung tersimpan dan otomatis sinkron di semua layar. Jadi walaupun user bolak-balik antar halaman, datanya tetap aman dan nggak hilang.

4. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !

