//Eksperimen Tipe Data Set

// step 1
void main() {
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.

  names1.add('Muhammad Hatta');
  names1.add('2141720021');

  names2.addAll(names1);

  print(names1);
  print(names2);
}
