import 'package:flutter/material.dart';
import 'package:mchat/models/user_model.dart';

class ContactsTile extends StatelessWidget {
  final UserModel user;
  const ContactsTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ), // Bottom border
        ),
      ),
      child: ListTile(
        onTap: () => print(user.name),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 24, backgroundColor: Colors.grey,
               backgroundImage: NetworkImage(user.avatar),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: user.isOnline
                      ? Colors.green
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          user.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          user.lastSeen,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
