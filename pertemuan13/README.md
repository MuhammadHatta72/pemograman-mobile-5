# Pertemuan 13
# Praktikum 1: Mengunduh Data dari Web Service (API)

**Soal 1**<br>
Tambahkan nama panggilan Anda pada `title app` sebagai identitas hasil pekerjaan Anda.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future demo Baha', #menambahkan nama pada title
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {

  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from Future Demo'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {},
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
}

```

<img src="assets\images\soal1.png" width="50%" height="50%">
<br>

**Soal 2**

- Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut
  <img src="assets\images\soal2a.png" width="50%" height="50%">
  <br>
- Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil.
  <img src="assets\images\soal2b.png" width="50%" height="50%">
  <br>

**Soal 3**
<img src="assets\images\soal3.png" width="50%" height="50%">
<br>

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

**1. Buka file main.dart<br>**
Tambahkan tiga method berisi kode seperti berikut di dalam `class _FuturePageState`.

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

**2. Tambah method count()<br>**
Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.

```dart
  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
```

**3. Panggil count()<br>**
Lakukan comment kode sebelumnya, ubah isi kode **onPressed()** menjadi seperti berikut.

```dart
ElevatedButton(
  child: const Text('GO!'),
  onPressed: () {
    count();
    //Praktikum 1
    // setState(() {});
    // getData().then((value) {
    //   result = value.body.toString().substring(0, 450);
    //   setState(() {});
    // }).catchError((_) {
    //   result = 'An error occurred!';
    //   setState(() {});
    // });
  },
),
```

**Soal 4**

- Jelaskan maksud kode langkah 1 dan 2 tersebut!<br>
  **Jawab<br>**

- **Code 1**

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

Tiga fungsi diatas melakukan tugas yang sama, yaitu mengembalikan sebuah angka tertentu setelah beberapa saat.

- Fungsi `returnOneAsync()` mengembalikan angka 1 setelah 3 detik.
- Fungsi `returnTwoAsync()` mengembalikan angka 2 setelah 3 detik.
- Fungsi `returnThreeAsync()` mengembalikan angka 3 setelah 3 detik.

- **Code 2**

```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

Fungsi `count()` menggunakan Future dan async-await untuk menjalankan proses secara asynchronous. Fungsi ini dimulai dengan menginisialisasi variabel total ke 0.<br><br>
Setelah itu, fungsi memanggil returnOneAsync(), returnTwoAsync(), dan returnThreeAsync() secara asynchronous menggunakan await. Hal ini berarti bahwa proses di bawah ini tidak akan memblokir proses utama, yang mengartikan bahwa aplikasi dapat melanjutkan eksekusi proses lainnya sementara proses ini berjalan.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 4".
  <img src="soal 4.gif" width=50%>

---

# Praktikum 3: Menggunakan Completer di Future

**1. Buka main.dart<br>**
Pastikan telah impor package async berikut.

```dart
import 'package:async/async.dart';
```

**2. Tambahkan variabel dan method<br>**
Tambahkan variabel late dan method di `class _FuturePageState` seperti ini.

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

**3. Ganti isi kode onPressed()<br>**
Tambahkan kode berikut pada fungsi `onPressed()`. Kode sebelumnya bisa Anda comment.

**4. Run<br>**
Terakhir, **run** atau tekan **F5** untuk melihat hasilnya jika memang belum running. Bisa juga lakukan **hot restart** jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.<br>
<img src="flutter_03.png" width=50%>

**Soal 5**

- Jelaskan maksud kode langkah 2 tersebut!<br>
  Jawab:<br>
  Fungsi `getNumber()` menggunakan Future dan async-await untuk menjalankan proses secara asynchronous. Fungsi ini dimulai dengan menginisialisasi objek Completer dengan data tipe integer.<br><br>
  Setelah itu, fungsi memanggil fungsi `calculate()` secara asynchronous menggunakan await. Proses ini dilakukan setelah sekian waktu dengan menggunakan fungsi `Future.delayed()`. Lalu, fungsi `calculate()` menggunakan metode `complete()` dari objek Completer untuk mengembalikan nilai 42.

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 5".<br>
  <img src="soal 5.gif" width=50%>

**5. Ganti method calculate()<br>**
Gantilah isi code method `calculate()` seperti kode berikut, atau Anda dapat membuat `calculate2()`

```dart
  Future calculate() async {
    // await Future.delayed(const Duration(seconds: 5));
    // completer.complete(42);
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }
```

**6. Pindah ke onPressed()<br>**
Ganti menjadi kode seperti berikut.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

**Soal 6**

- Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!<br>
  **Jawab<br>**

    - **Code 1**

  ```dart
    Future calculate() async {
      try {
        await Future.delayed(const Duration(seconds: 5));
        completer.complete(42);
      } catch (_) {
        completer.completeError({});
      }
    }
  ```

    - Fungsi `calculate` diatas akan mengembalikan sebuah objek `Future` yang berisi nilai `42` setelah selesai menunggu waktu yang ditentukan. Jika terjadi kesalahan saat eksekusi, maka objek `Future` tersebut akan mengalami kesalahan dan mengirimkan objek error kosong.
    - kode diatas akan mengeksekusi fungsi `getNumber()`, mengatur ulang komponen widget apabila promise terpenuhi, dan mengatur ulang komponen widget menjadi teks kesalahan apabila promise tergagal.
      <br><br>
    - **Code 2**

  ```dart
  getNumber().then((value) {
    setState(() {
      result = value.toString();
    });
    }).catchError((e) {
    result = 'An error occurred';
  });
  ```

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W12: Soal 6".
  <img src="soal 6.gif" width=50%>

# Praktikum 4: Memanggil Future secara paralel