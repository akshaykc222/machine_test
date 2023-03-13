class LoginRequest {
  LoginRequest({
    required this.unitId,
    required this.userName,
    required this.password,
  });

  String unitId;
  String userName;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        unitId: json["UnitId"],
        userName: json["UserName"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "UnitId": unitId,
        "UserName": userName,
        "Password": password,
      };
}
