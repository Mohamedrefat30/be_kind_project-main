import 'package:be_kind_project/app_colors.dart';
import 'package:be_kind_project/login_page.dart';
import 'package:be_kind_project/sign_language_page_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscurePass = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 100),
              _buildTextField('Full Name'),
              const SizedBox(height: 20),
              _buildTextField('Email Id'),
              const SizedBox(height: 20),
              _buildPasswordField(
                label: 'Password',
                isObscure: _isObscurePass,
                onTap: () {
                  setState(() => _isObscurePass = !_isObscurePass);
                },
              ),
              const SizedBox(height: 20),
              _buildPasswordField(
                label: 'Confirm Password',
                isObscure: _isObscureConfirm,
                onTap: () {
                  setState(() => _isObscureConfirm = !_isObscureConfirm);
                },
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SignLanguagePageRoute(page: const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.playfair(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required bool isObscure,
    required VoidCallback onTap,
  }) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onTap,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
      ),
    );
  }
}
