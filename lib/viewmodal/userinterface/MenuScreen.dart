import 'package:flutter/material.dart';
import 'package:food_delivery/viewmodal/userinterface/CartScreen.dart';
import 'package:food_delivery/viewmodal/userinterface/DetailsScreen.dart';
import '../../modals/food_items.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  final tabs = const ['Featured', 'Top of Week', 'Soup', 'Seafood'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _grid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dummyFoods.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (ctx, i) {
        final f = dummyFoods[i];
        return GestureDetector(

          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen())),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: Image.asset(f.image, height: 110, width: double.infinity, fit: BoxFit.cover)),
                const SizedBox(height: 8),
                Text(f.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('\$${f.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Your Menus',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 12),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: const  Color(0xFF000000),
                  unselectedLabelColor: Colors.grey,
                  tabs: tabs.map((t) => Tab(text: t)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _grid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (i) {
          if (i == 0) Navigator.pushReplacementNamed(context, '/');
          if (i == 2) Navigator.pushNamed(context, '/cart');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
