import 'package:myproject/state_management/domain/models/user.dart';
import 'package:myproject/state_management/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_fullname = 'FULLNAME';
const _pref_username = 'USERNAME';
const _pref_password = 'PASSWORD';
const _pref_token = 'TOKEN';
final List<User> listUser = [];

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token) ?? "";
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final fullname = sharedPreferences.getString(_pref_fullname) ?? "";
    final username = sharedPreferences.getString(_pref_username) ?? "";
    final password = sharedPreferences.getString(_pref_password) ?? "";
    return User(fullname, username, password);
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_fullname, user.fullname);
    sharedPreferences.setString(_pref_username, user.username);
    sharedPreferences.setString(_pref_password, user.password);
    return user;
  }
}
