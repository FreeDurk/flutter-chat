
class ContactsCountModel {
  final String groupCount;
  final String userCount;

  ContactsCountModel({required this.groupCount, required this.userCount});

  factory ContactsCountModel.fromJson(Map<String, dynamic> json) {
    return ContactsCountModel(
      groupCount: json['group_count'].toString(),
      userCount: json['user_count'].toString(),
    );
  }

  factory ContactsCountModel.empty() {
    return ContactsCountModel.empty();
  }
}
