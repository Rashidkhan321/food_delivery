import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/viewmodal/onboarding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // show splash for 1.4 seconds then go to onboarding1
    Timer(const Duration(milliseconds: 1400), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // green background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 220,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // logo image

              const SizedBox(height: 18),
              const Text(
                'black Cupe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
