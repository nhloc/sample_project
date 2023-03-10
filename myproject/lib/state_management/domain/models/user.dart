class User {
  User(this.fullname, this.username, this.password);
  final String fullname;
  final String username;
  final String password;
}

class LoginRequest {
  const LoginRequest(this.username, this.password);
  final String username;
  final String password;
}

class LoginResponse {
  const LoginResponse(this.token, this.user);
  final String token;
  final User user;
}


class RegisterUser {
  RegisterUser(
      this.fullname, this.username, this.password, this.confirmpassword);
  final String fullname;
  final String username;
  final String password;
  final String confirmpassword;
}
