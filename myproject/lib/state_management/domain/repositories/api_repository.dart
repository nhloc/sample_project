import 'package:myproject/state_management/domain/entities/user.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String username);
  Future<User> login(LoginRequest login);
  Future<void> registerUser(User user);
  Future<bool> checkExistUser(String username);
}
