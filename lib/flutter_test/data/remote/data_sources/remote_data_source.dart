import 'package:machine_test02/core/api_provider.dart';
import 'package:machine_test02/flutter_test/data/app_remote_routes.dart';
import 'package:machine_test02/flutter_test/data/remote/models/customer_model.dart';
import 'package:machine_test02/flutter_test/data/remote/models/requests/login_request.dart';
import 'package:machine_test02/flutter_test/domain/entities/customer_entity.dart';

import '../../../../core/hive_service.dart';
import '../models/login_response.dart';

abstract class RemoteDataSource {
  Future<List<CustomerEntity>> getCustomerData();
  Future<LoginResponseData> login(LoginRequest data);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiProvider apiProvider;
  final HiveService hiveService;
  RemoteDataSourceImpl(this.apiProvider, this.hiveService);

  @override
  Future<List<CustomerEntity>> getCustomerData() async {
    final data =
        await apiProvider.post(AppRemoteRoutes.customer, {"UnitId": "1"});

    return List<CustomerEntity>.from(
        data["data"].map((e) => CustomerModel.fromJson(e)));
  }

  @override
  Future<LoginResponseData> login(LoginRequest data) async {
    final response =
        await apiProvider.post(AppRemoteRoutes.signIn, data.toJson());

    return LoginResponseData.fromJson(response);
  }
}
