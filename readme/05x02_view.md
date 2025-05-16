

# [Flutter esencial](00x00_flutter_esencial.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## View


view/task/tasks_view.dart
```dart
import 'package:flutter/material.dart';
import 'package:mvvm/app/dependency_injection.dart' show getIt;
import 'package:mvvm/view/model/task.dart' show Task;
import 'package:mvvm/view/tasks/tasks_viewmodel.dart' show TasksViewModel;

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final _tasksViewModel = getIt<TasksViewModel>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tasksViewModel.start();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tasksViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Task>?>(
        stream: _tasksViewModel.tasksOutput,
        builder: (_, snapshot) {
          final tasks = snapshot.data;
          if (tasks == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return tasks.isNotEmpty
              ? ListView.builder(
            itemBuilder: (_, index) {
              final task = tasks[index];
              return ListTile(title: Text(task.name));
            },
            itemCount: tasks.length,
          )
              : const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
```