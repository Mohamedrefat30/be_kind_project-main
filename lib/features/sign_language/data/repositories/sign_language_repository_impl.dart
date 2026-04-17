import 'package:be_kind_project/features/sign_language/data/datasources/sign_language_local_data_source.dart';
import 'package:be_kind_project/features/sign_language/domain/entities/selected_image.dart';
import 'package:be_kind_project/features/sign_language/domain/repositories/sign_language_repository.dart';

class SignLanguageRepositoryImpl implements SignLanguageRepository {
  const SignLanguageRepositoryImpl(this._dataSource);

  final SignLanguageLocalDataSource _dataSource;

  @override
  Future<SelectedImage?> pickFromCamera() {
    return _dataSource.pickFromCamera();
  }

  @override
  Future<SelectedImage?> pickFromGallery() {
    return _dataSource.pickFromGallery();
  }
}
