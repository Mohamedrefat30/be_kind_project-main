import 'package:be_kind_project/animationreload.dart';
import 'package:be_kind_project/signlanguagepage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Guidscreen());
}

class Guidscreen extends StatelessWidget {
  const Guidscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoInstructionsScreen(),
    );
  }
}

class PhotoInstructionsScreen extends StatelessWidget {
  const PhotoInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // العنوان
              const Text(
                'How to take a photo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 30),
              Image.asset("assets/images/Frame 142.png"),
              const SizedBox(height: 30),
              Image.asset("assets/images/Frame 143.png"),
              const SizedBox(height: 30),
              Image.asset("assets/images/Frame 144.png"),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SignLanguagePageRoute(page: const SignLanguagePage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.black, width: 1),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),

                  child: Text(
                    "Continue",

                    style: GoogleFonts.playfair(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
}
