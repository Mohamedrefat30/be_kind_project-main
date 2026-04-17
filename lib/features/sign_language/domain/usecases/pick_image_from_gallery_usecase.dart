import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/sign_language/domain/entities/selected_image.dart';
import 'package:be_kind_project/features/sign_language/domain/repositories/sign_language_repository.dart';

class PickImageFromGalleryUseCase implements UseCase<SelectedImage?, NoParams> {
  const PickImageFromGalleryUseCase(this._repository);

  final SignLanguageRepository _repository;

  @override
  Future<SelectedImage?> call(NoParams params) {
    return _repository.pickFromGallery();
  }
}
