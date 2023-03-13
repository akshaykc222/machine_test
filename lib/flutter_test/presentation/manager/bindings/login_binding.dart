import 'package:get/get.dart';
import 'package:machine_test02/flutter_test/presentation/manager/controller/login_controller.dart';

import '../../../injecter.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(sl()));
  }
}
