import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/auth/screens/widgets/search_field.dart';
import 'package:mchat/features/contacts/data/repositories/contacts_repository.dart';
import 'package:mchat/features/contacts/screens/widgets/contacts_tile.dart';
import 'package:mchat/models/user_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

final TextEditingController searchFieldController = TextEditingController();

class _ContactScreenState extends ConsumerState<ContactScreen> {

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onRefresh() async {
    ref.invalidate(contactListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final contactsRef = ref.watch(contactListProvider);
    final contactCountRef = ref.watch(contactCountState);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              title: '',
              placeholder: 'Search Name',
              onChanged: null,
              controller: searchFieldController,
            ),
            SizedBox(height: 10),
            Text('Online - $contactCountRef', style: TextStyle(color: Color(0xFFACACAC))),
            SizedBox(height: 10),
            contactsRef.when(
              data: (contacts) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final user = contacts[index];
                      return ContactsTile(user: user);
                    },
                  ),
                );
              },
              error: (e, st) => Text('ERROR'),
              loading: () {
                return Expanded(
                  child: Skeletonizer(
                    enableSwitchAnimation: true,
                    enabled: true,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ContactsTile(user: UserModel.fake());
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
