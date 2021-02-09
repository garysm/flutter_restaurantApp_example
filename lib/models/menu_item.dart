import 'package:flutter/foundation.dart';

enum DishType { smallDish, largeDish, none }

class MenuItem {
  final int id;
  final String name;
  final DishType type;
  final double price;
  final String imagePath;
  final double rating;
  final int numberOfReviews;

  MenuItem({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.price,
    @required this.imagePath,
    @required this.rating,
    @required this.numberOfReviews,
  });
}
