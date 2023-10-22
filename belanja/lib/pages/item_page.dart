import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengakses argumen yang dikirimkan dari HomePage
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${item.name}'),
            Text('Price: ${item.price}'),
            Text('Stock: ${item.stock}'),
            Text('Rating: ${item.rating}'),
          ],
        ),
      ),
    );
  }
}
