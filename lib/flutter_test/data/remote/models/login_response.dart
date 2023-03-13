class LoginResponseData {
  LoginResponseData({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<LoginResponseModel> data;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      LoginResponseData(
        status: json["status"],
        message: json["message"],
        data: List<LoginResponseModel>.from(
            json["data"].map((x) => LoginResponseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.statusMsg,
    required this.unitId,
    required this.userName,
  });

  int status;
  String statusMsg;
  int unitId;
  String userName;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["Status"],
        statusMsg: json["StatusMsg"],
        unitId: json["UnitId"],
        userName: json["UserName"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "StatusMsg": statusMsg,
        "UnitId": unitId,
        "UserName": userName,
      };
}
