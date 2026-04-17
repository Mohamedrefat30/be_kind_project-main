import 'package:be_kind_project/core/usecases/usecase.dart';

class GetSplashDurationUseCase implements UseCase<Duration, NoParams> {
  const GetSplashDurationUseCase();

  @override
  Future<Duration> call(NoParams params) async {
    return const Duration(seconds: 20);
  }
}
