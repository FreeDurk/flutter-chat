import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsCard extends ConsumerStatefulWidget {
  final String totalContacts;
  final String title;
  final String subTitle;

  const ContactsCard(
    this.totalContacts,
    this.title,
    this.subTitle, {
    super.key,
  });

  @override
  ConsumerState<ContactsCard> createState() => _ContactsCardState();
}

class _ContactsCardState extends ConsumerState<ContactsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    widget.totalContacts,
                    style: TextStyle(fontSize: 36, color: Color(0xFF00A1DE)),
                  ),
                  SizedBox(width: 6),
                ],
              ),
              IconButton(
                onPressed: () => print('contacts'),
                icon: Image.asset(
                  'assets/images/groups.png',
                  color: Color(0xFF00A1DE),
                  width: 24.0,
                  height: 24.0,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
              Text(widget.subTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFACACAC),
                  fontSize: 12
                ),),
            ],
          ),
        ],
      ),
    );
  }
}
