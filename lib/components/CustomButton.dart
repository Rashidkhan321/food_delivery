
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  final Gradient gradient;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.loading = false,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFFFFFFF),Color(0xffc0b7b7), ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     // borderRadius: BorderRadius.circular(50),
      onTap: loading ? null : onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading
            ? const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(child: CircularProgressIndicator(color: Colors.black)),
        )
            : Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.black,   fontWeight: FontWeight.bold,), // Ensure text color is visible
            ),
          ),
        ),
      ),
    );
  }
}

