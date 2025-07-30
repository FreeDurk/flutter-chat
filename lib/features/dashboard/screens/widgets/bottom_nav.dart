import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
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
      );
  }
}