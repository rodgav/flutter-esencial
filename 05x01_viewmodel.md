# [Flutter esencial](00x00_flutter_esencial.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## ViewModel

```yaml
dependencies:
  ...
  rxdart: ^0.27.7
```

presentation/base_viewmodel.dart
```dart
abstract class BaseViewModel {
  void start() {}

  void finish() {}
}
```

presetantion/tasks/tasks_viewmodel.dart
```dart
import 'package:clean_mvvm/domain/mapper/task_model_mapper.dart';
import 'package:clean_mvvm/domain/model/failure_model.dart';
import 'package:clean_mvvm/domain/model/task_model.dart';
import 'package:clean_mvvm/domain/usecase/get_tasks_usecase.dart';
import 'package:clean_mvvm/presentation/base_viewmodel.dart';
import 'package:clean_mvvm/presentation/model/task.dart';
import 'package:rxdart/rxdart.dart';

class TasksViewModel extends BaseViewModel
    with TasksViewModelInput, TasksViewModelOutput {
  final GetTasksUseCase _getTasksUseCase;

  TasksViewModel(this._getTasksUseCase);

  BehaviorSubject<List<Task>?> _tasksStrCtrl = BehaviorSubject.seeded(null);

  @override
  void start() {
    if (_tasksStrCtrl.isClosed) {
      _tasksStrCtrl = BehaviorSubject.seeded(null);
    }
    getTasks();
    super.start();
  }

  @override
  void finish() {
    _tasksStrCtrl.close();
    super.finish();
  }

  @override
  Sink<List<Task>?> get _tasksInput => _tasksStrCtrl.sink;

  @override
  Stream<List<Task>?> get tasksOutput =>
      _tasksStrCtrl.stream.map((tasks) => tasks);

  @override
  Future<void> getTasks() async {
    (await _getTasksUseCase.execute(null)).fold(
        (FailureModel l) => _tasksInput.add(List.empty()),
        (List<TaskModel> r) => _tasksInput.add(r.toPresentation()));
  }
}

mixin TasksViewModelInput {
  Sink<List<Task>?> get _tasksInput;

  Future<void> getTasks();
}
mixin TasksViewModelOutput {
  Stream<List<Task>?> get tasksOutput;
}
```