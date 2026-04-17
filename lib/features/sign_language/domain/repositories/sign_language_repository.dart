import 'package:be_kind_project/features/sign_language/domain/entities/selected_image.dart';

abstract class SignLanguageRepository {
  Future<SelectedImage?> pickFromCamera();
  Future<SelectedImage?> pickFromGallery();
}
