import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. استخدم SingleChildScrollView عشان الصفحة تقبل التمرير لما الكيبورد يفتح
      body: SingleChildScrollView(
        child: Container(
          // 2. حدد طول الحاوية بطول الشاشة عشان الـ Spacer يشتغل صح
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.black, size: 28),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(height: 60),
                Text(
                  'Forget Password',
                  style: GoogleFonts.hanuman(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 183, 120, 130),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Where would you like to receive a verification code?',
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 60),
                const TextField(
                  // الكيبورد هيظهر تلقائي أول ما تدوس هنا
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                // الـ Spacer هيدفع الزرار لتحت طول ما الكيبورد مقفول
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 195, 114, 126),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Send Code',
                      style: GoogleFonts.playfair(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 400), // مسافة أمان تحت الزرار
              ],
            ),
          ),
        ),
      ),
    );
  }
}
