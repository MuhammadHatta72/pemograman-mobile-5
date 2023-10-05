//Eksperimen Tipe Data Records

// step 1
void main() {
  // var record = ('first', a: 2, b: true, 'last');
  // print(record);
  // // panggil fungsi tukar
  // // Buat record2 yang ingin Anda tukar
  // var record2 = (1, 2);
  // print("Sebelum ditukar: $record2");

  // // Memanggil fungsi tukar dan menyimpan hasilnya
  // var hasilTukar = tukar(record2);
  // print("Setelah ditukar: $hasilTukar");

  // step 4
  // Record type annotation in a variable declaration:
  (String, int) mahasiswa;
  // print(mahasiswa);

  // hasilnya error karena tidak ada nilai yang diberikan
  // // berikan nilai mahasiswa
  // mahasiswa = ('Muhammad Hatta', 2141720021);
  // print(mahasiswa);

  // step 5
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'

  //hasilnya tidak error, karena sudah diberikan nilai
  // berikan nilai nama dan nim pada salah satu record
  mahasiswa2 = ('Muhammad Hatta', a: 2141720021, b: true, 'last');
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
}

// step 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

// hasilnya sama dengan step 1

