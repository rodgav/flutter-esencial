import 'package:mvvm/app/utils/either.dart' show Either;
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;
import 'package:mvvm/domain/model/task_model.dart' show TaskModel;
import 'package:mvvm/domain/repository/repository.dart' show Repository;
import 'package:mvvm/domain/usecase/base_usecase.dart' show BaseUseCase;

class GetTasksUseCase implements BaseUseCase<void, List<TaskModel>> {
  final Repository _repository;

  GetTasksUseCase(this._repository);

  @override
  Future<Either<FailureModel, List<TaskModel>>> execute(void input) =>
      _repository.getTasks();
}
