import 'package:mvvm/data/response/task_response.dart' show TaskResponse;
import 'package:mvvm/domain/model/task_model.dart' show TaskModel;

extension TasksResponseExtension on List<TaskResponse>? {
  List<TaskModel> toDomain() =>
      this?.map((e) => e.toDomain()).toList() ?? List.empty();
}

extension TaskResponseExtension on TaskResponse? {
  TaskModel toDomain() {
    return TaskModel(id: this?.id ?? '', name: this?.name ?? '');
  }
}
