# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Layer Domain 

domain/model/failure_model.dart

```dart
class FailureModel {
  final String code;
  final String message;

  FailureModel(this.code, this.message);
}
```

domain/model/task_model.dart
```dart
class TaskModel {
  final String id;
  final String name;

  TaskModel({required this.id, required this.name});
}
```

domain/repository/repository.dart
```dart
import 'package:clean_mvvm/domain/model/failure_model.dart';
import 'package:clean_mvvm/domain/model/task_model.dart';
import 'package:dartz/dartz.dart' show Either;

abstract class Repository {
  Future<Either<FailureModel, List<TaskModel>>> getTasks();
}
```

app/dependency_injection.dart metodo initModule
```dart
  ...
  getIt.registerLazySingleton<Repository>(
      () => RepositoryImpl(getIt<RemoteDataSourceImpl>()));
  getIt.registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(getIt<RepositoryImpl>()));
```

Regresamos a la capa data

data/repository/repository_impl.dart
```dart
import 'package:clean_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_mvvm/data/mapper/task_mapper.dart';
import 'package:clean_mvvm/domain/model/failure_model.dart';
import 'package:clean_mvvm/domain/model/task_model.dart';
import 'package:clean_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart' show Either, Right, Left;

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

```
data/mapper/task_mapper.dart
```dart
import 'package:clean_mvvm/data/response/task_response.dart';
import 'package:clean_mvvm/domain/model/task_model.dart';

extension TasksResponseExtension on List<TaskResponse>? {
  List<TaskModel> toDomain() =>
      this?.map((e) => e.toDomain()).toList() ?? List.empty();
}

extension TaskResponseExtension on TaskResponse? {
  TaskModel toDomain() {
    return TaskModel(id: this?.id ?? '', name: this?.name ?? '');
  }
}
```

domain/usecase/base_usecase.dart
```dart
import 'package:clean_mvvm/domain/model/failure_model.dart';
import 'package:dartz/dartz.dart' show Either;

abstract class BaseUseCase<In, Out> {
  Future<Either<FailureModel , Out>> execute(In input);
}
```

domain/usecase/get_tasks_usecase.dart
```dart
import 'package:clean_mvvm/domain/model/failure_model.dart';
import 'package:clean_mvvm/domain/model/task_model.dart';
import 'package:clean_mvvm/domain/repository/repository.dart';
import 'package:clean_mvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart' show Either;

class GetTasksUseCase implements BaseUseCase<void, List<TaskModel>> {
  final Repository _repository;

  GetTasksUseCase(this._repository);

  @override
  Future<Either<FailureModel, List<TaskModel>>> execute(void input) =>
      _repository.getTasks();
}
```

app/dependency_injection.dart metodo initModule
```dart
  ...
  getIt.registerLazySingleton<Repository>(
      () => RepositoryImpl(getIt<RemoteDataSourceImpl>()));
  getIt.registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(getIt<RepositoryImpl>()));
```