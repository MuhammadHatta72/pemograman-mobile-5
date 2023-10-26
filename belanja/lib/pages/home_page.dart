import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
          name: 'Nasi Pecel',
          price: 12000,
          stock: 10,
          rating: 9,
          urlImage: "assets/images/ricepecel.jpeg"
      ),
      Item(
          name: 'Nasi Campur',
          price: 10000,
          stock: 15,
          rating: 8,
          urlImage: "assets/images/ricecampur.jpeg"
      ),
      Item(
          name: 'Nasi Goreng',
          price: 11000,
          stock: 12,
          rating: 8,
          urlImage: "assets/images/ricegoreng.jpeg"
      ),
      Item(
          name: 'Nasi Kabuli',
          price: 13000,
          stock: 8,
          rating: 9,
          urlImage: "assets/images/ricekabuli.jpeg"
      ),
      Item(
          name: 'Nasi Rawon',
          price: 15000,
          stock: 17,
          rating: 8,
          urlImage: "assets/images/ricerawon.jpeg"
      ),
      Item(
          name: 'Nasi Becek',
          price: 17000,
          stock: 6,
          rating: 9,
          urlImage: "assets/images/ricebecek.jpeg"
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        // add icon in title
        leading: Icon(Icons.shopping_cart),
        title: Text('Warung Pojok'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        // child: ListView.builder(
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //     final item = items[index];
        //     return Card(
        //       child: ListTile(
        //         title: Text(item.name),
        //         subtitle: Text('Price: ${item.price}'),
        //         trailing: Text('Stock: ${item.stock}'),
        //         onTap: () {
        //           Navigator.pushNamed(
        //             context,
        //             '/item',
        //             arguments: item,
        //           );
        //         },
        //       ),
        //     );
        //   },
        // ),
        child: GridView.count(
          crossAxisCount: 2,
          children: items.map((item) {
            return Card(
              // addpadding
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/item',
                    arguments: item,
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: item.name,
                        child: Image.asset(item.urlImage),
                      ),
                    ),
                    Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Price: ${item.price}'),
                  ],
                ),
              ),
            );
          }).toList(),
        )
      )
    );
  }
}
