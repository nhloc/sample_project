import 'package:myproject/state_management/domain/models/user.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';

class RegisterUseCase {
  final ApiRepositoryInterface repository;
  RegisterUseCase(this.repository);

  Future<void> call(RegisterUser registerUser) async {
    await repository.registerUser(registerUser);
  }
}

class CheckExistUseCase {
  final ApiRepositoryInterface repository;
  CheckExistUseCase(this.repository);

  Future<bool> call(String username) async {
    return await repository.checkExistUser(username);
  }
}
