import 'package:myproject/state_management/domain/models/user.dart';
import 'package:myproject/state_management/domain/request/login_request.dart';
import 'package:myproject/state_management/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<void> registerUser(RegisterUser register);
  Future<bool> checkRegisterUser(RegisterUser register);
}
