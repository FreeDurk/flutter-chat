import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/dashboard/screens/widgets/appbar.dart';
import 'package:mchat/features/dashboard/screens/widgets/contacts_card.dart';
import 'package:mchat/features/dashboard/screens/widgets/details_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20),
            DetailsCard(),
            SizedBox(height: 20),
            ContactsCard('24', 'Contacts', 'Total Number of Contacts'),
            SizedBox(height: 20),
            ContactsCard('3', 'Groups', 'Total Number of Groups'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) => print(idx),
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/home.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
           BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/contacts.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/groups.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/settings.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/chats.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
