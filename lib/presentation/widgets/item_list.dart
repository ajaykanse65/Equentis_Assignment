import 'package:equentis_assignment/utils/string_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task_model.dart';
import '../../logic/bloc/task_bloc.dart';
import '../../logic/bloc/task_event.dart';
import '../pages/add_edit_task_page.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('${task.key}_${task.isDone}'),
      background: Container(color: Colors.redAccent),
      onDismissed: (_) {
        context.read<TaskBloc>().add(DeleteTask(task));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: task.isDone ? TextDecoration.lineThrough : null,

            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              context.read<TaskBloc>().add(ToggleTaskStatus(task));
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: task.isDone ? Colors.green[400] : Colors.orange[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                task.isDone ? 'Done' : 'Pending',
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddEditTaskPage(task: task)),
            );
            context.read<TaskBloc>().add(LoadTasks());
          },
        ),
      ),
    );
  }
}


