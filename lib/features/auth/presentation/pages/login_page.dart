import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:be_kind_project/core/services/api_service.dart';
import 'package:be_kind_project/core/theme/app_colors.dart';
import 'package:be_kind_project/core/routing/sign_language_page_route.dart';
import 'package:be_kind_project/features/guide/presentation/pages/guide_screen.dart';
import 'package:be_kind_project/features/auth/presentation/pages/signup_page.dart';
import 'package:be_kind_project/features/auth/presentation/pages/forgetpassword.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  bool _isObscure = true;
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (_usernameController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      _showMessage("برجاء إدخال اسم المستخدم وكلمة المرور", isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final apiService = ApiService();

      final response = await apiService.post(
        'https://newproject-production-396a.up.railway.app/api/auth/login',
        {
          'name': _usernameController.text.trim(),
          'password': _passwordController.text,
        },
      );

      if (!mounted) return;

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        // 🔥 استخراج التوكن وحفظه بشكل صحيح تماماً طبقاً لرد الباك إند
        if (response.data != null && response.data is Map) {
          final resMap = response.data as Map<String, dynamic>;
          String? token = resMap['token'];

          // إذا كان التوكن محشوراً داخل كائن الـ data الداخلي
          if (token == null &&
              resMap['data'] != null &&
              resMap['data'] is Map) {
            token = resMap['data']['token'];
          }

          if (token != null && token.isNotEmpty) {
            await _secureStorage.write(key: 'authToken', value: token);
            debugPrint("✅ تم صيد وحفظ التوكن في ذاكرة الهاتف بنجاح!");
          }
        }

        _showMessage("تم تسجيل الدخول بنجاح", isError: false);

        Navigator.pushReplacement(
          context,
          SignLanguagePageRoute(page: const GuideScreen()),
        );
      } else {
        String msg = response?.data['message'] ?? "بيانات الدخول غير صحيحة";
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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 60),
              _buildTextField(
                'Username',
                _usernameController,
                Icons.person_outline,
              ),
              const SizedBox(height: 20),
              _buildPasswordField(
                label: 'Password',
                controller: _passwordController,
                isObscure: _isObscure,
                onTap: () => setState(() => _isObscure = !_isObscure),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen(),
                    ),
                  ),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(color: AppColors.accent),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Login',
                          style: GoogleFonts.playfair(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.accent),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
      ),
    );
  }

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
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
