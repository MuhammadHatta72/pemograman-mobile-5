import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            // soal 1
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // soal 2
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'Salah satu keajaiban dunia, Candi Borobudur',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'Magelang, Indonesia',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )),
          // soal 3
          Icon(
            //membuat ikon bintang
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Muhammad Hatta - 2141720021\n\n'
            'Candi Borubudur adalah sebuah candi Buddha yang terletak di Borobudur, Magelang, Jawa Tengah, Indonesia.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Muhammad Hatta (2141720021)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layyouting'),
        ),
        // body: const Center(
        //   child: Text('Hello World'),
        // ),
        // body: Column(
        body: ListView(
          children: [
            Image.asset('assets/images/candi-borobudur.jpg',
                width: 600, height: 240, fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}