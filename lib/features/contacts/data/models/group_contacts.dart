class GroupContactsModel {
  final String id;
  final String name;
  final String description;
  final bool isGroup;
  final int usersCount;
  final String createdBy;
  final String createdAt;
  final String createdAtDiffHuman;
  // final List<UserModel?> users;

  GroupContactsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isGroup,
    required this.usersCount,
    required this.createdBy,
    required this.createdAt,
    required this.createdAtDiffHuman,
    // required this.users,
  });

  factory GroupContactsModel.fromJson(Map<String, dynamic> json) {
    return GroupContactsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isGroup: json['is_group'] ?? false,
      usersCount: json['users_count'] ?? 0,
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      createdAtDiffHuman: json['created_at_diffForHuman'],
      // users: json['users'].map((user) => UserModel.fromJson(user)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_group': isGroup,
      'users_count': usersCount,
      'created_by': createdBy,
      'created_at': createdAt,
      'created_at_diffForHuman': createdAtDiffHuman,
    };
  }
}
