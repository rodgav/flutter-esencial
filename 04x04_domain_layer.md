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

app/utils/either.dart
```dart
abstract class Either<L, R> {
  factory Either.left(L value) = Left<L, R>;
  factory Either.right(R value) = Right<L, R>;

  T when<T>({required T Function(L left) left, required T Function(R right) right});
}

class Left<L, R> implements Either<L, R> {
  final L value;

  Left(this.value);

  @override
  T when<T>({required T Function(L left) left, required T Function(R right) right}) {
    return left(value);
  }
}

class Right<L, R> implements Either<L, R> {
  final R value;

  Right(this.value);

  @override
  T when<T>({required T Function(L left) left, required T Function(R right) right}) {
    return right(value);
  }
}

```

domain/repository/repository.dart
```dart
import 'package:mvvm/app/utils/either.dart' show Either;
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;
import 'package:mvvm/domain/model/task_model.dart' show TaskModel;

abstract class Repository {
  Future<Either<FailureModel, List<TaskModel>>> getTasks();
}
```

Regresamos a la capa data

data/repository/repository_impl.dart
```dart
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
```
data/mapper/task_response_mapper.dart
```dart
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
```

domain/usecase/base_usecase.dart
```dart
import 'package:mvvm/app/utils/either.dart' show Either;
import 'package:mvvm/domain/model/failure_model.dart' show FailureModel;

abstract class BaseUseCase<In, Out> {
  Future<Either<FailureModel, Out>> execute(In input);
}
```

domain/usecase/get_tasks_usecase.dart
```dart
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

```

app/dependency_injection.dart metodo initModule
```dart
  ...
  getIt.registerLazySingleton<Repository>(
      () => RepositoryImpl(getIt<RemoteDataSourceImpl>()));
  getIt.registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(getIt<RepositoryImpl>()));
```