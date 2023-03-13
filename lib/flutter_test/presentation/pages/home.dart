import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test02/core/response_classify.dart';
import 'package:machine_test02/flutter_test/presentation/manager/controller/home_controller.dart';

import '../../domain/entities/customer_entity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Obx(() => controller.homeResponse.value.status == Status.LOADING
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.homeResponse.value.data?.length,
              itemBuilder: (context, index) => CustomerTile(
                  entity: controller.homeResponse.value.data![index]))),
    );
  }
}

class CustomerTile extends StatelessWidget {
  final CustomerEntity entity;
  const CustomerTile({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RowCard(title: "Name", text: entity.name),
          const SizedBox(
            height: 5,
          ),
          RowCard(title: "Name", text: entity.name),
          const SizedBox(
            height: 5,
          ),
          RowCard(title: "Address1", text: entity.address1),
          const SizedBox(
            height: 5,
          ),
          RowCard(title: "Address2", text: entity.address2),
          const SizedBox(
            height: 5,
          ),
          RowCard(title: "Address3", text: entity.address3),
          const SizedBox(
            height: 5,
          ),
          RowCard(title: "Address4", text: entity.address4),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  final String title;
  final String text;
  const RowCard({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Expanded(flex: 3, child: Text(text))
      ],
    );
  }
}
