class ContactModel {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String? lastActiveAt;
  final bool? isOnline;
  final bool? isIdle;
  final String lastSeen;
  final String? avatart;

  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.lastActiveAt,
    required this.isOnline,
    required this.isIdle,
    required this.lastSeen,
    required this.avatart,
  });
}
