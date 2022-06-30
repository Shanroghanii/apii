import 'package:apii/services/auth_api.dart';
import 'package:apii/services/post_api.dart';
import 'package:get/get.dart';


class ServicesBinder extends Bindings {
  @override
  void dependencies() {
   Get.put(AuthApi());
   Get.lazyPut(() => PostApi());
  }
}
