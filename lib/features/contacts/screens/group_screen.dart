import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/theme_provider.dart';
import 'package:mchat/features/auth/screens/widgets/search_field.dart';
import 'package:mchat/features/contacts/data/repositories/contacts_repository.dart';
import 'package:mchat/features/contacts/screens/widgets/contacts_tile.dart';
import 'package:mchat/models/user_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GroupContactScreen extends ConsumerStatefulWidget {
  const GroupContactScreen({super.key});

  @override
  ConsumerState<GroupContactScreen> createState() => _GroupContactScreenState();
}

final TextEditingController searchFieldController = TextEditingController();

class _GroupContactScreenState extends ConsumerState<GroupContactScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onRefresh() async {
    ref.invalidate(groupContactListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final contactsRef = ref.watch(groupContactListProvider);
    final groupContactCountRef = ref.watch(groupContactsCountState);

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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Groups - $groupContactCountRef',
                    style: TextStyle(color: Color(0xFFACACAC)),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => print('Create new group...'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Create New Group',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            contactsRef.when(
              data: (contacts) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final user = contacts[index];
                      return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Image.asset(
                            'assets/images/groups.png',
                            height: 18,
                            width: 18,
                          ),
                        ),
                        subtitleTextStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFACACAC),
                        ),
                        subtitle: Text('${user.usersCount.toString()} Members'),
                        title: Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      );
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
