void main() {
  // for (int i = 0; i < 5; i++) {
  //   String stars = '';
  //   for (int j = 0; j <= i; j++) {
  //     stars += '🥰 ';
  //   }
  //   print(stars);
  // }
  // for (int i = 4; i > 0; i--) {
  //   String stars = '';
  //   for (int j = 0; j < i; j++) {
  //     stars += '🥰 ';
  //   }
  //   print(stars);
  // }
  for (int i = 0; i < 10; i++) {
    String stars = '';
    if (i <= 5) {
      for (int j = 0; j < i; j++) {
        stars += '🥰 ';
      }
    } else {
      for (int j = i; j < 10; j++) {
        stars += '🥰 ';
      }
    }
    print(i);
    print(stars);
  }
}
