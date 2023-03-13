import 'package:machine_test02/core/connection_info.dart';
import 'package:machine_test02/flutter_test/data/remote/data_sources/remote_data_source.dart';
import 'package:machine_test02/flutter_test/data/remote/models/login_response.dart';
import 'package:machine_test02/flutter_test/data/remote/models/requests/login_request.dart';
import 'package:machine_test02/flutter_test/domain/repositories/machine_test_reposistory.dart';

import '../../domain/entities/customer_entity.dart';

class MachineTestRepositoryImpl extends MachineTestRepository {
  final RemoteDataSource dataSource;
  final ConnectionInfo connectionInfo;

  MachineTestRepositoryImpl(
    this.dataSource,
    this.connectionInfo,
  );

  @override
  Future<List<CustomerEntity>> getCustomerData() {
    return dataSource.getCustomerData();
  }

  @override
  Future<LoginResponseData> login(LoginRequest data) {
    return dataSource.login(data);
  }
}
