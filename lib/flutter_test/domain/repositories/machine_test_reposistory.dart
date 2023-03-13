import '../../data/remote/models/login_response.dart';
import '../../data/remote/models/requests/login_request.dart';
import '../entities/customer_entity.dart';

abstract class MachineTestRepository {
  Future<List<CustomerEntity>> getCustomerData();
  Future<LoginResponseData> login(LoginRequest data);
}
