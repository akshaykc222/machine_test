import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:machine_test02/flutter_test/data/remote/models/login_response.dart';
import 'package:machine_test02/flutter_test/data/remote/models/requests/login_request.dart';
import 'package:machine_test02/flutter_test/domain/use_cases/login_use_case.dart';
import 'package:machine_test02/flutter_test/presentation/routes/app_pages.dart';

import '../../../../core/response_classify.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final loginResponse = ResponseClassify<LoginResponseData>.error("").obs;

  validate() async {
    if (formKey.currentState?.validate() == true) {
      try {
        loginResponse.value = ResponseClassify.loading();
        loginResponse.value = ResponseClassify.completed(
            await loginUseCase.call(LoginRequest(
                unitId: "1",
                userName: userNameController.text,
                password: passwordController.text)));
        formKey.currentState?.reset();
        print(loginResponse.value.data?.toJson().toString());
        if (loginResponse.value.data?.data.isNotEmpty == true) {
          if (loginResponse.value.data?.data.first.status == 200) {
            Get.offAllNamed(AppPages.home);
          } else {
            Get.snackbar(
                "ERROR", loginResponse.value.data?.data.first.statusMsg ?? "");
            loginResponse.value = ResponseClassify.error("Invalid credentials");
          }
        } else {
          loginResponse.value = ResponseClassify.error("Invalid credentials");
        }
      } catch (e) {
        Get.snackbar("ERROR", e.toString());
        loginResponse.value = ResponseClassify.error(e.toString());
      }
    }
  }
}
