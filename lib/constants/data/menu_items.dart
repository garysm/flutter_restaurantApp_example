import 'package:flutter_restaurant_app_example/models/menu_item.dart';

List<MenuItem> menuItems = [
  MenuItem(
    id: 1,
    name: 'Fresh Soup',
    type: DishType.smallDish,
    price: 8.79,
    imagePath: 'assets/images/soup.jpg',
    rating: 4.5,
    numberOfReviews: 121,
  ),
  MenuItem(
    id: 2,
    name: 'Fresh Clams',
    type: DishType.largeDish,
    price: 13.79,
    imagePath: 'assets/images/clams.jpg',
    rating: 5.0,
    numberOfReviews: 76,
  ),
  MenuItem(
    id: 3,
    name: 'Fresh Salad',
    type: DishType.smallDish,
    price: 7.79,
    imagePath: 'assets/images/salad.jpg',
    rating: 5.0,
    numberOfReviews: 196,
  ),
  MenuItem(
    id: 4,
    name: 'Shrimp Pasta',
    type: DishType.largeDish,
    price: 13.79,
    imagePath: 'assets/images/shrimp.jpg',
    rating: 3.5,
    numberOfReviews: 117,
  ),
  MenuItem(
    id: 5,
    name: 'Penne Pasta',
    type: DishType.largeDish,
    price: 11.79,
    imagePath: 'assets/images/penne.jpg',
    rating: 4.0,
    numberOfReviews: 322,
  ),
];
