import 'package:mvvm/domain/mapper/task_model_mapper.dart';
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;
import 'package:mvvm/domain/model/task_model.dart' show TaskModel;
import 'package:mvvm/domain/usecase/usecase/get_tasks_usecase.dart'
    show GetTasksUseCase;
import 'package:mvvm/view/model/task.dart' show Task;
import 'package:rxdart/rxdart.dart';
import 'package:mvvm/view/base_viewmodel.dart';

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
    (await _getTasksUseCase.execute(null)).when(
      left: (FailureModel l) => _tasksInput.add(List.empty()),
      right: (List<TaskModel> r) => _tasksInput.add(r.toView()),
    );
  }
}

mixin TasksViewModelInput {
  Sink<List<Task>?> get _tasksInput;

  Future<void> getTasks();
}
mixin TasksViewModelOutput {
  Stream<List<Task>?> get tasksOutput;
}
