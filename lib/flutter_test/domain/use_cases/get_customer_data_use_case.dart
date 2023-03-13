import 'package:machine_test02/core/usecase.dart';
import 'package:machine_test02/flutter_test/domain/entities/customer_entity.dart';
import 'package:machine_test02/flutter_test/domain/repositories/machine_test_reposistory.dart';

class GetCustomerDataUseCase extends UseCase<List<CustomerEntity>, NoParams> {
  final MachineTestRepository repository;

  GetCustomerDataUseCase(this.repository);

  @override
  Future<List<CustomerEntity>> call(NoParams params) {
    return repository.getCustomerData();
  }
}
