import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/sign_language/domain/usecases/pick_image_from_camera_usecase.dart';
import 'package:be_kind_project/features/sign_language/domain/usecases/pick_image_from_gallery_usecase.dart';

class SignLanguageController {
  const SignLanguageController({
    required PickImageFromCameraUseCase pickImageFromCameraUseCase,
    required PickImageFromGalleryUseCase pickImageFromGalleryUseCase,
  }) : _pickImageFromCameraUseCase = pickImageFromCameraUseCase,
       _pickImageFromGalleryUseCase = pickImageFromGalleryUseCase;

  final PickImageFromCameraUseCase _pickImageFromCameraUseCase;
  final PickImageFromGalleryUseCase _pickImageFromGalleryUseCase;

  Future<File?> pickFromCamera() async {
    final selected = await _pickImageFromCameraUseCase(const NoParams());
    return selected?.file;
  }

  Future<File?> pickFromGallery() async {
    final selected = await _pickImageFromGalleryUseCase(const NoParams());
    return selected?.file;
  }

  Future<Map<String, dynamic>> translateImage(
    String imagePath,
    String token,
  ) async {
    try {
      final dio = Dio();

      const String url =
          "https://newproject-production-396a.up.railway.app/api/translation/upload";

      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imagePath,
          filename: "sign_image.jpg",
        ),
      });

      debugPrint("📡 جاري الإرسال إلى: $url");

      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          validateStatus: (status) => true,
        ),
      );

      debugPrint("📬 كود حالة الرد: ${response.statusCode}");
      debugPrint("📦 البيانات الخام القادمة من السيرفر: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data != null && response.data is Map) {
          final data = response.data as Map<String, dynamic>;

          String? textResult;
          String? audio;

          if (data.containsKey('translation')) {
            textResult = data['translation']?.toString();
            audio = data['audioUrl']?.toString();
          } else if (data['data'] != null && data['data'] is Map) {
            final nestedData = data['data'] as Map<String, dynamic>;
            textResult =
                nestedData['translation']?.toString() ??
                nestedData['result']?.toString();
            audio = nestedData['audioUrl']?.toString();
          }

          if (textResult != null && textResult.isNotEmpty) {
            return {'success': true, 'text': textResult, 'audioUrl': audio};
          }
        }
      }
      String errorMessage = "لم يتم التعرف على النص";
      if (response.data != null && response.data is Map) {
        errorMessage = response.data['message']?.toString() ?? errorMessage;
      }
      return {'success': false, 'error': errorMessage};
    } catch (e) {
      return {'success': false, 'error': "تعذر الاتصال بالسيرفر: $e"};
    }
  }
}
