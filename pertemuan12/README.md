## Identitas

Nama: Muhammad Hatta<br>
Kelas: TI-3A<br>
NIM: 2141720021

## Tugas Praktikum 1: Dasar State dengan Model-View

1.  Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?<br>
    **Jawab**<br>
    - `export plan.dart;`: Ini berarti bahwa file yang sedang berisi kode ini akan mengekspor semua elemen (class, function, variable, dll.) yang didefinisikan dalam file plan.dart. Dengan cara ini, elemen-elemen tersebut dapat diimpor dan digunakan oleh file lain yang mengimpor file ini
    - `export task.dart;`: Begitu juga dengan file `task.dart`, semua elemen yang didefinisikan dalam file tersebut akan diakses oleh file yang mengimpor file ini.
      <br><br>
2.  Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta?<br>
    **Jawab**<br>
    Variabel `plan` pada langkah 6 pada praktikum tersebut digunakan untuk menyimpan instance dari kelas `Plan` dari modul `data_layer.dart`. Pada kode tersebut, `Plan` adalah sebuah model atau objek yang mewakili suatu rencana atau data terkait rencana.<br><br>Penggunaan `const Plan()` menunjukkan bahwa kita membuat sebuah instance objek Plan yang bersifat konstan. Pemilihan ini mungkin dilakukan karena data rencana pada saat ini tidak berubah selama masa hidup widget ini. Dengan membuatnya konstan, Flutter dapat melakukan optimasi, dan objek tersebut tidak dapat diubah setelah pembuatannya
    <br><br>
3.  Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
    **Jawab**<br>
    <img src="assets/images/result_praktikum1.gif" width=50%>

4.  Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
    **Jawab**<br>

    - Methode `initState`:

        - Metode ini dipanggil sekali ketika widget `State` pertama kali dibuat.
        - Digunakan untuk melakukan inisialisasi awal, seperti membuat objek-objek yang diperlukan atau mendaftarkan pendengar perubahan data.
        - Pada contoh di atas, `initState` digunakan untuk membuat ScrollController dan menambahkan pendengar `(addListener)` yang akan meminta fokus dari `FocusScope` ketika `scrollController` mengalami perubahan

    - Methode `dispose`:

           - Metode ini dipanggil ketika widget `State` dihapus dari pohon widget (widget tree).
           - Digunakan untuk membersihkan sumber daya yang digunakan oleh widget atau melakukan tugas bersih-bersih sebelum widget dihapus.
           - Pada contoh di atas, `dispose` digunakan untuk memastikan bahwa `scrollController` dibersihkan dan sumber daya lainnya dilepaskan saat widget dihapus, sehingga menghindari memory leaks atau konsumsi sumber daya yang berlebihan

<br><br>

# Praktikum 2: Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier

1. **Buat file plan_provider.dart**<br>
   Buat folder baru `provider` di dalam folder `lib`, lalu buat file baru dengan nama `plan_provider.dart` berisi kode seperti berikut.

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

<br>

2. **Edit main.dart**<br>
   Gantilah pada bagian atribut `home` dengan `PlanProvider` seperti berikut. Jangan lupa sesuaikan bagian impor jika dibutuhkan.

```dart
return MaterialApp(
  theme: ThemeData(primarySwatch: Colors.purple),
  home: PlanProvider(
    notifier: ValueNotifier<Plan>(const Plan()),
    child: const PlanScreen(),
   ),
);
```

<br>

3. **Tambah method pada model plan.dart**<br>
   Tambahkan dua method di dalam model `class Plan` seperti kode berikut.

```dart
int get completedCount => tasks
  .where((task) => task.complete)
  .length;

String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
```

<br>

4. **Pindah ke PlanScreen**<br>
   Edit `PlanScreen` agar menggunakan data dari `PlanProvider`. Hapus deklarasi variabel `plan` (ini akan membuat error). Kita akan perbaiki pada langkah 5 berikut ini.

<br>

5. **Edit method \_buildAddTaskButton**<br>
   Tambahkan `BuildContext` sebagai parameter dan gunakan `PlanProvider` sebagai sumber datanya. Edit bagian kode seperti berikut.

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

<br>

6. **Edit method \_buildTaskTile**<br>
   Tambahkan parameter `BuildContext`, gunakan `PlanProvider` sebagai sumber data. Ganti `TextField` menjadi `TextFormField` untuk membuat inisial `data provider` menjadi lebih mudah.

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

<br>

7. **Edit \_buildList**<br>
   Sesuaikan parameter pada bagian `\_buildTaskTile` seperti kode berikut.

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

<br>

8. **Tetap di class PlanScreen**<br>
   Edit method build sehingga bisa tampil progress pada bagian bawah (footer). Caranya, bungkus (wrap) \_buildList dengan widget Expanded dan masukkan ke dalam widget Column seperti kode pada Langkah 9.
   <br>

9. **Tambah widget SafeArea**<br>
   Terakhir, tambahkan widget SafeArea dengan berisi completenessMessage pada akhir widget Column. Perhatikan kode berikut ini.

```dart
@override
Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Sabbaha Naufal Erwanda')),
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

Akhirnya, **run** atau tekan **F5** jika aplikasi belum running. Tidak akan terlihat perubahan pada UI, namun dengan melakukan langkah-langkah di atas, Anda telah menerapkan cara memisahkan dengan baik antara **view** dan **model**. Ini merupakan hal terpenting dalam mengelola **state** di aplikasi Anda.<br>
<img src="flutter_02.png" width=25%>

## Tugas Praktikum 2

1. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?<br>
   **Jawab:**<br>
   pada langkah 1 `InheritedNotifier<ValueNotifier<Plan>>` merupakan salah satu turunan dari `InheritedWidget`. Ini berfungsi untuk mengelola dan mengubah state berdasarkan pada waktu (time-dependent) pada aplikasi Flutter. `PlanProvider` merupakan kelas turunan dari `InheritedNotifier<ValueNotifier<Plan>>`. Ini berfungsi untuk menyediakan `ValueNotifier<Plan>` yang bisa diakses oleh seluruh anakan pada widget tree. <br><br>
   Pada langkah 1 menggunakan `InheritedNotifier` untuk membuat `PlanProvider` yang dapat memberikan `ValueNotifier<Plan>` yang bisa diakses oleh seluruh anakan pada widget tree. Hal ini membantu meminimalkan penggunaan `Provider` dan memudahkan dalam mengelola data yang dapat berubah-ubah seiring waktu pada aplikasi Flutter.<br><br>
2. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?<br>
   **Jawab:**<br>
   Dalam kode diatas, terdapat dua method `completedCount` dan `completenessMessage`.<br>

    - Method `completedCount` merupakan sebuah fungsi yang menghitung jumlah task yang telah selesai. Untuk melakukannya, fungsi ini menggunakan metode `where` pada `List<Task>` untuk memfilter task yang telah selesai `(task.complete)`. Kemudian, menghitung jumlah task yang telah selesai menggunakan metode `length`.
    - Method `completenessMessage` merupakan sebuah fungsi yang mengembalikan sebuah pesan yang menjelaskan ketersediaan task yang telah selesai. Pesan ini berisi informasi jumlah task yang telah selesai dan jumlah total task yang ada pada `tasks` List.
      <br>

   Method ini dilakukan untuk memudahkan dalam mengelola dan mengakses data pada aplikasi Flutter. Dengan menggunakan method ini, kita dapat dengan mudah mengakses dan mengupdate data task tanpa perlu melakukan build ulang seluruh widget tree.<br><br>

3. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!<br>
   **Jawab:**<br>
   <img src="assets/images/result_praktikum2.gif" width=50%>

# Praktikum 3: Membuat State di Multiple Screens

1. Edit PlanProvider<br>
   Perhatikan kode berikut, edit class `PlanProvider` sehingga dapat menangani List Plan.

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

2. Edit main.dart<br>
   Langkah sebelumnya dapat menyebabkan error pada `main.dart` dan `plan_screen.dart`. Pada method `build`, gantilah menjadi kode seperti ini.

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

3. **Edit plan_screen.dart<br>**
   Tambahkan variabel `plan` dan atribut pada constructor-nya seperti berikut.

```dart
final Plan plan;
const PlanScreen({super.key, required this.plan});
```

4. **Error<br>**
   Itu akan terjadi error setiap kali memanggil `PlanProvider.of(context)`. Itu terjadi karena screen saat ini hanya menerima tugas-tugas untuk satu kelompok `Plan`, tapi sekarang `PlanProvider` menjadi list dari objek plan tersebut.

5. **Tambah getter Plan<br>**
   Tambahkan getter pada `\_PlanScreenState` seperti kode berikut.

```dart
class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;
```

6. **Method initState()<br>**
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

7. **Widget build<br>**
   Pastikan `ubah` ke List dan variabel `planNotifier` seperti kode berikut ini.

```dart
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

8. **Edit \_buildTaskTile<br>**
   Pastikan ubah ke `List` dan variabel `planNotifier` seperti kode berikut ini.

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

9. **Buat screen baru<br>**
   Pada folder view, buatlah file baru dengan nama `plan_creator_screen.dart` dan deklarasikan dengan `StatefulWidget` bernama `PlanCreatorScreen`. Gantilah di main.dart pada atribut home menjadi seperti berikut.

```dart
home: const PlanCreatorScreen(),
```

10. **Pindah ke class \_PlanCreatorScreenState<br>**
    Kita perlu tambahkan variabel `TextEditingController` sehingga bisa membuat `TextField` sederhana untuk menambah Plan baru. Jangan lupa tambahkan dispose ketika widget unmounted seperti kode berikut.

```dart
final textController = TextEditingController();

@override
void dispose() {
  textController.dispose();
  super.dispose();
}
```

11. **Pindah ke method build<br>**
    Letakkan method Widget `build` berikut di atas `void dispose`. Gantilah **‘Namaku'** dengan nama panggilan Anda.

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

12. **Buat widget \_buildListCreator<br>**
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

13. **Buat void addPlan()<br>**
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

14. **Buat widget \_buildMasterPlans()<br>**
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

## Tugas Praktikum 3

1. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
   <img src="https://jti-polinema.github.io/flutter-codelab/11-basic-state/img//9ce81bcd2817adc8.png" width=50%>

   **Jawab:**<br>
   Deskripsi Diagram Pohon Widget<br>
   Gambar diagram tersebut menunjukkan struktur pohon widget dari aplikasi Flutter sebelum dan sesudah melakukan Navigator push. Navigator push adalah sebuah operasi yang memungkinkan kita untuk berpindah dari satu layar ke layar lainnya dalam aplikasi Flutter. Dalam diagram tersebut, kita dapat melihat bahwa:

    - Sebelum Navigator push, pohon widget terdiri dari `MaterialApp` di atas dan `PlanCreatorScreen` di bawah. `PlanCreatorScreen` adalah layar yang digunakan untuk membuat rencana perjalanan.
    - Sesudah Navigator push, pohon widget terdiri dari `MaterialApp` di atas dan `PlanScreen` di bawah. `PlanScreen` adalah layar yang digunakan untuk menampilkan rencana perjalanan yang telah dibuat.
    - Navigator push direpresentasikan oleh panah biru di tengah diagram. Panah biru menunjukkan bahwa ada widget baru yang ditambahkan ke pohon widget setelah Navigator push.

   Diagram tersebut menggunakan kode warna, dengan hijau menunjukkan widget yang tidak berubah dan biru menunjukkan widget yang baru setelah Navigator push.

2. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!<br>
   <img src="assets/images/result_praktikum3.gif" width=50%>