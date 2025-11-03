import 'package:isar/isar.dart';
import 'package:ai_email_sorter/features/email/models/sorted_email.dart';

part 'email_category.g.dart';

@Collection()
class EmailCategory {
  EmailCategory({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.description,
  });

  Id id;
  
  @Index(type: IndexType.value)
  String name;
  
  String description;
  
  @Index()
  final emailIds = IsarLinks<SortedEmail>();

  factory EmailCategory.fromJson(Map<String, dynamic> json) => EmailCategory(
    id: json['id'] as int? ?? Isar.autoIncrement,
    name: json['name'] as String,
    description: json['description'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };
}