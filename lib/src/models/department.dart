import 'package:isar/isar.dart';

part 'department.g.dart';

@collection
class Department {
  Id? id;
  final String displayName;

  Department({required this.id, required this.displayName});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json['departmentId'] as int,
        displayName: json['displayName'],
      );
}
