import 'package:flutter/material.dart';
import 'package:food_delivery/viewmodal/success_screen.dart';
import 'package:pinput/pinput.dart';

import '../Components/CustomButton.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter your verification code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
            ),
            const SizedBox(height: 10),
            Text(
              "We have sent a verification code to email",
              textAlign: TextAlign.center,

            ),
            const SizedBox(height: 20),

            // OTP Input Fields
            Pinput(
              controller: otpController,
              length: 4,
              defaultPinTheme: PinTheme(
                height: 50,
                width: 50,
                textStyle: const TextStyle(fontSize: 22,
                    fontWeight: FontWeight.bold, color: Colors.white),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onCompleted: (pin) {
                print("Entered OTP: $pin");
              },
            ),

            const SizedBox(height: 30),

            // Continue Button

            CustomButton(
              title: 'Continue',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessScreen()));

                print("OTP Entered: ${otpController.text}");
              },
            ),

            const SizedBox(height: 20),

            // Resend Code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Haven’t received the code?", style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {

                    print("Resend Code Clicked");
                  },
                  child: const Text(
                    "Resend code",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

