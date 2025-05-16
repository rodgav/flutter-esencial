import 'package:mvvm/app/utils/either.dart' show Either;
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;
import 'package:mvvm/domain/model/task_model.dart' show TaskModel;

abstract class Repository {
  Future<Either<FailureModel, List<TaskModel>>> getTasks();
}