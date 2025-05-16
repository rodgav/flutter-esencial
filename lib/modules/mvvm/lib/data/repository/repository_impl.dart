import 'package:mvvm/app/utils/either.dart' show Either, Left, Right;
import 'package:mvvm/data/data_source/remote_data_source.dart' show RemoteDataSource;
import 'package:mvvm/data/mapper/task_response_mapper.dart';
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;
import 'package:mvvm/domain/model/task_model.dart' show TaskModel;
import 'package:mvvm/domain/repository/repository.dart' show Repository;

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<FailureModel, List<TaskModel>>> getTasks() async {
    try {
      final result = await _remoteDataSource.getTasks();
      return Right(result.toDomain());
    } catch (e) {
      return Left(FailureModel('', ''));
    }
  }
}
