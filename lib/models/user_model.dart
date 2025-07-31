class UserModel {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String lastActiveAt;
  final bool isOnline;
  final bool isIdle;
  final String lastSeen;
  final String avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.lastActiveAt,
    required this.isOnline,
    required this.isIdle,
    required this.lastSeen,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contact: json['contact'] ?? '',
      lastActiveAt: json['last_active_at'] ?? '',
      isOnline: json['is_online'] ?? '',
      isIdle: json['is_idle'] ?? '',
      lastSeen: json['last_seen'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
      'email': email,
      'lastActiveAt': lastActiveAt,
      'isOnline': isOnline,
      'isIdle': isIdle,
      'lastSeen': lastSeen,
      'avatar': avatar,
    };
  }

  factory UserModel.empty() {
    return UserModel.empty();
  }

  factory UserModel.fake() {
    return UserModel(
      id: '',
      name: 'Loading...',
      email: 'Loading...',
      contact: 'Loading....',
      avatar: '...',
      lastActiveAt: '',
      isOnline: false,
      isIdle: false,
      lastSeen: '',
    );
  }
}
