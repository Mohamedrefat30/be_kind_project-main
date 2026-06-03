import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:be_kind_project/core/services/api_service.dart';
import 'package:be_kind_project/core/theme/app_colors.dart';
import 'package:be_kind_project/features/auth/presentation/pages/login_page.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;

  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // ✅ تعديل: فصل متغيرات الإخفاء والإظهار لكل حقل بشكل مستقل لـ UX أفضل
  bool _isObscurePass = true;
  bool _isObscureConfirm = true;
  bool _isLoading = false;

  Future<void> _handleResetPassword() async {
    // 1. التحقق من إدخال البيانات
    if (_codeController.text.trim().isEmpty ||
        _newPasswordController.text.isEmpty) {
      _showMessage("برجاء إدخال الكود وكلمة المرور الجديدة", isError: true);
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      _showMessage("كلمات السر غير متطابقة", isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final apiService = ApiService();

      // 2. تجهيز الداتا بناءً على ملف الـ API الخاص بالـ Postman
      final Map<String, dynamic> requestData = {
        'email': widget.email.trim(),
        'code': _codeController.text.trim(),
        'newPassword': _newPasswordController.text,
      };

      print("DEBUG: Sending Reset Data: $requestData");

      // 3. ✅ تعديل: وضع الرابط الكامل للسيرفر الأونلاين لضمان نجاح الاتصال
      final response = await apiService.post(
        'https://newproject-production-396a.up.railway.app/api/auth/reset-password',
        requestData,
      );

      if (!mounted) return;

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        print("DEBUG: Reset Success: ${response.data}");
        _showMessage("تم تغيير كلمة المرور بنجاح!", isError: false);

        // انتظار بسيط قبل الرجوع للـ Login ليرى المستخدم الرسالة
        await Future.delayed(const Duration(seconds: 2));

        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      } else {
        print("DEBUG: Reset Failed Response: ${response?.data}");
        String errorMsg =
            response?.data['message'] ?? "الكود غير صحيح أو انتهت صلاحيته";
        _showMessage(errorMsg, isError: true);
      }
    } catch (e) {
      print("DEBUG: Exception during Reset: $e");
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
        behavior: SnackBarBehavior.floating, // تفعيل الـ Floating بشكل موحد
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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                'Verify Code',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "تم إرسال كود التحقق إلى:\n${widget.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 50),

              _buildTextField(
                'Verification Code',
                _codeController,
                Icons.vignette_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // حقل كلمة السر الجديدة
              _buildPasswordField(
                label: 'New Password',
                controller: _newPasswordController,
                isObscure: _isObscurePass,
                onTap: () => setState(() => _isObscurePass = !_isObscurePass),
              ),
              const SizedBox(height: 20),

              // حقل تأكيد كلمة السر الجديدة
              _buildPasswordField(
                label: 'Confirm New Password',
                controller: _confirmPasswordController,
                isObscure: _isObscureConfirm,
                onTap: () =>
                    setState(() => _isObscureConfirm = !_isObscureConfirm),
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleResetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Reset Password',
                          style: GoogleFonts.playfair(
                            fontSize: 20,
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

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.accent),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
      ),
    );
  }

  // ✅ تعديل الـ Widget لاستقبال الـ parameters الجديدة المنفصلة
  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool isObscure,
    required VoidCallback onTap,
  }) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.lock_outline, color: AppColors.accent),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onTap,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
      ),
    );
  }
}
