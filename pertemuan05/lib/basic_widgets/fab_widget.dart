import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FabWidget extends StatelessWidget {
  const FabWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.thumb_up),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}