import 'dart:io';
import 'package:be_kind_project/core/theme/app_colors.dart';
import 'package:be_kind_project/features/sign_language/presentation/controllers/sign_language_controller.dart';
import 'package:be_kind_project/dependencies.dart';
import 'package:be_kind_project/features/sign_language/presentation/pages/transilation_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ConfirmImageScreen extends StatefulWidget {
  final String imagePath;

  const ConfirmImageScreen({super.key, required this.imagePath});

  @override
  State<ConfirmImageScreen> createState() => _ConfirmImageScreenState();
}

class _ConfirmImageScreenState extends State<ConfirmImageScreen> {
  bool _isLoading = false;
  late final SignLanguageController _controller;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _controller = SignLanguageController(
      pickImageFromCameraUseCase: Dependencies.pickImageFromCameraUseCase,
      pickImageFromGalleryUseCase: Dependencies.pickImageFromGalleryUseCase,
    );
  }

  Future<void> _translateImage() async {
    setState(() => _isLoading = true);

    try {
      String? token = await _secureStorage.read(key: 'authToken');

      if (token == null || token.isEmpty) {
        _showSnackBar(
          "⚠️ التوكن غير موجود بالهاتف، يرجى تسجيل الخروج والدخول مجدداً ",
        );
        setState(() => _isLoading = false);
        return;
      }

      final resultMap = await _controller.translateImage(
        widget.imagePath,
        token,
      );

      if (!mounted) return;

      if (resultMap['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TranslationResultScreen(
              imagePath: widget.imagePath,
              resultText: resultMap['text'] ?? "لا يوجد نص",
              audioUrl: resultMap['audioUrl'],
            ),
          ),
        );
      } else {
        _showSnackBar(resultMap['error'] ?? "فشلت معالجة الصورة.");
      }
    } catch (e) {
      _showSnackBar("💥 حدث استثناء غير متوقع: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Inter')),
        backgroundColor: Colors.redAccent,
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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Confirm Translation',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Hero(
              tag: 'sign_photo',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.42,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Analyze this sign?',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                color: AppColors.rose,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Our AI will process this image to determine the meaning of the sign language captured.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const Spacer(),
            _buildButton(
              label: 'Translate Now',
              onPressed: _isLoading ? null : _translateImage,
              isPrimary: true,
            ),
            const SizedBox(height: 12),
            _buildButton(
              label: 'Retake Photo',
              onPressed: () => Navigator.pop(context),
              isPrimary: false,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback? onPressed,
    required bool isPrimary,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: isPrimary
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.rose,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
