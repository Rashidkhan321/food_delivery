import 'package:flutter/material.dart';
import 'package:food_delivery/Components/CustomButton.dart';
import 'package:food_delivery/authiucation/login.dart';
import 'package:food_delivery/authiucation/verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // ✅ If form passes validation, navigate to VerificationScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerificationScreen()),
      );
    } else {
      // ❌ If not valid, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please correct the errors before proceeding.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF2E7D4A);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // ✅ Wrap with Form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create account and choose favorite menu',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 22),

                  // Name Field
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: _nameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Your name',

                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.trim().length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // Email Field
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(

                      labelText: 'Email',
                      hintText: 'Your email',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // Password Field
                  TextFormField(
                    controller: _passCtrl,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () =>
                            setState(() => _hidePassword = !_hidePassword),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: 'Register',
                      onPress: _submitForm, // ✅ Runs validation
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account? "),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: primary, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'By clicking Register, you agree to our Terms and Data Policy.',
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
