import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(name: 'Sugar', price: 5000, stock: 10, rating: 4),
      Item(name: 'Salt', price: 2000, stock: 5, rating: 3),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: ListTile(
                title: Text(item.name),
                subtitle: Text('Price: ${item.price}'),
                trailing: Text('Stock: ${item.stock}'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/item',
                    arguments: item,
                  );
                },
              ),
            );
          },
        ),
      )
    );
  }
}
