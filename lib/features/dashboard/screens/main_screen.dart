import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/dashboard/screens/constants/nav_screens.dart';
import 'package:mchat/features/dashboard/screens/widgets/appbar.dart';
import 'package:mchat/features/dashboard/screens/widgets/bottom_nav.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final screenState = ref.watch(screenStateProvider);
    return Scaffold(
      appBar: AppbarWidget(),
      bottomNavigationBar: CustomBottomNav(),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20),
        child: navScreens[screenState].screen,
      ),
    );
  }
}