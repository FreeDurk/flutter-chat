import 'package:mchat/features/dashboard/data/models/contacts_count_model.dart';
import 'package:mchat/models/user_model.dart';

class DashboardModel {
  final UserModel user;
  final ContactsCountModel contactsCountModel;

  DashboardModel({required this.user, required this.contactsCountModel});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      user: UserModel.fromJson(json),
      contactsCountModel: ContactsCountModel.fromJson(json),
    );
  }

  factory DashboardModel.empty() {
    return DashboardModel(
      user: UserModel.empty(),
      contactsCountModel: ContactsCountModel.empty(),
    );
  }
}
