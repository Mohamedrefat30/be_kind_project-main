import 'package:be_kind_project/core/usecases/usecase.dart';
import 'package:be_kind_project/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase implements UseCase<bool, NoParams> {
  const SignupUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<bool> call(NoParams params) => _repository.signup();
}
