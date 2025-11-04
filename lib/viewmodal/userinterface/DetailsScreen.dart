import 'package:flutter/material.dart';
import 'package:food_delivery/components/CustomButton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Cheeseburger',
      'image': 'assets/images/food1.jpg',
      'price': 200.9,
      'quantity': 1,
    },
    {
      'name': 'Cheeseburger',
      'image': 'assets/images/food2.jpg',
      'price': 1000.6,
      'quantity': 1,
    },
    {
      'name': 'Cheeseburger',
      'image': 'assets/images/food3.jpg',
      'price': 900.8,
      'quantity': 1,
    },
  ];

  double get totalPrice {
    return cartItems.fold(
        0,
            (sum, item) =>
        sum + (item['price'] as double) * (item['quantity'] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Delivery Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.black),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Delivery to Home",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Delivery to Home",

                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "5 km",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Cart List
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(


                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                item['image'],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle( color: Colors.black,
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (item['quantity'] > 1) {
                                              item['quantity']--;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove_circle_outline,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        item['quantity'].toString(),
                                        style: const TextStyle(

                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            item['quantity']++;
                                          });
                                        },
                                        icon: const Icon(Icons.add_circle,
                                            color: Color(0xFF000000)),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "\$${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                                        style: const TextStyle( color:  Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: CustomButton(title: 'Place Order', onPress: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Order placed successfully! Total: \$${totalPrice.toStringAsFixed(2)}"),
                  ),
                );

              }),
            ),
            // Place Order Button

          ],
        ),
      ),

    );
  }
}
