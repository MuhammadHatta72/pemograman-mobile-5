// Eksperimen Tipe Data List

// step 1
// void main() {
//   var list = [1, 2, 3];
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = 1;
//   assert(list[1] == 1);
//   print(list[1]);
// }

// step 2
// penjelasan : dari kode diatas dapat disimpulkan, bahwa hasil dari run kodenya bukan
// menampilkan variabel list, melainkan menampilkan panjang dari variabel list, list dengan index ke 1,
// dan list dengan index ke 1 yang sudah diubah nilainya menjadi 1

// step 3
// void main() {
//   var list = List.filled(5, null);
//   list[0] = 'Muhammad Hatta';
//   list[1] = '2141720021';

//   print(list[0]);
//   print(list[1]);
// }

// diperbaiki biar bisa dijalankan
void main() {
  List<dynamic> list = List.filled(5, null);
  list[0] = 'Muhammad Hatta';
  list[1] = '2141720021';

  print(list[0]);
  print(list[1]);
}
