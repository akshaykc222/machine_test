import 'package:machine_test02/flutter_test/domain/entities/customer_entity.dart';

class CustomerData {
  CustomerData({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<CustomerModel> data;

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        status: json["status"],
        message: json["message"],
        data: List<CustomerModel>.from(
            json["data"].map((x) => CustomerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required this.id,
    required this.name,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.address4,
  }) : super(
            id: id,
            name: name,
            address1: address1,
            address2: address2,
            address3: address3,
            address4: address4);

  int id;
  String name;
  String address1;
  String address2;
  String address3;
  String address4;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["Id"],
        name: json["Name"],
        address1: json["Address1"],
        address2: json["Address2"],
        address3: json["Address3"],
        address4: json["Address4"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Address1": address1,
        "Address2": address2,
        "Address3": address3,
        "Address4": address4,
      };
}
