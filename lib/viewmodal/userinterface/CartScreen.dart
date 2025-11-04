import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;
  String selectedSauce = 'Burger';
  double basePrice = 39.99;

  @override
  Widget build(BuildContext context) {
    double totalPrice = basePrice * quantity + 2.00; // Example topping price
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Food Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/food1.jpg', // Replace with your asset
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Food name and heart icon
            Container(
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "American Burger ",
                            style: TextStyle

                              (   color:Colors.black,
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "American food",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            const SizedBox(height: 16),

            // Quantity and price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  "\$${(basePrice * quantity).toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sauce selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sauce",

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    RadioListTile<String>(
                      title: const Text("Teriyaki", style: TextStyle(
                          color: Colors.black
                      ),),
                      value: 'Teriyaki',
                      groupValue: selectedSauce,
                      onChanged: (value) {
                        setState(() => selectedSauce = value!);
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("Yakiniku", style: TextStyle(
                        color: Colors.black,
                      ),),
                      value: 'Yakiniku',
                      groupValue: selectedSauce,
                      onChanged: (value) {
                        setState(() => selectedSauce = value!);
                      },
                    ),
                  ],
                ),
              ),
            ),
            

            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sauce",

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    RadioListTile<String>(
                      title: const Text("Teriyaki", style: TextStyle(
                          color: Colors.black
                      ),),
                      value: 'Teriyaki',
                      groupValue: selectedSauce,
                      onChanged: (value) {
                        setState(() => selectedSauce = value!);
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("Yakiniku", style: TextStyle(
                        color: Colors.black,
                      ),),
                      value: 'Yakiniku',
                      groupValue: selectedSauce,
                      onChanged: (value) {
                        setState(() => selectedSauce = value!);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Add to cart button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const  Color(0xFFFFFFFF),
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                "Add to Cart (\$${totalPrice.toStringAsFixed(2)})",
                style:
                const TextStyle(

                    color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
