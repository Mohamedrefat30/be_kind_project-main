import 'package:be_kind_project/app_colors.dart';
import 'package:be_kind_project/auth_button.dart';
import 'package:be_kind_project/login_page.dart';
import 'package:be_kind_project/signup_page.dart';
import 'package:flutter/material.dart';

class SplashPage2 extends StatelessWidget {
  const SplashPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/58aafa642f6585eeae5b865aaac476eb75874c54.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 25,
            right: 25,
            child: Column(
              children: [
                AuthButton(
                  text: 'Sign up',
                  color: AppColors.accent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  textColor: Colors.white,
                ),
                const SizedBox(height: 20),
                AuthButton(
                  text: 'Login',
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
