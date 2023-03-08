import 'package:myproject/state_management/domain/exceptions/auth_exception.dart';
import 'package:myproject/state_management/domain/models/user.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';
import 'package:myproject/state_management/domain/response/login_response.dart';
import 'package:myproject/state_management/domain/request/login_request.dart';

final List<LoginResponse> listUser = [];

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 5));
    if (token == "LOC001") {
      return User('Nguy Huu Loc', 'nhloc', '123');
    } else if (token == "AD001") {
      return User('Administrator', 'admin', '123');
    } else if (listUser.isNotEmpty) {
      for (int i = 0; i < listUser.length; i++) {
        if (token == listUser[i].token) {
          return User(listUser[i].user.fullname, listUser[i].user.username,
              listUser[i].user.password);
        }
      }
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    if (login.username == 'nhloc' && login.password == '123') {
      return LoginResponse('LOC001', User('Nguy Huu Loc', 'nhloc', '123'));
    } else if (login.username == 'admin' && login.password == '123') {
      return LoginResponse('AD001', User('Administrator', 'admin', '123'));
    } else if (listUser.isNotEmpty) {
      for (int i = 0; i < listUser.length; i++) {
        if (login.username == listUser[i].user.username &&
            login.password == listUser[i].user.password) {
          return LoginResponse(
              listUser[i].token,
              User(listUser[i].user.fullname, listUser[i].user.username,
                  listUser[i].user.password));
        }
      }
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Removing token....');
    return;
  }

  @override
  Future<void> registerUser(RegisterUser register) async {
    listUser.add(LoginResponse(register.username,
        User(register.fullname, register.username, register.password)));
    return;
  }

  @override
  Future<bool> checkRegisterUser(RegisterUser register) async {
    if (register.username == 'nhloc' || register.username == 'admin') {
      return true;
    } else if (listUser.isNotEmpty) {
      for (int i = 0; i < listUser.length; i++) {
        if (register.username == listUser[i].user.username) {
          return true;
        }
      }
    }
    return false;
  }
}
