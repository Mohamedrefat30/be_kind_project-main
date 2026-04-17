import 'package:be_kind_project/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:be_kind_project/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._localDataSource);

  final AuthLocalDataSource _localDataSource;

  @override
  Future<bool> login() => _localDataSource.login();

  @override
  Future<bool> signup() => _localDataSource.signup();
}
