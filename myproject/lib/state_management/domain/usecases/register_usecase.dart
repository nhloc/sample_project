import 'package:myproject/state_management/domain/entities/user.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';

class RegisterUseCase {
  final ApiRepositoryInterface repository;
  RegisterUseCase(this.repository);

  Future<void> call(User user) async {
    await repository.registerUser(user);
  }
}

class CheckExistUseCase {
  final ApiRepositoryInterface repository;
  CheckExistUseCase(this.repository);

  Future<bool> call(String username) async {
    return await repository.checkExistUser(username);
  }
}
