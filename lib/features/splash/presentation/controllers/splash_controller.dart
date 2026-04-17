import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/splash/domain/usecases/get_splash_duration_usecase.dart';

class SplashController {
  const SplashController(this._getSplashDurationUseCase);

  final GetSplashDurationUseCase _getSplashDurationUseCase;

  Future<Duration> getDuration() {
    return _getSplashDurationUseCase(const NoParams());
  }
}
