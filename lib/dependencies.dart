import 'package:be_kind_project/core/services/image_picker_service.dart';
import 'package:be_kind_project/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:be_kind_project/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:be_kind_project/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:be_kind_project/features/onboarding/domain/usecases/get_onboarding_steps_usecase.dart';
import 'package:be_kind_project/features/sign_language/data/datasources/sign_language_local_data_source.dart';
import 'package:be_kind_project/features/sign_language/data/repositories/sign_language_repository_impl.dart';
import 'package:be_kind_project/features/sign_language/domain/repositories/sign_language_repository.dart';
import 'package:be_kind_project/features/sign_language/domain/usecases/pick_image_from_camera_usecase.dart';
import 'package:be_kind_project/features/sign_language/domain/usecases/pick_image_from_gallery_usecase.dart';
import 'package:image_picker/image_picker.dart';

class Dependencies {
  Dependencies._();

  static final ImagePickerService _pickerService = ImagePickerServiceImpl(
    ImagePicker(),
  );

  static final OnboardingRepository onboardingRepository =
      OnboardingRepositoryImpl(OnboardingLocalDataSource());

  static final GetOnboardingStepsUseCase getOnboardingStepsUseCase =
      GetOnboardingStepsUseCase(onboardingRepository);

  static final SignLanguageRepository signLanguageRepository =
      SignLanguageRepositoryImpl(SignLanguageLocalDataSource(_pickerService));

  static final PickImageFromCameraUseCase pickImageFromCameraUseCase =
      PickImageFromCameraUseCase(signLanguageRepository);

  static final PickImageFromGalleryUseCase pickImageFromGalleryUseCase =
      PickImageFromGalleryUseCase(signLanguageRepository);
}
