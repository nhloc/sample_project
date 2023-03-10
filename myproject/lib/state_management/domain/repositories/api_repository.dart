import 'package:myproject/state_management/domain/models/user.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<void> registerUser(RegisterUser register);
  Future<bool> checkExistUser(String username);
}
