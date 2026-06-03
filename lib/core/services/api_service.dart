import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      // ✅ تعديل: تصحيح الدومين وإضافة .up.railway ليتطابق تماماً مع السيرفر الأونلاين
      baseUrl: 'https://newproject-production-396a.up.railway.app/api',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      // ⚠️ تم حذف contentType الموحد لكي يتيح لـ Dio التبديل التلقائي بين JSON و Multipart
    ),
  );

  // دالة الـ POST العادية (تسجيل دخول / إنشاء حساب)
  Future<Response?> post(String path, Map<String, dynamic> data) async {
    try {
      // ✅ هنا نحدد الـ JSON يدويًا للدوال العادية لضمان استقرارها
      final response = await _dio.post(
        path,
        data: data,
        options: Options(contentType: 'application/json'),
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  // الدالة الأساسية لرفع الصورة وتشغيل الـ AI
  Future<Response?> uploadImage(String filePath, String token) async {
    try {
      // تجهيز البيانات بصيغة Multipart
      FormData formData = FormData.fromMap({
        // 'image' هو الاسم الحقيقي المنتظر في الباك-إند بناءً على البوستمان
        "image": await MultipartFile.fromFile(
          filePath,
          filename: "sign_image.jpg",
        ),
      });

      // إرسال الطلب للمسار المحدد في البوستمان مع التوكن
      return await _dio.post(
        '/translation/upload',
        data: formData,
        options: Options(
          // ✅ التعديل: هنا الـ Dio سيضبط الـ contentType تلقائياً لـ multipart/form-data
          headers: {
            "Authorization": "Bearer $token", // إرسال الهوية للسيرفر
          },
        ),
      );
    } on DioException catch (e) {
      debugPrint("Dio Error: ${e.response?.data ?? e.message}");
      return e.response;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }
}
