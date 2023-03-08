class User {
  User(this.fullname, this.username, this.password);
  final String fullname;
  final String username;
  final String password;
}

class RegisterUser {
  RegisterUser(
      this.fullname, this.username, this.password, this.confirmpassword);
  final String fullname;
  final String username;
  final String password;
  final String confirmpassword;
}
