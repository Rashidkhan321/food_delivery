import 'package:flutter/material.dart';
import 'package:food_delivery/authiucation/login.dart';
import 'package:food_delivery/components/CustomButton.dart';

import 'onboarding2.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF000000);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              // small top center logo + title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 26, height: 26),
                  const SizedBox(width: 8),
                  const Text(
                    'black Cupe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const Spacer(),
              // circular image area with food
              Center(
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade100,
                  ),
                  child: Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/food.png',
                        width: 220,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'All your favorites foods',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Order your favorite menu with many on-demand delivery',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 28),
              // Continue and Sign in buttons
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding2()));

                  },
                  title: 'Continue',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    side: BorderSide(color: primary.withOpacity(0.15)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Sign in'),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
