import 'package:be_kind_project/features/auth/presentation/pages/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:be_kind_project/core/services/api_service.dart';
import 'package:be_kind_project/core/theme/app_colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  // دالة إرسال كود التحقق مربوطة بالسيرفر الأونلاين
  Future<void> _sendCode() async {
    if (_emailController.text.trim().isEmpty) {
      _showMessage("برجاء إدخال البريد الإلكتروني", isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final apiService = ApiService();

      // ✅ تعديل: أضفنا الرابط الكامل للسيرفر الأونلاين لضمان نجاح الاتصال بالـ API
      final response = await apiService.post(
        'https://newproject-production-396a.up.railway.app/api/auth/forgot-password',
        {'email': _emailController.text.trim()},
      );

      if (!mounted) return;

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        _showMessage("تم إرسال كود التحقق بنجاح");

        // النقل لصفحة VerifyCodeScreen وتمرير الإيميل
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VerifyCodeScreen(email: _emailController.text.trim()),
          ),
        );
      } else {
        String msg = response?.data['message'] ?? "البريد الإلكتروني غير مسجل";
        _showMessage(msg, isError: true);
      }
    } catch (e) {
      _showMessage("خطأ في الاتصال بالسيرفر، تأكد من الإنترنت", isError: true);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showMessage(String msg, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: Colors.black, size: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Forget Password',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent, // استخدام اللون الموحد
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'أين تريد استقبال كود التحقق؟',
                style: GoogleFonts.playfairDisplay(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  // ✅ تعديل: توحيد الألوان باستخدام AppColors.accent ليعطي Clean Look
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.accent,
                  ),
                  labelStyle: const TextStyle(color: Colors.black54),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.accent),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _sendCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Send Code',
                          style: GoogleFonts.playfair(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
