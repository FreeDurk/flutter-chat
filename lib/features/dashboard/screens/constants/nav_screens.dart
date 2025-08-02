import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/contacts/screens/group_screen.dart';
import 'package:mchat/features/dashboard/screens/dashboard_screen.dart';
import 'package:mchat/features/contacts/screens/contact_screen.dart';
import 'package:mchat/features/profile/screens/profile_screen.dart';

final screenStateProvider = StateProvider<int>((ref) => 0);
final screenAppBarTitle = StateProvider<String>((ref) => 'Dashboard');

final List<NavScreens> navScreens = [
  NavScreens(title: 'Dashboard', screen: DashboardScreen()),
  NavScreens(title: 'Contacts', screen: ContactScreen()),
  NavScreens(title: 'Group Chat', screen: GroupContactScreen()),
  NavScreens(title: 'Edit Profile', screen: ProfileScreen()),
];

class NavScreens {
  final String title;
  final Widget screen;

  const NavScreens({required this.title, required this.screen});
}
