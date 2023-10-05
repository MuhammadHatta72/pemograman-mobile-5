void main() {
  int nilai_pemograman_mobile = 70;

  if (nilai_pemograman_mobile >= 81 && nilai_pemograman_mobile <= 100) {
    print("A");
    declarePredicate('A');
  } else if (nilai_pemograman_mobile >= 76 && nilai_pemograman_mobile <= 80) {
    print("B");
    declarePredicate('B');
  } else if (nilai_pemograman_mobile >= 71 && nilai_pemograman_mobile <= 75) {
    print("C");
    declarePredicate('C');
  } else if (nilai_pemograman_mobile >= 66 && nilai_pemograman_mobile <= 70) {
    print("D");
    declarePredicate('D');
  } else if (nilai_pemograman_mobile < 66) {
    print("E");
    declarePredicate('E');
  }
}

void declarePredicate(String predicate) {
  if (predicate == 'A') {
    print("Nilai Anda Sangat Bagus");
  } else if (predicate == 'B') {
    print("Nilai Anda Bagus");
  } else if (predicate == 'C') {
    print("Nilai Anda Cukup");
  } else if (predicate == 'D') {
    print("Nilai Anda Kurang");
  } else if (predicate == 'E') {
    print("Nilai Anda Sangat Kurang");
  } else {
    print("Nilai Anda Tidak Valid");
  }
}
