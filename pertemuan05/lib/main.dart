import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pertemuan05/basic_widgets/date_timepickers_widget.dart';
import 'package:pertemuan05/basic_widgets/dialog_widget.dart';
import 'package:pertemuan05/basic_widgets/fab_widget.dart';
import 'package:pertemuan05/basic_widgets/image_widget.dart';
import 'package:pertemuan05/basic_widgets/input_selection_widget.dart';
import 'package:pertemuan05/basic_widgets/loading_cupertino.dart';
import 'package:pertemuan05/basic_widgets/scaffold_widget.dart';
import 'package:pertemuan05/basic_widgets/text-widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),

      // home: const LoadingCupertino(),

      // home: const FabWidget(),

      // home: ScaffoldWidget(title: 'Flutter Demo Home Page Scalfold'),

      // home: Scaffold(
      //   appBar: AppBar(title: const Text("Dialog Widget")),
      //   body: DialogWidget(),
      // ),

      // home: InputSelectionWidget(),

      // home: Scaffold(
      //   appBar: AppBar(title: const Text("Contoh TextField")),
      //   body: const TextField(
      //     obscureText: false,
      //     decoration: InputDecoration(
      //       border: OutlineInputBorder(),
      //       labelText: 'Nama',
      //     ),
      //   ),
      // ),

      // home: MyHomePage(title: 'Contoh Date Picker'),

      home: DateTimepickers(title: 'Contoh Date Picker'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),

            // Widget Text
            // const MyTextWidget(),

            //Widget Image
            // const MyImageWidget(),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}