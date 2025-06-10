import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task_model.dart';
import '../../logic/bloc/task_bloc.dart';
import '../../logic/bloc/task_event.dart';
import '../../logic/bloc/task_state.dart';
import '../../logic/cubit/theme_cubit.dart';
import '../widgets/item_list.dart';
import 'add_edit_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFilter = 'All'; // All / Done / Pending

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              bool isDark = themeMode == ThemeMode.dark;
              return IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      RotationTransition(turns: animation, child: child),
                  child: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    key: ValueKey(isDark),
                    color: isDark ? Colors.amberAccent : Colors.blueGrey,
                  ),
                ),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme(!isDark);
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: selectedFilter == 'All',
                  onSelected: (selected) {
                    setState(() {
                      selectedFilter = 'All';
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Done'),
                  selected: selectedFilter == 'Done',
                  onSelected: (selected) {
                    setState(() {
                      selectedFilter = 'Done';
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Pending'),
                  selected: selectedFilter == 'Pending',
                  onSelected: (selected) {
                    setState(() {
                      selectedFilter = 'Pending';
                    });
                  },
                ),
              ],
            ),
          ),
          // Task List
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                List<TaskModel> filteredTasks = state.tasks;

                if (selectedFilter == 'Done') {
                  filteredTasks = state.tasks.where((task) => task.isDone).toList();
                } else if (selectedFilter == 'Pending') {
                  filteredTasks = state.tasks.where((task) => !task.isDone).toList();
                }

                if (filteredTasks.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.task_alt, size: 80, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No tasks.',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: filteredTasks.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 4),
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];
                    return TaskItem(task: task);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditTaskPage()),
          ).then((onValue) {
            context.read<TaskBloc>().add(LoadTasks());
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
        backgroundColor: Colors.teal.shade300,
      ),
    );
  }
}

