import 'package:hive/hive.dart';
import '../data/models/task_model.dart';

class HiveBoxes {
  static Box<TaskModel> getTasksBox() => Hive.box<TaskModel>('tasks');
}


