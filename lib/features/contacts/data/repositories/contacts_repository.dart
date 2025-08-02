import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/contacts/data/models/group_contacts.dart';
import 'package:mchat/features/contacts/data/services/contacts_service.dart';
import 'package:mchat/models/user_model.dart';

final contactCountState = StateProvider<int>((ref) => 0);
final groupContactsCountState = StateProvider<int>((ref) => 0);

final contactListProvider = FutureProvider<List<UserModel>>((ref) async {
  final contacts = await ref.read(contactServiceProvider).contacts();
  ref.read(contactCountState.notifier).update((state) => contacts.length);
  return contacts;
});

final groupContactListProvider = FutureProvider<List<GroupContactsModel>>((
  ref,
) async {
  final groupContacts = await ref.read(contactServiceProvider).groupContacts();
  ref
      .read(groupContactsCountState.notifier)
      .update((state) => groupContacts.length);
  return groupContacts;
});
