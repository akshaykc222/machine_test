class CustomerEntity {
  CustomerEntity({
    required this.id,
    required this.name,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.address4,
  });

  int id;
  String name;
  String address1;
  String address2;
  String address3;
  String address4;

  factory CustomerEntity.fromJson(Map<String, dynamic> json) => CustomerEntity(
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
