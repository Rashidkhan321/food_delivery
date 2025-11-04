import 'package:flutter/material.dart';
import 'package:food_delivery/viewmodal/userinterface/HomeScreen.dart';

import '../Components/CustomButton.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = const  Color(0xFF000000);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/success.png',
                      width: 260,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your account is complete, please enjoy the best menu from us.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child:

                  CustomButton(title: 'Get Started', onPress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  })


                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
