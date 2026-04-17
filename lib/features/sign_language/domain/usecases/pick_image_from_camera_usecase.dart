import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/sign_language/domain/entities/selected_image.dart';
import 'package:be_kind_project/features/sign_language/domain/repositories/sign_language_repository.dart';

class PickImageFromCameraUseCase implements UseCase<SelectedImage?, NoParams> {
  const PickImageFromCameraUseCase(this._repository);

  final SignLanguageRepository _repository;

  @override
  Future<SelectedImage?> call(NoParams params) {
    return _repository.pickFromCamera();
  }
}
