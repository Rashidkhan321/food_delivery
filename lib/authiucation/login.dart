import 'package:flutter/material.dart';
import 'package:food_delivery/authiucation/signup_screen.dart';
import 'package:food_delivery/components/CustomButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF2E7D4A);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Form(
            key: _formKey, // ✅ Attach form key
            child: ListView(
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Welcome Back 👋',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to your account',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 22),

                // ✅ Email Field
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Your email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegEx.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // ✅ Password Field
                TextFormField(
                  controller: _passCtrl,
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _hidePassword = !_hidePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 8),

                // ✅ Login Button with Validation
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    title: 'Login',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logging in...'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                  ),
                ),

                const SizedBox(height: 12),

                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text("Don’t have an account? Sign Up"),
                  ),
                ),

                const SizedBox(height: 16),

                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/images/logo.png',
                      width: 18, height: 18),
                  label: const Text('Sign in with Google'),
                ),

                const SizedBox(height: 8),

                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.apple),
                  label: const Text('Sign in with Apple'),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
