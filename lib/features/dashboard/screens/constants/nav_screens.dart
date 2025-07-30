import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/contact/screens/group_screen.dart';
import 'package:mchat/features/dashboard/screens/dashboard_screen.dart';
import 'package:mchat/features/contact/screens/contact_screen.dart';

final screenStateProvider = StateProvider((ref) => 0);

final List<Widget> navScreens = [
  DashboardScreen(),
  ContactScreen(),
  GroupContactScreen()
];