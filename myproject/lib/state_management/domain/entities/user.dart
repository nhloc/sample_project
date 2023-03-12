class User {
  User(this.id, this.fullname, this.username, this.password);
  final int id;
  final String fullname;
  final String username;
  final String password;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        fullname = json['fullname'],
        username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'username': username,
        'password': password
      };
}

class LoginRequest {
  const LoginRequest(this.username, this.password);
  final String username;
  final String password;

  LoginRequest.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}

class LoginResponse {
  const LoginResponse(this.token, this.user);
  final String token;
  final User user;
  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        user = User.fromJson(json["user"]);

  Map<String, dynamic> toJson() => {'token': token, 'user': user.toJson()};
}

class RegisterUser {
  RegisterUser(
      this.fullname, this.username, this.password, this.confirmpassword);
  final String fullname;
  final String username;
  final String password;
  final String confirmpassword;

  RegisterUser.fromJson(Map<String, dynamic> json)
      : fullname = json['fullname'],
        username = json['username'],
        password = json['password'],
        confirmpassword = json['confirmpassword'];

  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'username': username,
        'password': password,
        'confirmpassword': confirmpassword
      };
}
