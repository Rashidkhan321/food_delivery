import 'package:flutter/material.dart';
import 'package:food_delivery/viewmodal/userinterface/CartScreen.dart';
import 'package:food_delivery/viewmodal/userinterface/DetailsScreen.dart';
import 'package:food_delivery/viewmodal/userinterface/MenuScreen.dart';

import '../../modals/food_items.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _promoCard(BuildContext ctx) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Delivery to Home',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Text('Delivery to Home',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('2.4 km', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _horizontalFoodList(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dummyFoods.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (ctx, i) {
          final f = dummyFoods[i];
          return GestureDetector(


            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen())),

            //
            // pushNamed(context, '/details', arguments: f),
            child: Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(f.image, width: 150, height: 200, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(f.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600,
                                color: Colors.black
                            )),
                        const Spacer(),
                        Text('\$${f.price.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.green[700],

                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: 0,
        onTap: (i) {
          if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuScreen()));
          if (i == 2) Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              _promoCard(context),
              const SizedBox(height: 16),
              // Featured card
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cheese Burger', style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          const Text('Discount 40%', style: TextStyle(color: Colors.blueGrey)),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/food1.jpg', width: 180,
                                height: 120,
                                fit: BoxFit.cover, ),
                          )

                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen())),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const  Color(0xFF000000),
                      ),
                      child: const Text('Order Now'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text('Top of Week', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              _horizontalFoodList(context),
            ],
          ),
        ),
      ),
    );
  }
}
