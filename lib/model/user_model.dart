class UserModel {
  UserModel({
    this.token,
  });

  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
      );
}
