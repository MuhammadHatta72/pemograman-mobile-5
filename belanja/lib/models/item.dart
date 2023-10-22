import 'package:flutter/material.dart';

class Item {
  String name;
  int price;
  int stock;
  int rating;

  Item({
    required this.name,
    required this.price,
    required this.stock,
    required this.rating,
  });
}