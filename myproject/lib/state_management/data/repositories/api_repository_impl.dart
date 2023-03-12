import 'package:myproject/state_management/core/exceptions/auth_exception.dart';
import 'package:myproject/state_management/core/helper/database_help.dart';
import 'package:myproject/state_management/domain/entities/user.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String username) async {
    final data = await DatabaseHelper.instance
        .selectUsername(DatabaseHelper.table_user, username);
    if (data.isNotEmpty) {
      return data.map((data) => User.fromJson(data)).first;
    }
    throw AuthException();
  }

  @override
  Future<User> login(LoginRequest login) async {
    final data =
        await DatabaseHelper.instance.login(DatabaseHelper.table_user, login);
    if (data.isNotEmpty) {
      return data.map((data) => User.fromJson(data)).first;
    }
    throw AuthException();
  }

  @override
  Future<void> registerUser(User user) async {
    await DatabaseHelper.instance
        .insertTable(DatabaseHelper.table_user, user.toJson());
    return;
  }

  @override
  Future<bool> checkExistUser(String username) async {
    final data = await DatabaseHelper.instance
        .selectUsername(DatabaseHelper.table_user, username);
    if (data.isNotEmpty) {
      return true;
    }
    return false;
  }
}
