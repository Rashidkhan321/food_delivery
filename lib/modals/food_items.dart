class FoodItem {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final String image;

  FoodItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });
}

final dummyFoods = <FoodItem>[
  FoodItem(
    id: 'f1',
    title: 'Cheese Burger',
    subtitle: 'Japanese food',
    price: 39.99,
    image: 'assets/images/food1.jpg',
  ),
  FoodItem(
    id: 'f2',
    title: 'Cheese Burger',
    subtitle: 'Japanese bowl',
    price: 19.99,
    image: 'assets/images/food2.jpg',
  ),
  FoodItem(
    id: 'f3',
    title: 'Cheese Burger',
    subtitle: 'Soup',
    price: 12.50,
    image: 'assets/images/food3.jpg',
  ),
  FoodItem(
    id: 'f4',
    title: 'Cheese Burger',
    subtitle: 'Seafood',
    price: 27.12,
    image: 'assets/images/food4.jpg',
  ),
];
