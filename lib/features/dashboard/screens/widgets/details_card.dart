import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mchat/models/user_model.dart';

class DetailsCard extends ConsumerStatefulWidget {
  final UserModel user;
  const DetailsCard({super.key, required this.user});

  @override
  ConsumerState<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends ConsumerState<DetailsCard> {
  @override
  Widget build(BuildContext context) {
   

    return Container(
          height: 160.0,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Lighter blue
                Color(0xFF3DAABF),
                // Darker blue
                Color(0xFF157A9F),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(widget.user.avatar),),
                      SizedBox(width: 6),
                      Text(widget.user.name, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      context.push('/profile');
                    },
                    icon: Image.asset(
                      'assets/images/profile_edit.png',
                      color: Color(0xFFFFFFFF),
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(widget.user.email), Text(widget.user.contact)],
              ),
            ],
          ),
        );
  }
}
