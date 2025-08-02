import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/dio_provider.dart';
import 'package:mchat/features/contacts/data/models/group_contacts.dart';
import 'package:mchat/models/user_model.dart';

class ContactsService {
  final Dio dio;

  ContactsService(this.dio);

  Future<List<UserModel>> contacts() async {
    try {
      final response = await dio.get('/contacts');
      if (response.statusCode == 200) {
        final List<dynamic> json = response.data['data'];
        final List<UserModel> user = json
            .map((user) => UserModel.fromJson(user))
            .toList();
        return user;
      }
    } catch (e) {
      print(e.toString());
    }

    print('=== NO CONTACTS ===');
    return [];
  }

  Future<List<GroupContactsModel>> groupContacts() async {
    try {
      final response = await dio.get('/conversations/groups');
      if (response.statusCode == 200) {
        final List<dynamic> json = response.data['data'];
        final List<GroupContactsModel> groupContacts = json
            .map((contact) => GroupContactsModel.fromJson(contact))
            .toList();

        return groupContacts;
      }
    } catch (e) {
      print(e.toString());
    }

    print('=== NO GROUP CONTACTS ===');
    return [];
  }
}

final contactServiceProvider = Provider(
  (ref) => ContactsService(ref.read(dioProvider)),
);
