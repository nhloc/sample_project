import 'package:myproject/state_management/domain/entities/user.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';

class LoginUseCase {
  ApiRepositoryInterface repository;

  LoginUseCase(this.repository);

  Future<User> call(LoginRequest login) async {
    return await repository.login(login);
  }
}
