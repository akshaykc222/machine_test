import 'package:machine_test02/core/usecase.dart';
import 'package:machine_test02/flutter_test/data/remote/models/login_response.dart';
import 'package:machine_test02/flutter_test/data/remote/models/requests/login_request.dart';
import 'package:machine_test02/flutter_test/domain/repositories/machine_test_reposistory.dart';

class LoginUseCase extends UseCase<LoginResponseData, LoginRequest> {
  final MachineTestRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<LoginResponseData> call(LoginRequest params) {
    return repository.login(params);
  }
}
