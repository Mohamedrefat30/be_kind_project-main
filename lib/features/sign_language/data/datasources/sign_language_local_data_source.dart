import 'dart:io';

import 'package:be_kind_project/core/services/image_picker_service.dart';
import 'package:be_kind_project/features/sign_language/domain/entities/selected_image.dart';

class SignLanguageLocalDataSource {
  const SignLanguageLocalDataSource(this._pickerService);

  final ImagePickerService _pickerService;

  Future<SelectedImage?> pickFromCamera() async {
    final photo = await _pickerService.pickFromCamera();
    if (photo == null) return null;
    return SelectedImage(File(photo.path));
  }

  Future<SelectedImage?> pickFromGallery() async {
    final image = await _pickerService.pickFromGallery();
    if (image == null) return null;
    return SelectedImage(File(image.path));
  }
}
