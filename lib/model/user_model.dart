class ListUserModel {
  ListUserModel({
    required this.list,
    required this.total,
  });

  List<UserModel> list;
  int total;

  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
    list: List<UserModel>.from(json["list"].map((x) => UserModel.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "total": total,
  };
}

class UserModel {
  String username;
  String password;

  UserModel({
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"] ?? "",
    password: json["password"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}
