import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test02/core/response_classify.dart';
import 'package:machine_test02/flutter_test/presentation/manager/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: controller.userNameController,
                  validator: (val) {
                    if (val != null && (val?.isEmpty == true)) {
                      return "Enter User Name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            Obx (()=> Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: controller.loginResponse.value.status == Status.LOADING
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            controller.validate();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
              ),),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
