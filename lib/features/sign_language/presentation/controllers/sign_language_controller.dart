import 'dart:io';

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
}
