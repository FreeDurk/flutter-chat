import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/theme_provider.dart';
import 'package:mchat/features/dashboard/providers/user_provider.dart';
import 'package:mchat/features/profile/screens/widgets/heading.dart';
import 'package:mchat/features/profile/screens/widgets/inputs.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

final TextEditingController name = TextEditingController();

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userProviderRef = ref.watch(userStateProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ), // Padding around the whole content
      child: Column(
        children: [
          heading(ref),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: Color(0xFFE4E4E4)),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    ...userProviderRef.when(
                      data: (data) {
                        return [
                          profileInputs(label: 'Name', hint: data.name),
                          profileInputs(label: 'Email', hint: data.email),
                          profileInputs(label: 'Contact #', hint: data.contact),
                        ];
                      },
                      loading: () => [
                        Skeletonizer(
                          enabled: true,
                          child: Column(
                            children: [
                              profileInputs(label: 'Name', hint: "Loading..."),
                              profileInputs(label: 'Email', hint: "Loading..."),
                              profileInputs(
                                label: 'Contact #',
                                hint: "Loading...",
                              ),
                            ],
                          ),
                        ),
                      ],
                      error: (err, stack) => [Text('Error: $err')],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => print(userProviderRef.value?.email),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnColor,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Logout', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
