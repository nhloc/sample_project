import 'package:myproject/state_management/domain/models/user.dart';

class LoginResponse {
  const LoginResponse(this.token, this.user);
  final String token;
  final User user;
}
