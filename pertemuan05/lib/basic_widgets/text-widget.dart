import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        "Nama saya Muhammad Hatta, sedang belajar Pemrograman Mobile",
        style: TextStyle(color: Colors.green, fontSize: 18),
        textAlign: TextAlign.center);
  }
}