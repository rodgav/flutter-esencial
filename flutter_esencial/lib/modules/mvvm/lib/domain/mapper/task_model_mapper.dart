import 'package:mvvm/domain/model/task_model.dart' show TaskModel;
import 'package:mvvm/view/model/task.dart';

extension TasksResponseExtension on List<TaskModel>? {
  List<Task> toView() =>
      this?.map((e) => e.toView()).toList() ?? List.empty();
}

extension TaskResponseExtension on TaskModel? {
  Task toView() {
    return Task(id: this?.id ?? '', name: this?.name ?? '');
  }
}
