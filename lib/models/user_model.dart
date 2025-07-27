class UserModel {
  final String id;
  final String email;
  final String avatar;

  UserModel({required this.id, required this.email, required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  Map<String,dynamic> toJson() {
    return {
     id: id,
      email: email,
      avatar: avatar
    };
  }
}
