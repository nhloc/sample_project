import 'package:get/get.dart';
import 'package:myproject/state_management/data/repositories/api_repository_impl.dart';
import 'package:myproject/state_management/data/local/local_repository_impl.dart';
import 'package:myproject/state_management/domain/repositories/api_repository.dart';
import 'package:myproject/state_management/domain/repositories/local_storage_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
