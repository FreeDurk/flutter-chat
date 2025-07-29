import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/token_notifier.dart';

class AppbarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          color: Color(0xFFACACAC),
          height: 0.7,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset('assets/images/mchat.png'),
      ),
      centerTitle: true,
      title: const Text(
        'Dashboard',
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE4E4E4),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
              onPressed: () async {
                await ref.read(tokenNotifierProvider.notifier).clearToken();
              },
              icon: Image.asset(
                'assets/images/notification.png',
                height: 16,
                width: 16,
                color: Colors.black,
              ),
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
