import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/dashboard/screens/constants/nav_screens.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return BottomNavigationBar(
          selectedItemColor: Colors.blue, // Active color
          unselectedItemColor: Colors.grey, // Inactive color
          currentIndex: ref.watch(screenStateProvider),
          onTap: (idx) => ref.read(screenStateProvider.notifier).state = idx,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/home.png',
                width: 24.0,
                height: 24.0,
                color: ref.watch(screenStateProvider) == 0 ? Color(0xFF00A6E5) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/contacts.png',
                width: 24.0,
                height: 24.0,
                color: ref.watch(screenStateProvider) == 1 ? Color(0xFF00A6E5) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/groups.png',
                width: 24.0,
                height: 24.0,
                color: ref.watch(screenStateProvider) == 2 ? Color(0xFF00A6E5) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/settings.png',
                width: 24.0,
                height: 24.0,
                color: ref.watch(screenStateProvider) == 3 ? Color(0xFF00A6E5) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/images/chats.png',
                width: 24.0,
                height: 24.0,
                color: ref.watch(screenStateProvider) == 4 ? Color(0xFF00A6E5) : Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
