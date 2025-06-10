import 'package:hive/hive.dart';
import '../models/task_model.dart';
import '../../utils/hive_boxes.dart';

class TaskRepository {
  Box<TaskModel> get _tasksBox => HiveBoxes.getTasksBox();

  ///fetch task from database
  List<TaskModel> getTasks() {
    return _tasksBox.keys.map((key) {
      final task = _tasksBox.get(key)!;
      final model = TaskModel(
        title: task.title,
        description: task.description,
        dueDate: task.dueDate,
        isDone: task.isDone,
      );
      model.hiveKey = key;
      return model;
    }).toList();
  }

  ///add task to database
  Future<void> addTask(TaskModel task) async {
    await _tasksBox.add(task);
  }

  ///update task in database
  Future<void> updateTask(TaskModel task) async {
    if (task.hiveKey == null) throw Exception('Missing hiveKey in task');
    await _tasksBox.put(task.hiveKey, task);
  }

  ///delete task from database
  Future<void> deleteTask(TaskModel task) async {
    if (task.hiveKey == null) throw Exception('Missing hiveKey in task');
    await _tasksBox.delete(task.hiveKey);
  }


  ///update task status in database
  Future<void> toggleTaskStatus(TaskModel task) async {
    if (task.hiveKey == null) throw Exception('Missing hiveKey in task');
    final updatedTask = TaskModel(
      title: task.title,
      description: task.description,
      dueDate: task.dueDate,
      isDone: !task.isDone,
    );
    await _tasksBox.put(task.hiveKey, updatedTask);
  }


}
