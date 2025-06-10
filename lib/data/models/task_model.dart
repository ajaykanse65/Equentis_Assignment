import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime dueDate;

  @HiveField(3)
  bool isDone;

  int? hiveKey;

  TaskModel({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isDone = false,
  });
}


