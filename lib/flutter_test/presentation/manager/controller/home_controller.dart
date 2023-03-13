import 'package:get/get.dart';
import 'package:machine_test02/core/response_classify.dart';
import 'package:machine_test02/core/usecase.dart';
import 'package:machine_test02/flutter_test/domain/entities/customer_entity.dart';
import 'package:machine_test02/flutter_test/domain/use_cases/get_customer_data_use_case.dart';

class HomeController extends GetxController {
  final GetCustomerDataUseCase useCase;

  HomeController(this.useCase);
  final homeResponse = ResponseClassify<List<CustomerEntity>>.loading().obs;

  getCustomerData() async {
    homeResponse.value = ResponseClassify.loading();
    try {
      homeResponse.value =
          ResponseClassify.completed(await useCase.call(NoParams()));
    } catch (e) {
      homeResponse.value = ResponseClassify.error(e.toString());
    }
  }

  @override
  void onInit() {
    getCustomerData();
    super.onInit();
  }
}
