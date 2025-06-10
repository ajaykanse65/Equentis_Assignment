import '../../data/models/task_model.dart';

abstract class TaskEvent {
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}


class AddTask extends TaskEvent {
  final TaskModel task;
  AddTask(this.task);
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  UpdateTask(this.task);
}

class DeleteTask extends TaskEvent {
  final TaskModel task;
  DeleteTask(this.task);
}

class ToggleTaskStatus extends TaskEvent {
  final TaskModel task;
  ToggleTaskStatus(this.task);
}
