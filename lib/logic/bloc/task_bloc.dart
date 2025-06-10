import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_event.dart';
import 'task_state.dart';
import '../../data/repositories/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskState()) {

    ///Load tasks from database
    on<LoadTasks>((event, emit) {
      final tasks = taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    ///Add task to database
    on<AddTask>((event, emit) async {
      await taskRepository.addTask(event.task);
      add(LoadTasks());
    });

    ///Update task in database
    on<UpdateTask>((event, emit) async {
      await taskRepository.updateTask(event.task);
      add(LoadTasks());
    });

    ///Delete task from database
    on<DeleteTask>((event, emit) async {
      await taskRepository.deleteTask(event.task);
      add(LoadTasks());
    });

    ///Toggle task status in database
    on<ToggleTaskStatus>((event, emit) async {
      await taskRepository.toggleTaskStatus(event.task);
      final tasks = taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

  }
}
