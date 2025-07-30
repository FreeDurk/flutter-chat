class UserModel {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String avatar;

  UserModel({required this.id, required this.name ,required this.email, required this.contact ,required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contact: json['contact'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
      'email': email,
      'avatar': avatar
    };
  }

  factory UserModel.empty() {
    return UserModel.empty();
  }

  factory UserModel.fake() {
    return UserModel(id: '', name: 'Loading...', email: 'Loading...', contact: 'Loading....', avatar: '...');
  }
}
