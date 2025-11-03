import 'package:isar/isar.dart';
import 'package:ai_email_sorter/features/categories/models/email_category.dart';

part 'sorted_email.g.dart';

@Collection()
class SortedEmail {
  SortedEmail({
    this.id = Isar.autoIncrement,
    required this.emailId,
    required this.subject,
    required this.sender,
    required this.receivedAt,
    required this.summary,
    this.isRead = false,
    this.unsubscribeLink,
  });

  Id id;
  
  @Index(type: IndexType.value)
  String emailId;
  
  String subject;
  String sender;
  DateTime receivedAt;
  String summary;
  bool isRead;
  String? unsubscribeLink;

  final category = IsarLink<EmailCategory>();

  factory SortedEmail.fromJson(Map<String, dynamic> json) => SortedEmail(
    id: json['id'] as int? ?? Isar.autoIncrement,
    emailId: json['emailId'] as String,
    subject: json['subject'] as String,
    sender: json['sender'] as String,
    receivedAt: DateTime.parse(json['receivedAt'] as String),
    summary: json['summary'] as String,
    isRead: json['isRead'] as bool? ?? false,
    unsubscribeLink: json['unsubscribeLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'emailId': emailId,
    'subject': subject,
    'sender': sender,
    'receivedAt': receivedAt.toIso8601String(),
    'summary': summary,
    'isRead': isRead,
    'unsubscribeLink': unsubscribeLink,
  };
}