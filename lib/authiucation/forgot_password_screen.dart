import 'package:flutter/material.dart';
import 'package:food_delivery/authiucation/verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _selected = 'email';

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF2E7D4A);

    Widget _option(String value, IconData icon, String title, String subtitle) {
      final selected = _selected == value;
      return InkWell(
        onTap: () => setState(() => _selected = value),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected ? primary.withOpacity(0.05) : Colors.transparent,
            border: Border.all(
                color: selected ? primary : Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: selected ? primary : Colors.grey),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: selected ? primary : Colors.black,
                          fontWeight: FontWeight.w500)),
                  Text(subtitle,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Select which contact details should we use to reset your password',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              _option('email', Icons.email_outlined, 'Email',
                  'Send to your email'),
              const SizedBox(height: 12),
              _option('phone', Icons.phone, 'Phone Number',
                  'Send to your phone number'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>       Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>VerificationScreen()))
                  ,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
