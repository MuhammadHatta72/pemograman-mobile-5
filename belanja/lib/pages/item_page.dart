import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengakses argumen yang dikirimkan dari HomePage
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Warung Pojok'),
      ),
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Image.asset(item.urlImage),
        //     Text('Name: ${item.name}'),
        //     Text('Price: ${item.price}'),
        //     Text('Stock: ${item.stock}'),
        //     Text('Rating: ${item.rating}'),
        //   ],
        // ),
        child : Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.asset(item.urlImage),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp. ${item.price}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                'Stock: ${item.stock}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Rating: ${item.rating}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
