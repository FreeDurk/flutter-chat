import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupContactScreen extends ConsumerStatefulWidget {
  const GroupContactScreen({super.key});

  @override
  ConsumerState<GroupContactScreen> createState() => _GroupContactScreenState();
}

class _GroupContactScreenState extends ConsumerState<GroupContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Group Contact Screen", style: TextStyle(color: Colors.black),),),
    );
  }
}