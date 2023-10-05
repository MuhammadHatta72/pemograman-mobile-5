//Eksperimen Tipe Data Maps

void main() {
  var gifts = {
    // Key:    Value
    'first': 'Muhammad hatta',
    'second': '2141720021',
    'fifth': 1
  };

  var nobleGases = {
    2: 'Muhammad Hatta',
    10: '2141720021',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  mhs1['first'] = 'Muhammad hatta';
  mhs1['second'] = '2141720021';
  mhs1['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'Muhammad Hatta';
  mhs2[10] = '2141720021';
  mhs2[18] = 'argon';

  print(mhs1);
  print(mhs2);
}
