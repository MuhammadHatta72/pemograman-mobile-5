//Eksperimen Tipe Data List: Spread dan Control-flow Operators

void main() {
  // var list = [1, 2, 3];
  // var list2 = [0, ...list];
  // print(list);
  // print(list2);
  // print(list2.length);

  // list = [1, 2, null];
  // print(list);
  // var list3 = [0, ...?list];
  // print(list3.length);

  // hasilnya error karena pada dart, tidak memungkinkan menambah nilai null pada collection
  // dengan menggunakan cara biasa. solusinya menggunakan tipe data list.
  // List<dynamic> list = [1, 2, 3];
  // List<dynamic> list2 = [0, ...list];
  // print(list);
  // print(list2);
  // print(list2.length);

  // list = [1, 2, null];
  // print(list);
  // List<dynamic> list3 = [0, ...list]; // Gunakan operator null-aware (...?)
  // list2 = ['Muhammad Hatta', '2141720021', ...list];
  // print(list2);
  // print(list3.length);

  // step 4
  // Control-flow Operators
  // var promoActive = true;
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // step 5
  // var login = 'Manager';
  // var nav2 = [
  //   'Home',
  //   'Furniture',
  //   'Plants',
  //   if (login case 'Manager') 'Inventory'
  // ];
  // print(nav2);

  // jadi didalam list nav2, jika login case 'Manager' maka akan menambahkan 'Inventory'
  // jika tidak maka tidak akan menambahkan 'Inventory'

  // step 6
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);

  // jadi didalam list listOfStrings, akan menambahkan nilai '#0' dan '#1' jika nilai listOfInts
  // dan memungkinkan menambah list baru didalam list listOfStrings
}
