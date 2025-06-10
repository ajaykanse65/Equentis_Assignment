
import '../../data/models/task_model.dart';

class TaskState  {
  final List<TaskModel> tasks;

  TaskState({this.tasks = const []});

  TaskState copyWith({List<TaskModel>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }

  List<Object?> get props => [tasks];
}
