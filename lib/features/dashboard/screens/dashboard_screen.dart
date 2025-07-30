import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/dashboard/data/models/contacts_count_model.dart';
import 'package:mchat/features/dashboard/data/repositories/dasboard_repository.dart';
import 'package:mchat/features/dashboard/screens/widgets/appbar.dart';
import 'package:mchat/features/dashboard/screens/widgets/bottom_nav.dart';
import 'package:mchat/features/dashboard/screens/widgets/contacts_card.dart';
import 'package:mchat/features/dashboard/screens/widgets/details_card.dart';
import 'package:mchat/models/user_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool _isRefreshing = false;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _refresh() async {
    setState(() {
      _isRefreshing = true;
    });
    
    ref.invalidate(dashboardProvider);
    
    await ref.read(dashboardProvider.future);
    
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userRef = ref.watch(dashboardProvider);
    
    return Scaffold(
      appBar: AppbarWidget(),
      bottomNavigationBar: CustomBottomNav(),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                if (userRef.isLoading || _isRefreshing) ...[
                  Skeletonizer(
                    enabled: true,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        DetailsCard(
                          user: UserModel.fake(),
                        ),
                        SizedBox(height: 20),
                        ContactsCard(
                          'Loading....',
                          'Loading...',
                          'Loading...',
                        ),
                        SizedBox(height: 20),
                        ContactsCard('Loading...', 'Loading...', 'Loading...'),
                      ],
                    ),
                  ),
                ] else ...[
                  ...userRef.when(
                    data: (data) {
                      final UserModel user = data.user;
                      final ContactsCountModel contacts = data.contactsCountModel;
            
                      return [
                        SizedBox(height: 20),
                        DetailsCard(user: user),
                        SizedBox(height: 20),
                        ContactsCard(
                          contacts.userCount.toString(),
                          'Contacts',
                          'Total Number of Contacts',
                        ),
                        SizedBox(height: 20),
                        ContactsCard(
                          contacts.groupCount.toString(),
                          'Groups',
                          'Total Number of Groups',
                        ),
                      ];
                    },
                    error: (error, s) {
                      return [Text('ERROR', style: TextStyle(color: Colors.black))];
                    },
                    loading: () {
                      return [];
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}